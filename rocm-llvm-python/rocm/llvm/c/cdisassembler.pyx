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

cimport rocm.llvm._util.posixloader as loader
cdef void* _lib_handle = NULL

DLL = "librocmllvm.so"

cdef void __init():
    global DLL
    global _lib_handle
    if not isinstance(DLL,str):
        raise RuntimeError(f"'DLL' must be of type `str`")
    if _lib_handle == NULL:
        _lib_handle = loader.open_library(DLL.encode("utf-8"))

cdef void __init_symbol(void** result, const char* name):
    global _lib_handle
    if _lib_handle == NULL:
        __init()
    if result[0] == NULL:
        result[0] = loader.load_symbol(_lib_handle, name)


cdef void* _LLVMCreateDisasm__funptr = NULL
# 
# Create a disassembler for the TripleName.  Symbolic disassembly is supported
# by passing a block of information in the DisInfo parameter and specifying the
# TagType and callback functions as described above.  These can all be passed
# as NULL.  If successful, this returns a disassembler context.  If not, it
# returns NULL. This function is equivalent to calling
# LLVMCreateDisasmCPUFeatures() with an empty CPU name and feature set.
cdef void * LLVMCreateDisasm(const char * TripleName,void * DisInfo,int TagType,LLVMOpInfoCallback GetOpInfo,LLVMSymbolLookupCallback SymbolLookUp):
    global _LLVMCreateDisasm__funptr
    __init_symbol(&_LLVMCreateDisasm__funptr,"LLVMCreateDisasm")
    with nogil:
        return (<void * (*)(const char *,void *,int,LLVMOpInfoCallback,LLVMSymbolLookupCallback) noexcept nogil> _LLVMCreateDisasm__funptr)(TripleName,DisInfo,TagType,GetOpInfo,SymbolLookUp)


cdef void* _LLVMCreateDisasmCPU__funptr = NULL
# 
# Create a disassembler for the TripleName and a specific CPU.  Symbolic
# disassembly is supported by passing a block of information in the DisInfo
# parameter and specifying the TagType and callback functions as described
# above.  These can all be passed * as NULL.  If successful, this returns a
# disassembler context.  If not, it returns NULL. This function is equivalent
# to calling LLVMCreateDisasmCPUFeatures() with an empty feature set.
cdef void * LLVMCreateDisasmCPU(const char * Triple,const char * CPU,void * DisInfo,int TagType,LLVMOpInfoCallback GetOpInfo,LLVMSymbolLookupCallback SymbolLookUp):
    global _LLVMCreateDisasmCPU__funptr
    __init_symbol(&_LLVMCreateDisasmCPU__funptr,"LLVMCreateDisasmCPU")
    with nogil:
        return (<void * (*)(const char *,const char *,void *,int,LLVMOpInfoCallback,LLVMSymbolLookupCallback) noexcept nogil> _LLVMCreateDisasmCPU__funptr)(Triple,CPU,DisInfo,TagType,GetOpInfo,SymbolLookUp)


cdef void* _LLVMCreateDisasmCPUFeatures__funptr = NULL
# 
# Create a disassembler for the TripleName, a specific CPU and specific feature
# string.  Symbolic disassembly is supported by passing a block of information
# in the DisInfo parameter and specifying the TagType and callback functions as
# described above.  These can all be passed * as NULL.  If successful, this
# returns a disassembler context.  If not, it returns NULL.
cdef void * LLVMCreateDisasmCPUFeatures(const char * Triple,const char * CPU,const char * Features,void * DisInfo,int TagType,LLVMOpInfoCallback GetOpInfo,LLVMSymbolLookupCallback SymbolLookUp):
    global _LLVMCreateDisasmCPUFeatures__funptr
    __init_symbol(&_LLVMCreateDisasmCPUFeatures__funptr,"LLVMCreateDisasmCPUFeatures")
    with nogil:
        return (<void * (*)(const char *,const char *,const char *,void *,int,LLVMOpInfoCallback,LLVMSymbolLookupCallback) noexcept nogil> _LLVMCreateDisasmCPUFeatures__funptr)(Triple,CPU,Features,DisInfo,TagType,GetOpInfo,SymbolLookUp)


cdef void* _LLVMSetDisasmOptions__funptr = NULL
# 
# Set the disassembler's options.  Returns 1 if it can set the Options and 0
# otherwise.
cdef int LLVMSetDisasmOptions(void * DC,unsigned long Options):
    global _LLVMSetDisasmOptions__funptr
    __init_symbol(&_LLVMSetDisasmOptions__funptr,"LLVMSetDisasmOptions")
    with nogil:
        return (<int (*)(void *,unsigned long) noexcept nogil> _LLVMSetDisasmOptions__funptr)(DC,Options)


cdef void* _LLVMDisasmDispose__funptr = NULL
# 
# Dispose of a disassembler context.
cdef void LLVMDisasmDispose(void * DC):
    global _LLVMDisasmDispose__funptr
    __init_symbol(&_LLVMDisasmDispose__funptr,"LLVMDisasmDispose")
    with nogil:
        (<void (*)(void *) noexcept nogil> _LLVMDisasmDispose__funptr)(DC)


cdef void* _LLVMDisasmInstruction__funptr = NULL
# 
# Disassemble a single instruction using the disassembler context specified in
# the parameter DC.  The bytes of the instruction are specified in the
# parameter Bytes, and contains at least BytesSize number of bytes.  The
# instruction is at the address specified by the PC parameter.  If a valid
# instruction can be disassembled, its string is returned indirectly in
# OutString whose size is specified in the parameter OutStringSize.  This
# function returns the number of bytes in the instruction or zero if there was
# no valid instruction.
cdef unsigned long LLVMDisasmInstruction(void * DC,unsigned char * Bytes,unsigned long BytesSize,unsigned long PC,char * OutString,unsigned long OutStringSize):
    global _LLVMDisasmInstruction__funptr
    __init_symbol(&_LLVMDisasmInstruction__funptr,"LLVMDisasmInstruction")
    with nogil:
        return (<unsigned long (*)(void *,unsigned char *,unsigned long,unsigned long,char *,unsigned long) noexcept nogil> _LLVMDisasmInstruction__funptr)(DC,Bytes,BytesSize,PC,OutString,OutStringSize)
