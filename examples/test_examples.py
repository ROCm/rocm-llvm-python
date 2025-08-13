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

import os
import runpy

import pytest

have_gpu = False
have_gfx90a = False
have_matching_hip_python = False
hiprtc_cannot_produce_llvm_bitcode = False

try:
    import hip
except Exception:
    pass
else:
    import rocm.llvm
    from hip import hip as hiprt

    hiprtc_cannot_produce_llvm_bitcode = rocm.llvm.ROCM_VERSION_TUPLE == (
        6,
        1,
        0,
    )

    have_matching_hip_python = hip.ROCM_VERSION == rocm.llvm.ROCM_VERSION

    _, count = hiprt.hipGetDeviceCount()
    if count > 0:
        have_gpu = True
        props = hiprt.hipDeviceProp_t()
        hiprt.hipGetDeviceProperties(props, 0)
        gpugen = props.gcnArchName.decode("utf-8").split(":")[0]
        have_gfx90a = gpugen == "gfx90a"


@pytest.mark.parametrize(
    "example",
    [
        "0_Basic/list_targets.py",
        "0_Basic/parse_llvm_bitcode.py",
        # "0_Basic/execution_engine_sum.py", # TODO only direct running works?
        "0_Basic/amd_comgr_parse_amd_hsa_kernel_descriptor.py",
        "0_Basic/amd_comgr_disassemble_amdgpu_program.py",
        "0_Basic/amd_comgr_disassemble_amdgpu_code_obj.py",
        "1_Advanced/amd_comgr_hip_to_llvm_ir.py",
        "1_Advanced/hiprtc_amd_comgr_hip_to_hsa.py",  # note: hip-python optional  # noqa: E501
        "1_Advanced/amd_comgr_llvm_ir_to_hsa.py",
        "1_Advanced/hiprtc_amd_comgr_hsa_to_code_obj.py",  # note: hip-python optional  # noqa: E501
        pytest.param(
            "1_Advanced/hiprtc_amd_comgr_get_jit_kernel_metadata.py",
            marks=[
                pytest.mark.skipif(
                    not have_matching_hip_python,
                    reason="requires that 'hip-python' is installed",
                ),
            ],
        ),
        pytest.param(
            "1_Advanced/hiprtc_hip_to_llvm_ir.py",
            marks=pytest.mark.skipif(
                not have_gpu or not have_matching_hip_python,
                reason="requires AMD GPU and that 'hip-python' is installed",
            ),
        ),
        pytest.param(
            "1_Advanced/hiprtc_linking_with_llvm_ir.py",
            marks=pytest.mark.skipif(
                (
                    not have_matching_hip_python
                    or not have_gpu
                    or not have_gfx90a
                    or hiprtc_cannot_produce_llvm_bitcode
                ),
                reason=(
                    "requires that compatible GPU target (==gfx90a) is "
                    "present, 'hip-python' is installed, and that hipRTC "
                    + " can produce bitcode (ROCm != 6.1.0)"
                ),
            ),
        ),
    ],
)
def test_python_examples(example):
    abspath = os.path.join(os.path.dirname(__file__), example)
    runpy.run_path(abspath, run_name="__test__")
