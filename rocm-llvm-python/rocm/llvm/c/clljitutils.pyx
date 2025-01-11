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

cimport rocm.llvm._util.posixloader as loader
cdef void* _lib_handle = NULL

DLL = b"librocmllvm.so"

cdef int __init() except 1 nogil:
    global DLL
    global _lib_handle
    cdef char* dll = NULL
    if _lib_handle == NULL:
        with gil:
            dll = DLL
        return loader.open_library(&_lib_handle,dll)
    return 0

cdef int __init_symbol(void** result, const char* name) except 1 nogil:
    global _lib_handle
    cdef int init_result = 0
    if _lib_handle == NULL:
        init_result = __init()
        if init_result > 0:
            return init_result
    if result[0] == NULL:
        return loader.load_symbol(result,_lib_handle, name)
    return 0


cdef void* _LLVMOrcLLJITEnableDebugSupport__funptr = NULL
# 
# Install the plugin that submits debug objects to the executor. Executors must
# expose the llvm_orc_registerJITLoaderGDBWrapper symbol.
cdef LLVMErrorRef LLVMOrcLLJITEnableDebugSupport(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITEnableDebugSupport__funptr
    if __init_symbol(&_LLVMOrcLLJITEnableDebugSupport__funptr,"LLVMOrcLLJITEnableDebugSupport") > 0:
        pass
    return (<LLVMErrorRef (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITEnableDebugSupport__funptr)(J)
