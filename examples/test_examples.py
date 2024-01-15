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

import runpy
import os

import pytest

try:
    import rocm.llvm
    import hip

    have_matching_hip_python = hip.ROCM_VERSION == rocm.llvm.ROCM_VERSION
except:
    have_matching_hip_python = False

python_examples = [
    "0_Basic/list_targets.py",
    "0_Basic/parse_llvm_bitcode.py",
    # "./execution_engine_sum.py", # seems only to work when run directly, TODO
]

if have_matching_hip_python:
    python_examples += [
        "1_Advanced/hiprtc_amd_comgr_get_jit_kernel_metadata.py",
        "1_Advanced/hiprtc_hip_to_llvm_ir.py",
        "1_Advanced/hiprtc_linking_with_llvm_ir.py",
    ]


@pytest.mark.parametrize("example", python_examples)
def test_python_examples(example):
    abspath = os.path.join(os.path.dirname(__file__), example)
    runpy.run_path(abspath, run_name="__test__")