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
cdef extern from "llvm-c/blake3.h":

    ctypedef struct llvm_blake3_chunk_state:
        unsigned int[8] cv
        unsigned long chunk_counter
        unsigned char[64] buf
        unsigned char buf_len
        unsigned char blocks_compressed
        unsigned char flags

    ctypedef struct llvm_blake3_hasher:
        unsigned int[8] key
        llvm_blake3_chunk_state chunk
        unsigned char cv_stack_len
        unsigned char[1760] cv_stack


cdef const char * llvm_blake3_version()



cdef void llvm_blake3_hasher_init(llvm_blake3_hasher * self)



cdef void llvm_blake3_hasher_init_keyed(llvm_blake3_hasher * self,const unsigned char[32] key)



cdef void llvm_blake3_hasher_init_derive_key(llvm_blake3_hasher * self,const char * context)



cdef void llvm_blake3_hasher_init_derive_key_raw(llvm_blake3_hasher * self,const void * context,unsigned long context_len)



cdef void llvm_blake3_hasher_update(llvm_blake3_hasher * self,const void * input,unsigned long input_len)



cdef void llvm_blake3_hasher_finalize(llvm_blake3_hasher * self,unsigned char * out,unsigned long out_len)



cdef void llvm_blake3_hasher_finalize_seek(llvm_blake3_hasher * self,unsigned long seek,unsigned char * out,unsigned long out_len)



cdef void llvm_blake3_hasher_reset(llvm_blake3_hasher * self)