#!/usr/bin/env python3
# MIT License
#
# Copyright (c) 2023-2024 Advanced Micro Devices, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

"""In this example, we link a device code file that contains
a HIP C++ device kernel "__global__ void scale(float[],float)" that has an unresolved call
to a function "__device__ void scale_op(float[],float)" in its body with a
LLVM IR file that contains the definition of device function "scale_op".

To make this work, the HIP C++ snippet needs to be compiled with
the ``-fgpu-rdc`` option and the compilation results needs to
be added as `HIPRTC_JIT_INPUT_LLVM_BITCODE` type input to the link object.
"""

__author__ = "Advanced Micro Devices, Inc. <hip-python.maintainer@amd.com>"

# [literalinclude-begin]
import array
import copy
import ctypes
import math

from hip import hip, hiprtc

from rocm.llvm.c.core import *
from rocm.llvm.c.bitreader import LLVMParseBitcode2
from rocm.llvm.c.bitwriter import LLVMWriteBitcodeToMemoryBuffer
from rocm.llvm.c.irreader import LLVMParseIRInContext

def hip_check(call_result):
    err = call_result[0]
    result = call_result[1:]
    if len(result) == 1:
        result = result[0]
    if isinstance(err, hip.hipError_t) and err != hip.hipError_t.hipSuccess:
        raise RuntimeError(str(err))
    elif (
        isinstance(err, hiprtc.hiprtcResult)
        and err != hiprtc.hiprtcResult.HIPRTC_SUCCESS
    ):
        raise RuntimeError(str(err))
    return result

def llvm_check(status,message):
    if status != 0:
        msg_str = str(message)
        LLVMDisposeMessage(message)
        raise RuntimeError(f"{msg_str}")

class LLVMIRProgram:
    def __init__(self, name: str, source: bytes):
        self.llvm_ir = source
        self.name = name.encode("utf-8")
        self.prog = None
        self.bc_buf = None
        self.llvm_bitcode = None
        self.llvm_bitcode_size = None

    def translate_to_llvm_bc(self):
        ir_buf = LLVMCreateMemoryBufferWithMemoryRange(
            self.llvm_ir,
            len(self.llvm_ir),
            b"llvm-ir-buffer",
            0,
        )
        context = LLVMContextCreate()
        (status, mod, message) = LLVMParseIRInContext(context, ir_buf)
        llvm_check(status,message)
        self.bc_buf = LLVMWriteBitcodeToMemoryBuffer(mod)
        self.llvm_bitcode = LLVMGetBufferStart(self.bc_buf).as_c_void_p() # store in ctypes form to be compatible with hip python datatypes
        self.llvm_bitcode_size = LLVMGetBufferSize(self.bc_buf)
        LLVMDisposeModule(mod)
        LLVMContextDispose(context)
        # LLVMDisposeMemoryBuffer(ir_buf) # TODO LLVMParseIRInContext seems to consume the buffer, memory analysis needed

    def get_llvm_ir(self):
        return source

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if self.bc_buf != None:
            LLVMDisposeMemoryBuffer(self.bc_buf)

class HipProgram:
    def __init__(self, name: str, source: bytes):
        self.hip_source = source
        self.name = name.encode("utf-8")
        self.prog = None
        self.llvm_bitcode = None
        self.llvm_bitcode_size = None

    def _get_arch(self) -> bytes:
        props = hip.hipDeviceProp_t()
        hip_check(hip.hipGetDeviceProperties(props, 0))
        return props.gcnArchName

    def compile_to_llvm_bc(self):
        self.prog = hip_check(
            hiprtc.hiprtcCreateProgram(self.hip_source, self.name, 0, [], [])
        )
        cflags = [b"--offload-arch=" + self._get_arch(), b"-fgpu-rdc"]
        (err,) = hiprtc.hiprtcCompileProgram(self.prog, len(cflags), cflags)
        if err != hiprtc.hiprtcResult.HIPRTC_SUCCESS:
            log_size = hip_check(hiprtc.hiprtcGetProgramLogSize(self.prog))
            log = bytearray(log_size)
            hip_check(hiprtc.hiprtcGetProgramLog(self.prog, log))
            raise RuntimeError(log.decode())
        self.llvm_bitcode_size = hip_check(hiprtc.hiprtcGetBitcodeSize(self.prog))
        self.llvm_bitcode = bytearray(self.llvm_bitcode_size)
        hip_check(hiprtc.hiprtcGetBitcode(self.prog, self.llvm_bitcode))

    def get_llvm_ir(self):
        assert self.llvm_bitcode != None, "run 'compile_to_llvm_bc' first"
        buf = LLVMCreateMemoryBufferWithMemoryRange(
            self.llvm_bitcode,
            self.llvm_bitcode_size,
            b"llvm-ir-buffer",
            0,
        )
        (status, mod) = LLVMParseBitcode2(buf)
        llvm_check(status,"failed to parse bitcode")
        ir = LLVMPrintModuleToString(mod)
        result = copy.deepcopy(bytes(ir)) # copies into buffer
        LLVMDisposeMessage(ir)
        LLVMDisposeModule(mod)
        LLVMDisposeMemoryBuffer(buf)
        return result

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if self.prog != None:
            hip_check(hiprtc.hiprtcDestroyProgram(self.prog.createRef()))

class HiprtcLinker:
    def __init__(self):
        self.link_state = hip_check(hiprtc.hiprtcLinkCreate(0, None, None))
        self.completed = False
        self.code = None
        self.code_size = None

    def add_program(self, program):
        hip_check(
            hiprtc.hiprtcLinkAddData(
                self.link_state,
                hiprtc.hiprtcJITInputType.HIPRTC_JIT_INPUT_LLVM_BITCODE,
                program.llvm_bitcode,
                program.llvm_bitcode_size,
                program.name,
                0,  # size of the options
                None,  # Array of options applied to this input
                None,
            )
        )
        # Array of option values cast to void*

    def complete(self):
        self.code, self.code_size = hip_check(
            hiprtc.hiprtcLinkComplete(self.link_state)
        )

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        hip_check(hiprtc.hiprtcLinkDestroy(self.link_state))

if __name__ == "__main__":
    import textwrap

    kernel_hip = textwrap.dedent(
        """\
        // prototypes
        __device__ void scale_op(float arr[], float factor);
        __device__ void print_val(float arr[]);

        extern "C" __global__ void scale(float arr[], float factor) {
            scale_op(arr, factor);
            print_val(arr);
        }
        """
    ).encode("utf-8")

    print_val_hip = textwrap.dedent(
        """\
        __device__ void print_val(float arr[]) {
            printf("%f\\n",arr[threadIdx.x]);
        }
        """
    ).encode("utf-8")

    scale_op_llvm_ir = textwrap.dedent(
        """\
        ; ModuleID = 'llvm-ir-buffer'
        source_filename = "scale_op.hip"
        target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
        target triple = "amdgcn-amd-amdhsa"

        ; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
        define hidden void @_Z8scale_opPff(ptr nocapture %0, float %1) local_unnamed_addr #0 {
            %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !0, !noundef !1
            %4 = zext i32 %3 to i64
            %5 = getelementptr inbounds float, ptr %0, i64 %4
            %6 = load float, ptr %5, align 4, !tbaa !2
            %7 = fmul contract float %6, %1
            store float %7, ptr %5, align 4, !tbaa !2
            ret void
        }

        ; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
        declare i32 @llvm.amdgcn.workitem.id.x() #1

        attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+cumode,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+sramecc,+wavefrontsize64,-xnack" }
        attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

        !0 = !{i32 0, i32 1024}
        !1 = !{}
        !2 = !{!3, !3, i64 0}
        !3 = !{!"float", !4, i64 0}
        !4 = !{!"omnipotent char", !5, i64 0}
        !5 = !{!"Simple C++ TBAA"}
        """
    ).encode("utf-8")

    # scale_op_hip = textwrap.dedent(
    #     """\
    #     __device__ void scale_op(float arr[], float factor) {
    #         arr[threadIdx.x] *= factor;
    #     }
    #     """
    # ).encode("utf-8")

    with HiprtcLinker() as linker, HipProgram(
            "kernel", kernel_hip) as kernel_prog, HipProgram(
                #"scale_op", scale_op_hip) as scale_op_prog, LLVMIRProgram(
                "print_val",print_val_hip) as print_val_prog, LLVMIRProgram(
                    "scale_op", scale_op_llvm_ir) as scale_op_prog_llvm:
        kernel_prog.compile_to_llvm_bc()
        print_val_prog.compile_to_llvm_bc()
        # scale_op_prog.compile_to_llvm_bc()
        # print(scale_op_prog.get_llvm_ir().decode("utf-8"))
        scale_op_prog_llvm.translate_to_llvm_bc()
        linker.add_program(kernel_prog)
        linker.add_program(print_val_prog)
        linker.add_program(scale_op_prog_llvm)
        linker.complete()
        module = hip_check(hip.hipModuleLoadData(linker.code))
        kernel = hip_check(hip.hipModuleGetFunction(module, b"scale"))

        f32, size = 4, 32
        xh = array.array('f',[1.0]*size)
        xd = hip_check(hip.hipMalloc(f32*size))
        hip_check(hip.hipMemcpy(xd,xh,f32*size,hip.hipMemcpyKind.hipMemcpyHostToDevice))
        hip_check(
            hip.hipModuleLaunchKernel(
                kernel,
                *(1, 1, 1),  # grid
                *(32, 1, 1),  # block
                sharedMemBytes=0,
                stream=None,
                kernelParams=None,
                extra=(
                    xd,
                    ctypes.c_float(2.0),
                )
            )
        )
        hip_check(hip.hipMemcpy(xh,xd,f32*size,hip.hipMemcpyKind.hipMemcpyHostToDevice))
        hip_check(hip.hipFree(xd))
        hip_check(hip.hipModuleUnload(module))
        
        for i in range(0,size):
            assert math.isclose(xh[i],2.0), f"failed at pos {i}"
        print("ok")