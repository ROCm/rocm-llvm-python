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

# This file has been autogenerated, do not modify.

from libc.stdint cimport *
ctypedef bint _Bool # bool is not a reserved keyword in C, _Bool is
from rocm.llvm.c.cerror cimport *
from rocm.llvm.c.cexecutionengine cimport *
from rocm.llvm.c.corc cimport *
from rocm.llvm.c.ctargetmachine cimport *
from rocm.llvm.c.ctypes cimport *
# 
# Create a RTDyldObjectLinkingLayer instance using the standard
# SectionMemoryManager for memory management.
cdef LLVMOrcObjectLayerRef LLVMOrcCreateRTDyldObjectLinkingLayerWithSectionMemoryManager(LLVMOrcExecutionSessionRef ES)


# 
# Add the given listener to the given RTDyldObjectLinkingLayer.
# 
# Note: Layer must be an RTDyldObjectLinkingLayer instance or
# behavior is undefined.
cdef void LLVMOrcRTDyldObjectLinkingLayerRegisterJITEventListener(LLVMOrcObjectLayerRef RTDyldObjLinkingLayer,LLVMJITEventListenerRef Listener)
