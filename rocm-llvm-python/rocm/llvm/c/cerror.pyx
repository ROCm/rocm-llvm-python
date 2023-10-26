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


cdef void* _LLVMGetErrorTypeId__funptr = NULL
# 
# Returns the type id for the given error instance, which must be a failure
# value (i.e. non-null).
cdef const void * LLVMGetErrorTypeId(LLVMErrorRef Err):
    global _LLVMGetErrorTypeId__funptr
    __init_symbol(&_LLVMGetErrorTypeId__funptr,"LLVMGetErrorTypeId")
    with nogil:
        return (<const void * (*)(LLVMErrorRef) noexcept nogil> _LLVMGetErrorTypeId__funptr)(Err)


cdef void* _LLVMConsumeError__funptr = NULL
# 
# Dispose of the given error without handling it. This operation consumes the
# error, and the given LLVMErrorRef value is not usable once this call returns.
# Note: This method *only* needs to be called if the error is not being passed
# to some other consuming operation, e.g. LLVMGetErrorMessage.
cdef void LLVMConsumeError(LLVMErrorRef Err):
    global _LLVMConsumeError__funptr
    __init_symbol(&_LLVMConsumeError__funptr,"LLVMConsumeError")
    with nogil:
        (<void (*)(LLVMErrorRef) noexcept nogil> _LLVMConsumeError__funptr)(Err)


cdef void* _LLVMGetErrorMessage__funptr = NULL
# 
# Returns the given string's error message. This operation consumes the error,
# and the given LLVMErrorRef value is not usable once this call returns.
# The caller is responsible for disposing of the string by calling
# LLVMDisposeErrorMessage.
cdef char * LLVMGetErrorMessage(LLVMErrorRef Err):
    global _LLVMGetErrorMessage__funptr
    __init_symbol(&_LLVMGetErrorMessage__funptr,"LLVMGetErrorMessage")
    with nogil:
        return (<char * (*)(LLVMErrorRef) noexcept nogil> _LLVMGetErrorMessage__funptr)(Err)


cdef void* _LLVMDisposeErrorMessage__funptr = NULL
# 
# Dispose of the given error message.
cdef void LLVMDisposeErrorMessage(char * ErrMsg):
    global _LLVMDisposeErrorMessage__funptr
    __init_symbol(&_LLVMDisposeErrorMessage__funptr,"LLVMDisposeErrorMessage")
    with nogil:
        (<void (*)(char *) noexcept nogil> _LLVMDisposeErrorMessage__funptr)(ErrMsg)


cdef void* _LLVMGetStringErrorTypeId__funptr = NULL
# 
# Returns the type id for llvm StringError.
cdef const void * LLVMGetStringErrorTypeId():
    global _LLVMGetStringErrorTypeId__funptr
    __init_symbol(&_LLVMGetStringErrorTypeId__funptr,"LLVMGetStringErrorTypeId")
    with nogil:
        return (<const void * (*)() noexcept nogil> _LLVMGetStringErrorTypeId__funptr)()


cdef void* _LLVMCreateStringError__funptr = NULL
# 
# Create a StringError.
cdef LLVMErrorRef LLVMCreateStringError(const char * ErrMsg):
    global _LLVMCreateStringError__funptr
    __init_symbol(&_LLVMCreateStringError__funptr,"LLVMCreateStringError")
    with nogil:
        return (<LLVMErrorRef (*)(const char *) noexcept nogil> _LLVMCreateStringError__funptr)(ErrMsg)
