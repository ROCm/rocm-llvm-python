#!/usr/bin/env python3
# MIT License
#
# Copyright (c) 2023-2025 Advanced Micro Devices, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

"""This example generates HSA assembly (for gfx942) from LLVM IR (for gfx942).

We use AMD COMGR infrastructure as hipRTC does not yet provide a similar
compilation variant.

Note:
    We derived the LLVM IR input from the original HIP C++ source via
    the below command:

    ```shell
    hipcc -emit-llvm -S --offload-arch=gfx942 vector_add.hip -o - | sed -n "/hip-amdgcn-amd-amdhsa--gfx942/,/hip-amdgcn-amd-amdhsa--gfx942/p"
    ```
"""  # noqa: E501

__author__ = "Advanced Micro Devices, Inc. <hip-python.maintainer@amd.com>"

# [literalinclude-begin]
from rocm.amd_comgr import amd_comgr


class LLVMProgram:
    def __init__(self, name: str, arch: str, source: bytes):
        self.hip_source = source
        self.name = name.encode("utf-8")
        self.hsa = None  # type: bytes
        self.hsa_size = None
        self.log = None
        self.diagnostic = None
        self._compile_to_hsa(arch)

    def _compile_to_hsa(self, arch: str):
        (
            self.hsa,
            self.log,
            self.diagnostic,
        ) = amd_comgr.ext.compile_bc_to_hsa(
            source=self.hip_source,
            isa_name=f"amdgcn-amd-amdhsa--{arch}",
            logging=True,
        )
        self.hsa_size = len(self.hsa)


if __name__ in ("__test__", "__main__"):
    import textwrap

    # The original HIP C++ source that was used to generate the below LLVM IR.
    _original_hip_kernel = textwrap.dedent(
        """\
        #include <hip/hip_runtime.h>

        extern "C" __global__ void vector_add(float* output, float* input1,
                                   float* input2, size_t size) {
            int i = threadIdx.x;
            if (i < size) {
                output[i] = input1[i] + input2[i];
            }
        }
        """
    )  # noqa: F401

    # Generated from the original HIP C++ source; see details at the top of
    # this file.
    kernel_llvm_ir = textwrap.dedent(
        """\
        ; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa--gfx942
        ; ModuleID = 'vector_add.hip'
        source_filename = "vector_add.hip"
        target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
        target triple = "amdgcn-amd-amdhsa"

        @__hip_cuid_7c7f9d3655421f20 = addrspace(1) global i8 0
        @llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_7c7f9d3655421f20 to ptr)], section "llvm.metadata"

        ; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
        define protected amdgpu_kernel void @vector_add(ptr addrspace(1) nocapture noundef writeonly %0, ptr addrspace(1) nocapture noundef readonly %1, ptr addrspace(1) nocapture noundef readonly %2, i64 noundef %3) local_unnamed_addr #0 {
        %5 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
        %6 = zext nneg i32 %5 to i64
        %7 = icmp ugt i64 %3, %6
        br i1 %7, label %8, label %15

        8:                                                ; preds = %4
        %9 = getelementptr inbounds nuw float, ptr addrspace(1) %0, i64 %6
        %10 = getelementptr inbounds nuw float, ptr addrspace(1) %2, i64 %6
        %11 = getelementptr inbounds nuw float, ptr addrspace(1) %1, i64 %6
        %12 = load float, ptr addrspace(1) %11, align 4, !tbaa !6
        %13 = load float, ptr addrspace(1) %10, align 4, !tbaa !6
        %14 = fadd contract float %12, %13
        store float %14, ptr addrspace(1) %9, align 4, !tbaa !6
        br label %15

        15:                                               ; preds = %8, %4
        ret void
        }

        ; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
        declare noundef i32 @llvm.amdgcn.workitem.id.x() #1

        attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-agpr" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-ds-pk-add-16-insts,+atomic-fadd-rtn-insts,+atomic-flat-pk-add-16-insts,+atomic-global-pk-add-bf16-inst,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+fp8-conversion-insts,+fp8-insts,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gfx940-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64,+xf32-insts" "uniform-work-group-size"="true" }
        attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

        !llvm.module.flags = !{!0, !1, !2, !3}
        !opencl.ocl.version = !{!4}
        !llvm.ident = !{!5}

        !0 = !{i32 1, !"amdhsa_code_object_version", i32 600}
        !1 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
        !2 = !{i32 1, !"wchar_size", i32 4}
        !3 = !{i32 8, !"PIC Level", i32 2}
        !4 = !{i32 2, i32 0}
        !5 = !{!"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25304 82aed4e69d70bef3c89c38a2ee85c8c41294dfc9)"}
        !6 = !{!7, !7, i64 0}
        !7 = !{!"float", !8, i64 0}
        !8 = !{!"omnipotent char", !9, i64 0}
        !9 = !{!"Simple C++ TBAA"}

        ; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa--gfx942
        """  # noqa: E501
    ).encode(
        "utf-8"
    )  # noqa: E501

    arch = "gfx942"
    kernel_prog = LLVMProgram("kernel", arch, kernel_llvm_ir)
    hsa_result = kernel_prog.hsa.decode()
    print(hsa_result)

    # [literalinclude-end]

    # NOTE: The result might differ for other versions of the compiler,
    #       must be continuously tested and updated.

    hsa_result_expected = """
        .amdgcn_target "amdgcn-amd-amdhsa--gfx942"
        .amdhsa_code_object_version 6
        .text
        .protected      vector_add              ; -- Begin function vector_add
        .globl  vector_add
        .p2align        8
        .type   vector_add,@function
vector_add:                             ; @vector_add
; %bb.0:
        s_load_dwordx2 s[6:7], s[0:1], 0x0
        s_load_dwordx2 s[4:5], s[0:1], 0x8
        s_load_dwordx2 s[2:3], s[0:1], 0x10
        s_nop 0
        s_load_dwordx2 s[0:1], s[0:1], 0x18
                                        ; implicit-def: $vgpr6 : SGPR spill to VGPR lane
        s_waitcnt lgkmcnt(0)
        v_writelane_b32 v6, s6, 0
        s_nop 1
        v_writelane_b32 v6, s7, 1
        v_writelane_b32 v6, s4, 2
        s_nop 1
        v_writelane_b32 v6, s5, 3
        v_writelane_b32 v6, s2, 4
        s_nop 1
        v_writelane_b32 v6, s3, 5
        s_mov_b32 s2, 0
                                        ; implicit-def: $sgpr2
        v_mov_b32_e32 v2, 0
                                        ; kill: def $vgpr0 killed $vgpr0 def $vgpr0_vgpr1 killed $exec
        v_mov_b32_e32 v1, v2
        v_mov_b64_e32 v[2:3], v[0:1]
        scratch_store_dwordx2 off, v[2:3], off offset:4 ; 8-byte Folded Spill
        v_cmp_gt_u64_e64 s[2:3], s[0:1], v[0:1]
        s_mov_b64 s[0:1], exec
        v_writelane_b32 v6, s0, 6
        s_nop 1
        v_writelane_b32 v6, s1, 7
        s_or_saveexec_b64 s[8:9], -1
        scratch_store_dword off, v6, off        ; 4-byte Folded Spill
        s_mov_b64 exec, s[8:9]
        s_and_b64 s[0:1], s[0:1], s[2:3]
        s_mov_b64 exec, s[0:1]
        s_cbranch_execz .LBB0_2
; %bb.1:
        s_or_saveexec_b64 s[8:9], -1
        scratch_load_dword v6, off, off         ; 4-byte Folded Reload
        s_mov_b64 exec, s[8:9]
        s_waitcnt vmcnt(0)
        v_readlane_b32 s0, v6, 2
        v_readlane_b32 s1, v6, 3
        v_readlane_b32 s2, v6, 4
        v_readlane_b32 s3, v6, 5
        v_readlane_b32 s4, v6, 0
        v_readlane_b32 s5, v6, 1
        scratch_load_dwordx2 v[0:1], off, off offset:4 ; 8-byte Folded Reload
        s_mov_b32 s6, 2
        s_waitcnt vmcnt(0)
        v_lshlrev_b64 v[2:3], s6, v[0:1]
        v_lshl_add_u64 v[0:1], s[4:5], 0, v[2:3]
        v_lshl_add_u64 v[4:5], s[2:3], 0, v[2:3]
        v_lshl_add_u64 v[2:3], s[0:1], 0, v[2:3]
        global_load_dword v2, v[2:3], off
        s_nop 0
        global_load_dword v3, v[4:5], off
        s_waitcnt vmcnt(0)
        v_add_f32_e64 v2, v2, v3
        global_store_dword v[0:1], v2, off
.LBB0_2:
        s_or_saveexec_b64 s[8:9], -1
        scratch_load_dword v6, off, off         ; 4-byte Folded Reload
        s_mov_b64 exec, s[8:9]
        s_waitcnt vmcnt(0)
        v_readlane_b32 s0, v6, 6
        v_readlane_b32 s1, v6, 7
        s_or_b64 exec, exec, s[0:1]
        s_endpgm
        .section        .rodata,"a",@progbits
        .p2align        6, 0x0
        .amdhsa_kernel vector_add
                .amdhsa_group_segment_fixed_size 0
                .amdhsa_private_segment_fixed_size 16
                .amdhsa_kernarg_size 32
                .amdhsa_user_sgpr_count 2
                .amdhsa_user_sgpr_dispatch_ptr 0
                .amdhsa_user_sgpr_queue_ptr 0
                .amdhsa_user_sgpr_kernarg_segment_ptr 1
                .amdhsa_user_sgpr_dispatch_id 0
                .amdhsa_user_sgpr_kernarg_preload_length 0
                .amdhsa_user_sgpr_kernarg_preload_offset 0
                .amdhsa_user_sgpr_private_segment_size 0
                .amdhsa_uses_dynamic_stack 0
                .amdhsa_enable_private_segment 1
                .amdhsa_system_sgpr_workgroup_id_x 1
                .amdhsa_system_sgpr_workgroup_id_y 0
                .amdhsa_system_sgpr_workgroup_id_z 0
                .amdhsa_system_sgpr_workgroup_info 0
                .amdhsa_system_vgpr_workitem_id 0
                .amdhsa_next_free_vgpr 7
                .amdhsa_next_free_sgpr 10
                .amdhsa_accum_offset 8
                .amdhsa_reserve_vcc 0
                .amdhsa_float_round_mode_32 0
                .amdhsa_float_round_mode_16_64 0
                .amdhsa_float_denorm_mode_32 3
                .amdhsa_float_denorm_mode_16_64 3
                .amdhsa_dx10_clamp 1
                .amdhsa_ieee_mode 1
                .amdhsa_fp16_overflow 0
                .amdhsa_tg_split 0
                .amdhsa_exception_fp_ieee_invalid_op 0
                .amdhsa_exception_fp_denorm_src 0
                .amdhsa_exception_fp_ieee_div_zero 0
                .amdhsa_exception_fp_ieee_overflow 0
                .amdhsa_exception_fp_ieee_underflow 0
                .amdhsa_exception_fp_ieee_inexact 0
                .amdhsa_exception_int_div_zero 0
        .end_amdhsa_kernel
        .text
.Lfunc_end0:
        .size   vector_add, .Lfunc_end0-vector_add
                                        ; -- End function
        .set vector_add.num_vgpr, 7
        .set vector_add.num_agpr, 0
        .set vector_add.numbered_sgpr, 10
        .set vector_add.private_seg_size, 16
        .set vector_add.uses_vcc, 0
        .set vector_add.uses_flat_scratch, 0
        .set vector_add.has_dyn_sized_stack, 0
        .set vector_add.has_recursion, 0
        .set vector_add.has_indirect_call, 0
        .section        .AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 384
; TotalNumSgprs: 16
; NumVgprs: 7
; NumAgprs: 0
; TotalNumVgprs: 7
; ScratchSize: 16
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 16
; NumVGPRsForWavesPerEU: 7
; AccumOffset: 8
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 1
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
        .text
        .p2alignl 6, 3212836864
        .fill 256, 4, 3212836864
        .section        .AMDGPU.gpr_maximums,"",@progbits
        .set amdgpu.max_num_vgpr, 0
        .set amdgpu.max_num_agpr, 0
        .set amdgpu.max_num_sgpr, 0
        .text
        .type   __hip_cuid_7c7f9d3655421f20,@object ; @__hip_cuid_7c7f9d3655421f20
        .section        .bss,"aw",@nobits
        .globl  __hip_cuid_7c7f9d3655421f20
__hip_cuid_7c7f9d3655421f20:
        .byte   0                               ; 0x0
        .size   __hip_cuid_7c7f9d3655421f20, 1

        .ident  "AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25304 82aed4e69d70bef3c89c38a2ee85c8c41294dfc9)"
        .section        ".note.GNU-stack","",@progbits
        .addrsig
        .addrsig_sym __hip_cuid_7c7f9d3655421f20
        .amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
      - .offset:         24
        .size:           8
        .value_kind:     by_value
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 32
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           vector_add
    .private_segment_fixed_size: 16
    .sgpr_count:     16
    .sgpr_spill_count: 8
    .symbol:         vector_add.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     7
    .vgpr_spill_count: 3
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx942
amdhsa.version:
  - 1
  - 2
...

        .end_amdgpu_metadata
"""  # noqa: E501

    def _clean_snippet(snippet):
        return snippet.replace(" ", "").replace("\t", "").replace("\n", "")

    assert _clean_snippet(hsa_result_expected) == _clean_snippet(hsa_result)

    print("ok")
