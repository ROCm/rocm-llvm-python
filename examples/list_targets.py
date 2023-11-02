#!/usr/bin/env python3
# MIT License
# 
# Copyright (c) 2023 Advanced Micro Devices, Inc.
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

"""Listing installed targets

This example shows how to list the installed targets
and obtain information such as their description.
"""

from rocm.llvm.c.target import *
from rocm.llvm.c.targetmachine import *

print("List of installed targets:")
LLVMInitializeAllTargetInfos() # all three inits are required
LLVMInitializeAllTargets()
LLVMInitializeAllTargetMCs()
tgt = LLVMGetFirstTarget()
while tgt:
    print(f"- {str(LLVMGetTargetName(tgt))}")
    tgt = LLVMGetNextTarget(tgt)

print("Getting target for 'amdgcn-amd-amdhsa':")
(status,tgt,error) = LLVMGetTargetFromTriple(b"amdgcn-amd-amdhsa")
if tgt:
    print(f"- {LLVMGetTargetName(tgt)}")
