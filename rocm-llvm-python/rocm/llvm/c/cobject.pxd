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
from rocm.llvm.config.cllvm_config cimport *
cdef extern from "llvm-c/Object.h":

    cdef struct LLVMOpaqueSectionIterator:
        pass

    ctypedef LLVMOpaqueSectionIterator * LLVMSectionIteratorRef

    cdef struct LLVMOpaqueSymbolIterator:
        pass

    ctypedef LLVMOpaqueSymbolIterator * LLVMSymbolIteratorRef

    cdef struct LLVMOpaqueRelocationIterator:
        pass

    ctypedef LLVMOpaqueRelocationIterator * LLVMRelocationIteratorRef

    ctypedef enum LLVMBinaryType:
        LLVMBinaryTypeArchive
        LLVMBinaryTypeMachOUniversalBinary
        LLVMBinaryTypeCOFFImportFile
        LLVMBinaryTypeIR
        LLVMBinaryTypeWinRes
        LLVMBinaryTypeCOFF
        LLVMBinaryTypeELF32L
        LLVMBinaryTypeELF32B
        LLVMBinaryTypeELF64L
        LLVMBinaryTypeELF64B
        LLVMBinaryTypeMachO32L
        LLVMBinaryTypeMachO32B
        LLVMBinaryTypeMachO64L
        LLVMBinaryTypeMachO64B
        LLVMBinaryTypeWasm
        LLVMBinaryTypeOffload

# 
# Create a binary file from the given memory buffer.
# 
# The exact type of the binary file will be inferred automatically, and the
# appropriate implementation selected.  The context may be NULL except if
# the resulting file is an LLVM IR file.
# 
# The memory buffer is not consumed by this function.  It is the responsibilty
# of the caller to free it with \c LLVMDisposeMemoryBuffer.
# 
# If NULL is returned, the \p ErrorMessage parameter is populated with the
# error's description.  It is then the caller's responsibility to free this
# message by calling \c LLVMDisposeMessage.
# 
# @see llvm::object::createBinary
cdef LLVMBinaryRef LLVMCreateBinary(LLVMMemoryBufferRef MemBuf,LLVMContextRef Context,char ** ErrorMessage)


# 
# Dispose of a binary file.
# 
# The binary file does not own its backing buffer.  It is the responsibilty
# of the caller to free it with \c LLVMDisposeMemoryBuffer.
cdef void LLVMDisposeBinary(LLVMBinaryRef BR)


# 
# Retrieves a copy of the memory buffer associated with this object file.
# 
# The returned buffer is merely a shallow copy and does not own the actual
# backing buffer of the binary. Nevertheless, it is the responsibility of the
# caller to free it with \c LLVMDisposeMemoryBuffer.
# 
# @see llvm::object::getMemoryBufferRef
cdef LLVMMemoryBufferRef LLVMBinaryCopyMemoryBuffer(LLVMBinaryRef BR)


# 
# Retrieve the specific type of a binary.
# 
# @see llvm::object::Binary::getType
cdef LLVMBinaryType LLVMBinaryGetType(LLVMBinaryRef BR)



cdef LLVMBinaryRef LLVMMachOUniversalBinaryCopyObjectForArch(LLVMBinaryRef BR,const char * Arch,unsigned long ArchLen,char ** ErrorMessage)


# 
# Retrieve a copy of the section iterator for this object file.
# 
# If there are no sections, the result is NULL.
# 
# The returned iterator is merely a shallow copy. Nevertheless, it is
# the responsibility of the caller to free it with
# \c LLVMDisposeSectionIterator.
# 
# @see llvm::object::sections()
cdef LLVMSectionIteratorRef LLVMObjectFileCopySectionIterator(LLVMBinaryRef BR)


# 
# Returns whether the given section iterator is at the end.
# 
# @see llvm::object::section_end
cdef int LLVMObjectFileIsSectionIteratorAtEnd(LLVMBinaryRef BR,LLVMSectionIteratorRef SI)


# 
# Retrieve a copy of the symbol iterator for this object file.
# 
# If there are no symbols, the result is NULL.
# 
# The returned iterator is merely a shallow copy. Nevertheless, it is
# the responsibility of the caller to free it with
# \c LLVMDisposeSymbolIterator.
# 
# @see llvm::object::symbols()
cdef LLVMSymbolIteratorRef LLVMObjectFileCopySymbolIterator(LLVMBinaryRef BR)


# 
# Returns whether the given symbol iterator is at the end.
# 
# @see llvm::object::symbol_end
cdef int LLVMObjectFileIsSymbolIteratorAtEnd(LLVMBinaryRef BR,LLVMSymbolIteratorRef SI)



cdef void LLVMDisposeSectionIterator(LLVMSectionIteratorRef SI)



cdef void LLVMMoveToNextSection(LLVMSectionIteratorRef SI)



cdef void LLVMMoveToContainingSection(LLVMSectionIteratorRef Sect,LLVMSymbolIteratorRef Sym)



cdef void LLVMDisposeSymbolIterator(LLVMSymbolIteratorRef SI)



cdef void LLVMMoveToNextSymbol(LLVMSymbolIteratorRef SI)



cdef const char * LLVMGetSectionName(LLVMSectionIteratorRef SI)



cdef unsigned long LLVMGetSectionSize(LLVMSectionIteratorRef SI)



cdef const char * LLVMGetSectionContents(LLVMSectionIteratorRef SI)



cdef unsigned long LLVMGetSectionAddress(LLVMSectionIteratorRef SI)



cdef int LLVMGetSectionContainsSymbol(LLVMSectionIteratorRef SI,LLVMSymbolIteratorRef Sym)



cdef LLVMRelocationIteratorRef LLVMGetRelocations(LLVMSectionIteratorRef Section)



cdef void LLVMDisposeRelocationIterator(LLVMRelocationIteratorRef RI)



cdef int LLVMIsRelocationIteratorAtEnd(LLVMSectionIteratorRef Section,LLVMRelocationIteratorRef RI)



cdef void LLVMMoveToNextRelocation(LLVMRelocationIteratorRef RI)



cdef const char * LLVMGetSymbolName(LLVMSymbolIteratorRef SI)



cdef unsigned long LLVMGetSymbolAddress(LLVMSymbolIteratorRef SI)



cdef unsigned long LLVMGetSymbolSize(LLVMSymbolIteratorRef SI)



cdef unsigned long LLVMGetRelocationOffset(LLVMRelocationIteratorRef RI)



cdef LLVMSymbolIteratorRef LLVMGetRelocationSymbol(LLVMRelocationIteratorRef RI)



cdef unsigned long LLVMGetRelocationType(LLVMRelocationIteratorRef RI)



cdef const char * LLVMGetRelocationTypeName(LLVMRelocationIteratorRef RI)



cdef const char * LLVMGetRelocationValueString(LLVMRelocationIteratorRef RI)


cdef extern from "llvm-c/Object.h":

    cdef struct LLVMOpaqueObjectFile:
        pass

    ctypedef LLVMOpaqueObjectFile * LLVMObjectFileRef

# Deprecated: Use LLVMCreateBinary instead. */
cdef LLVMObjectFileRef LLVMCreateObjectFile(LLVMMemoryBufferRef MemBuf)


# Deprecated: Use LLVMDisposeBinary instead. */
cdef void LLVMDisposeObjectFile(LLVMObjectFileRef ObjectFile)


# Deprecated: Use LLVMObjectFileCopySectionIterator instead. */
cdef LLVMSectionIteratorRef LLVMGetSections(LLVMObjectFileRef ObjectFile)


# Deprecated: Use LLVMObjectFileIsSectionIteratorAtEnd instead. */
cdef int LLVMIsSectionIteratorAtEnd(LLVMObjectFileRef ObjectFile,LLVMSectionIteratorRef SI)


# Deprecated: Use LLVMObjectFileCopySymbolIterator instead. */
cdef LLVMSymbolIteratorRef LLVMGetSymbols(LLVMObjectFileRef ObjectFile)


# Deprecated: Use LLVMObjectFileIsSymbolIteratorAtEnd instead. */
cdef int LLVMIsSymbolIteratorAtEnd(LLVMObjectFileRef ObjectFile,LLVMSymbolIteratorRef SI)
