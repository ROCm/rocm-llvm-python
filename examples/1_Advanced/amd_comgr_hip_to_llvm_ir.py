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

"""In this example, we generate LLVM IR from HIP C++ code.

This time we use AMD COMGR infrastructure. This requires us to use the 
`hiprtc_runtime.h` header file that HIPRTC is using internally.

During the ROCm LLVM Python package preperation, we generate this header file
and put it into the `rocm.amd_comgr.amd_comgr.ext.HIPRTC_RUNTIME_HEADER` 
variable.
"""

__author__ = "Advanced Micro Devices, Inc. <hip-python.maintainer@amd.com>"

# [literalinclude-begin]
import copy

from rocm.amd_comgr import amd_comgr, ROCM_VERSION_TUPLE

from rocm.llvm.c.core import *
from rocm.llvm.c.bitreader import LLVMParseBitcode2


def llvm_check(status, message):
    if status != 0:
        msg_str = str(message)
        LLVMDisposeMessage(message)
        raise RuntimeError(f"{msg_str}")


class HipProgram:
    def __init__(self, name: str, arch: str, source: bytes):
        self.hip_source = source
        self.name = name.encode("utf-8")
        self.llvm_bc_or_ir = None
        self.llvm_bc_or_ir_size = None
        self.log = None
        self.diagnostic = None
        self._compile_to_llvm_bc(arch)

    def _compile_to_llvm_bc(self, arch: str):
        (
            self.llvm_bc_or_ir,
            self.log,
            self.diagnostic,
        ) = amd_comgr.ext.compile_hip_to_bc(
            source=self.hip_source,
            isa_name=f"amdgcn-amd-amdhsa--{arch}",
            hip_version_tuple=ROCM_VERSION_TUPLE,  # ! only same up to last entry
            logging=True,
            extra_opts=" -D__HIPCC_RTC__ ",
        )
        self.llvm_bc_or_ir_size = len(self.llvm_bc_or_ir)

    def get_llvm_ir(self):
        assert self.llvm_bc_or_ir != None, "run '_compile_to_llvm_bc' first"
        buf = LLVMCreateMemoryBufferWithMemoryRange(
            self.llvm_bc_or_ir,
            self.llvm_bc_or_ir_size,
            b"llvm-ir-buffer",
            0,
        )
        (status, mod) = LLVMParseBitcode2(buf)
        llvm_check(status, "failed to parse bitcode")
        ir = LLVMPrintModuleToString(mod)
        result = copy.deepcopy(bytes(ir))  # copies into buffer
        LLVMDisposeMessage(ir)
        LLVMDisposeModule(mod)
        LLVMDisposeMemoryBuffer(buf)
        return result

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        pass


if __name__ == "__main__":
    import textwrap

    kernel_hip = textwrap.dedent(
        amd_comgr.ext.HIPRTC_RUNTIME_HEADER
        + """\
        
        __device__ static inline void scale(float arr[], float factor) {
            arr[threadIdx.x] *= fabs(factor);
        }
        """
    ).encode("utf-8")

    arch = "gfx90a"
    with HipProgram("kernel", arch, kernel_hip) as kernel_prog:
        print(kernel_prog.get_llvm_ir().decode("utf-8"))
    print("ok")
