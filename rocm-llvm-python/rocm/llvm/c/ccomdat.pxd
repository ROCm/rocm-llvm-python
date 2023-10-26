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

# This file has been autogenerated, do not modify.

from libc.stdint cimport *
ctypedef bint _Bool # bool is not a reserved keyword in C, _Bool is
from rocm.llvm.c.ctypes cimport *
cdef extern from "llvm-c/Comdat.h":

    ctypedef enum LLVMComdatSelectionKind:
        LLVMAnyComdatSelectionKind
        LLVMExactMatchComdatSelectionKind
        LLVMLargestComdatSelectionKind
        LLVMNoDeduplicateComdatSelectionKind
        LLVMSameSizeComdatSelectionKind

# 
# Return the Comdat in the module with the specified name. It is created
# if it didn't already exist.
# 
# @see llvm::Module::getOrInsertComdat()
cdef LLVMComdatRef LLVMGetOrInsertComdat(LLVMModuleRef M,const char * Name)


# 
# Get the Comdat assigned to the given global object.
# 
# @see llvm::GlobalObject::getComdat()
cdef LLVMComdatRef LLVMGetComdat(LLVMValueRef V)


# 
# Assign the Comdat to the given global object.
# 
# @see llvm::GlobalObject::setComdat()
cdef void LLVMSetComdat(LLVMValueRef V,LLVMComdatRef C)



cdef LLVMComdatSelectionKind LLVMGetComdatSelectionKind(LLVMComdatRef C)



cdef void LLVMSetComdatSelectionKind(LLVMComdatRef C,LLVMComdatSelectionKind Kind)
