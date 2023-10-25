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

cimport hip._util.posixloader as loader
cdef void* _lib_handle = NULL

cdef void __init() nogil:
    global _lib_handle
    if _lib_handle == NULL:
        with gil:
            _lib_handle = loader.open_library("librocmllvm.so")

cdef void __init_symbol(void** result, const char* name) nogil:
    global _lib_handle
    if _lib_handle == NULL:
        __init()
    if result[0] == NULL:
        with gil:
            result[0] = loader.load_symbol(_lib_handle, name) 


cdef void* _LLVMAddLowerSwitchPass__funptr = NULL
# See llvm::createLowerSwitchPass function. */
cdef void LLVMAddLowerSwitchPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLowerSwitchPass__funptr
    __init_symbol(&_LLVMAddLowerSwitchPass__funptr,"LLVMAddLowerSwitchPass")
    return (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLowerSwitchPass__funptr)(PM)


cdef void* _LLVMAddPromoteMemoryToRegisterPass__funptr = NULL
# See llvm::createPromoteMemoryToRegisterPass function. */
cdef void LLVMAddPromoteMemoryToRegisterPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddPromoteMemoryToRegisterPass__funptr
    __init_symbol(&_LLVMAddPromoteMemoryToRegisterPass__funptr,"LLVMAddPromoteMemoryToRegisterPass")
    return (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddPromoteMemoryToRegisterPass__funptr)(PM)


cdef void* _LLVMAddAddDiscriminatorsPass__funptr = NULL
# See llvm::createAddDiscriminatorsPass function. */
cdef void LLVMAddAddDiscriminatorsPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddAddDiscriminatorsPass__funptr
    __init_symbol(&_LLVMAddAddDiscriminatorsPass__funptr,"LLVMAddAddDiscriminatorsPass")
    return (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddAddDiscriminatorsPass__funptr)(PM)