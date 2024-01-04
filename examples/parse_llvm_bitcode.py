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

"""How to parse LLVM bitcode files

This example shows how to open and parse a user-supplied
bitcode file (via path). The example lists all function names and
the number of functions in the file.
"""

# [literalinclude-begin]
import argparse
import ctypes

from rocm.llvm.c.core import *
from rocm.llvm.c.bitreader import LLVMParseBitcode2

parser = argparse.ArgumentParser(description="Counts number of functions found in the BC file and prints their name.")
parser.add_argument("path",type=str)
args = parser.parse_args()

def check_status(status,message):
    if status != 0:
        print(f"{str(message)}",)
        LLVMDisposeMessage(message)

(status, buffer, message) = LLVMCreateMemoryBufferWithContentsOfFile(args.path.encode("utf-8"))
check_status(status,message)

(status, mod) = LLVMParseBitcode2(buffer)
check_status(status,"failed to parse bitcode")

num_functions = 0
fn = LLVMGetFirstFunction(mod) # a value type
while fn:
    name, name_len = LLVMGetValueName2(fn)
    if name:
        print(name)
    # TODO parse more information
    # https://marc.info/?l=llvm-dev&m=121146785917299&w=2
    # fn_type = LLVMTypeOf(fn)
    num_functions += 1
    fn = LLVMGetNextFunction(fn)
print(num_functions)

