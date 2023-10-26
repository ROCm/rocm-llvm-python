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


cdef void* _LLVMLinkModules2__funptr = NULL
cdef int LLVMLinkModules2(LLVMModuleRef Dest,LLVMModuleRef Src):
    global _LLVMLinkModules2__funptr
    __init_symbol(&_LLVMLinkModules2__funptr,"LLVMLinkModules2")
    with nogil:
        return (<int (*)(LLVMModuleRef,LLVMModuleRef) noexcept nogil> _LLVMLinkModules2__funptr)(Dest,Src)
