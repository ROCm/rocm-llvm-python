# MIT License
#
# Copyright (c) 2021-2025 Advanced Micro Devices, Inc.
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
from rocm.llvm.config.cllvm_config cimport *
cdef extern from "llvm-c/Target.h":

    cdef enum LLVMByteOrdering:
        LLVMBigEndian
        LLVMLittleEndian

    cdef struct LLVMOpaqueTargetData:
        pass

    ctypedef LLVMOpaqueTargetData * LLVMTargetDataRef

    cdef struct LLVMOpaqueTargetLibraryInfotData:
        pass

    ctypedef LLVMOpaqueTargetLibraryInfotData * LLVMTargetLibraryInfoRef

# LLVMInitializeAllTargetInfos - The main program should call this function if
# it wants access to all available targets that LLVM is configured to
# support.
cdef void LLVMInitializeAllTargetInfos()


# LLVMInitializeAllTargets - The main program should call this function if it
# wants to link in all available targets that LLVM is configured to
# support.
cdef void LLVMInitializeAllTargets()


# LLVMInitializeAllTargetMCs - The main program should call this function if
# it wants access to all available target MC that LLVM is configured to
# support.
cdef void LLVMInitializeAllTargetMCs()


# LLVMInitializeAllAsmPrinters - The main program should call this function if
# it wants all asm printers that LLVM is configured to support, to make them
# available via the TargetRegistry.
cdef void LLVMInitializeAllAsmPrinters()


# LLVMInitializeAllAsmParsers - The main program should call this function if
# it wants all asm parsers that LLVM is configured to support, to make them
# available via the TargetRegistry.
cdef void LLVMInitializeAllAsmParsers()


# LLVMInitializeAllDisassemblers - The main program should call this function
# if it wants all disassemblers that LLVM is configured to support, to make
# them available via the TargetRegistry.
cdef void LLVMInitializeAllDisassemblers()


# LLVMInitializeNativeTarget - The main program should call this function to
# initialize the native target corresponding to the host.  This is useful
# for JIT applications to ensure that the target gets linked in correctly.
cdef int LLVMInitializeNativeTarget()


# LLVMInitializeNativeTargetAsmParser - The main program should call this
# function to initialize the parser for the native target corresponding to the
# host.
cdef int LLVMInitializeNativeAsmParser()


# LLVMInitializeNativeTargetAsmPrinter - The main program should call this
# function to initialize the printer for the native target corresponding to
# the host.
cdef int LLVMInitializeNativeAsmPrinter()


# LLVMInitializeNativeTargetDisassembler - The main program should call this
# function to initialize the disassembler for the native target corresponding
# to the host.
cdef int LLVMInitializeNativeDisassembler()


# 
# Obtain the data layout for a module.
# 
# @see Module::getDataLayout()
cdef LLVMTargetDataRef LLVMGetModuleDataLayout(LLVMModuleRef M)


# 
# Set the data layout for a module.
# 
# @see Module::setDataLayout()
cdef void LLVMSetModuleDataLayout(LLVMModuleRef M,LLVMTargetDataRef DL)


# Creates target data from a target layout string.
# See the constructor llvm::DataLayout::DataLayout.
cdef LLVMTargetDataRef LLVMCreateTargetData(const char * StringRep)


# Deallocates a TargetData.
# See the destructor llvm::DataLayout::~DataLayout.
cdef void LLVMDisposeTargetData(LLVMTargetDataRef TD)


# Adds target library information to a pass manager. This does not take
# ownership of the target library info.
# See the method llvm::PassManagerBase::add.
cdef void LLVMAddTargetLibraryInfo(LLVMTargetLibraryInfoRef TLI,LLVMPassManagerRef PM)


# Converts target data to a target layout string. The string must be disposed
# with LLVMDisposeMessage.
# See the constructor llvm::DataLayout::DataLayout.
cdef char * LLVMCopyStringRepOfTargetData(LLVMTargetDataRef TD)


# Returns the byte order of a target, either LLVMBigEndian or
# LLVMLittleEndian.
# See the method llvm::DataLayout::isLittleEndian.
cdef LLVMByteOrdering LLVMByteOrder(LLVMTargetDataRef TD)


# Returns the pointer size in bytes for a target.
# See the method llvm::DataLayout::getPointerSize.
cdef unsigned int LLVMPointerSize(LLVMTargetDataRef TD)


# Returns the pointer size in bytes for a target for a specified
# address space.
# See the method llvm::DataLayout::getPointerSize.
cdef unsigned int LLVMPointerSizeForAS(LLVMTargetDataRef TD,unsigned int AS)


# Returns the integer type that is the same size as a pointer on a target.
# See the method llvm::DataLayout::getIntPtrType.
cdef LLVMTypeRef LLVMIntPtrType(LLVMTargetDataRef TD)


# Returns the integer type that is the same size as a pointer on a target.
# This version allows the address space to be specified.
# See the method llvm::DataLayout::getIntPtrType.
cdef LLVMTypeRef LLVMIntPtrTypeForAS(LLVMTargetDataRef TD,unsigned int AS)


# Returns the integer type that is the same size as a pointer on a target.
# See the method llvm::DataLayout::getIntPtrType.
cdef LLVMTypeRef LLVMIntPtrTypeInContext(LLVMContextRef C,LLVMTargetDataRef TD)


# Returns the integer type that is the same size as a pointer on a target.
# This version allows the address space to be specified.
# See the method llvm::DataLayout::getIntPtrType.
cdef LLVMTypeRef LLVMIntPtrTypeForASInContext(LLVMContextRef C,LLVMTargetDataRef TD,unsigned int AS)


# Computes the size of a type in bytes for a target.
# See the method llvm::DataLayout::getTypeSizeInBits.
cdef unsigned long long LLVMSizeOfTypeInBits(LLVMTargetDataRef TD,LLVMTypeRef Ty)


# Computes the storage size of a type in bytes for a target.
# See the method llvm::DataLayout::getTypeStoreSize.
cdef unsigned long long LLVMStoreSizeOfType(LLVMTargetDataRef TD,LLVMTypeRef Ty)


# Computes the ABI size of a type in bytes for a target.
# See the method llvm::DataLayout::getTypeAllocSize.
cdef unsigned long long LLVMABISizeOfType(LLVMTargetDataRef TD,LLVMTypeRef Ty)


# Computes the ABI alignment of a type in bytes for a target.
# See the method llvm::DataLayout::getTypeABISize.
cdef unsigned int LLVMABIAlignmentOfType(LLVMTargetDataRef TD,LLVMTypeRef Ty)


# Computes the call frame alignment of a type in bytes for a target.
# See the method llvm::DataLayout::getTypeABISize.
cdef unsigned int LLVMCallFrameAlignmentOfType(LLVMTargetDataRef TD,LLVMTypeRef Ty)


# Computes the preferred alignment of a type in bytes for a target.
# See the method llvm::DataLayout::getTypeABISize.
cdef unsigned int LLVMPreferredAlignmentOfType(LLVMTargetDataRef TD,LLVMTypeRef Ty)


# Computes the preferred alignment of a global variable in bytes for a target.
# See the method llvm::DataLayout::getPreferredAlignment.
cdef unsigned int LLVMPreferredAlignmentOfGlobal(LLVMTargetDataRef TD,LLVMValueRef GlobalVar)


# Computes the structure element that contains the byte offset for a target.
# See the method llvm::StructLayout::getElementContainingOffset.
cdef unsigned int LLVMElementAtOffset(LLVMTargetDataRef TD,LLVMTypeRef StructTy,unsigned long long Offset)


# Computes the byte offset of the indexed struct element for a target.
# See the method llvm::StructLayout::getElementContainingOffset.
cdef unsigned long long LLVMOffsetOfElement(LLVMTargetDataRef TD,LLVMTypeRef StructTy,unsigned int Element)