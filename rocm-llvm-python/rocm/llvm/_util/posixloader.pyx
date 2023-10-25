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

__author__ = "Advanced Micro Devices, Inc. <rocm-llvm-python.maintainer@amd.com>"

cimport posix.dlfcn

cdef void* open_library(const char* path):
    """
    Note:
        Uses gil because of `bytes`, `RuntimeError`.
    """
    cdef void* handle = posix.dlfcn.dlopen(path, posix.dlfcn.RTLD_NOW)
    if handle == NULL:
        raise RuntimeError(f"failed to dlopen {path}")
    return handle

cdef void* close_library(void* handle) nogil:
    if handle == NULL:
        with gil:
            raise RuntimeError(f"handle is NULL")
    cdef int rtype = posix.dlfcn.dlclose(handle)
    if rtype != 0:
        with gil:
            raise RuntimeError(f"Failed to dclose given handle")
    return handle

cdef void* load_symbol(void* handle, const char* name) nogil:
    return posix.dlfcn.dlsym(handle, name)