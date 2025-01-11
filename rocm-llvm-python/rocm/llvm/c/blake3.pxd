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

from libc cimport stdlib
from libc cimport string
from libc.stdint cimport *
cimport cpython.long
cimport cpython.buffer
ctypedef bint _Bool # bool is not a reserved keyword in C, _Bool is
cimport rocm.llvm._util.types

cimport rocm.llvm._util.types
from rocm.llvm.c cimport cblake3

cdef class llvm_blake3_chunk_state(rocm.llvm._util.types.Pointer):
    cdef bint _is_ptr_owner

    cdef cblake3.llvm_blake3_chunk_state* getElementPtr(self)

    @staticmethod
    cdef llvm_blake3_chunk_state fromPtr(void* ptr, bint owner=*)
    @staticmethod
    cdef llvm_blake3_chunk_state fromPyobj(object pyobj)
    @staticmethod
    cdef __allocate(void* ptr)
    @staticmethod
    cdef llvm_blake3_chunk_state new()
    @staticmethod
    cdef llvm_blake3_chunk_state fromValue(cblake3.llvm_blake3_chunk_state other)


cdef class llvm_blake3_hasher(rocm.llvm._util.types.Pointer):
    cdef bint _is_ptr_owner

    cdef cblake3.llvm_blake3_hasher* getElementPtr(self)

    @staticmethod
    cdef llvm_blake3_hasher fromPtr(void* ptr, bint owner=*)
    @staticmethod
    cdef llvm_blake3_hasher fromPyobj(object pyobj)
    @staticmethod
    cdef __allocate(void* ptr)
    @staticmethod
    cdef llvm_blake3_hasher new()
    @staticmethod
    cdef llvm_blake3_hasher fromValue(cblake3.llvm_blake3_hasher other)