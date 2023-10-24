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


cdef void* _llvm_blake3_version__funptr = NULL
cdef const char * llvm_blake3_version() nogil:
    global _llvm_blake3_version__funptr
    __init_symbol(&_llvm_blake3_version__funptr,"llvm_blake3_version")
    return (<const char * (*)() nogil> _llvm_blake3_version__funptr)()


cdef void* _llvm_blake3_hasher_init__funptr = NULL
cdef void llvm_blake3_hasher_init(llvm_blake3_hasher * self) nogil:
    global _llvm_blake3_hasher_init__funptr
    __init_symbol(&_llvm_blake3_hasher_init__funptr,"llvm_blake3_hasher_init")
    return (<void (*)(llvm_blake3_hasher *) nogil> _llvm_blake3_hasher_init__funptr)(self)


cdef void* _llvm_blake3_hasher_init_keyed__funptr = NULL
cdef void llvm_blake3_hasher_init_keyed(llvm_blake3_hasher * self,const unsigned char[32] key) nogil:
    global _llvm_blake3_hasher_init_keyed__funptr
    __init_symbol(&_llvm_blake3_hasher_init_keyed__funptr,"llvm_blake3_hasher_init_keyed")
    return (<void (*)(llvm_blake3_hasher *,const unsigned char[32]) nogil> _llvm_blake3_hasher_init_keyed__funptr)(self,key)


cdef void* _llvm_blake3_hasher_init_derive_key__funptr = NULL
cdef void llvm_blake3_hasher_init_derive_key(llvm_blake3_hasher * self,const char * context) nogil:
    global _llvm_blake3_hasher_init_derive_key__funptr
    __init_symbol(&_llvm_blake3_hasher_init_derive_key__funptr,"llvm_blake3_hasher_init_derive_key")
    return (<void (*)(llvm_blake3_hasher *,const char *) nogil> _llvm_blake3_hasher_init_derive_key__funptr)(self,context)


cdef void* _llvm_blake3_hasher_init_derive_key_raw__funptr = NULL
cdef void llvm_blake3_hasher_init_derive_key_raw(llvm_blake3_hasher * self,const void * context,unsigned long context_len) nogil:
    global _llvm_blake3_hasher_init_derive_key_raw__funptr
    __init_symbol(&_llvm_blake3_hasher_init_derive_key_raw__funptr,"llvm_blake3_hasher_init_derive_key_raw")
    return (<void (*)(llvm_blake3_hasher *,const void *,unsigned long) nogil> _llvm_blake3_hasher_init_derive_key_raw__funptr)(self,context,context_len)


cdef void* _llvm_blake3_hasher_update__funptr = NULL
cdef void llvm_blake3_hasher_update(llvm_blake3_hasher * self,const void * input,unsigned long input_len) nogil:
    global _llvm_blake3_hasher_update__funptr
    __init_symbol(&_llvm_blake3_hasher_update__funptr,"llvm_blake3_hasher_update")
    return (<void (*)(llvm_blake3_hasher *,const void *,unsigned long) nogil> _llvm_blake3_hasher_update__funptr)(self,input,input_len)


cdef void* _llvm_blake3_hasher_finalize__funptr = NULL
cdef void llvm_blake3_hasher_finalize(llvm_blake3_hasher * self,unsigned char * out,unsigned long out_len) nogil:
    global _llvm_blake3_hasher_finalize__funptr
    __init_symbol(&_llvm_blake3_hasher_finalize__funptr,"llvm_blake3_hasher_finalize")
    return (<void (*)(llvm_blake3_hasher *,unsigned char *,unsigned long) nogil> _llvm_blake3_hasher_finalize__funptr)(self,out,out_len)


cdef void* _llvm_blake3_hasher_finalize_seek__funptr = NULL
cdef void llvm_blake3_hasher_finalize_seek(llvm_blake3_hasher * self,unsigned long seek,unsigned char * out,unsigned long out_len) nogil:
    global _llvm_blake3_hasher_finalize_seek__funptr
    __init_symbol(&_llvm_blake3_hasher_finalize_seek__funptr,"llvm_blake3_hasher_finalize_seek")
    return (<void (*)(llvm_blake3_hasher *,unsigned long,unsigned char *,unsigned long) nogil> _llvm_blake3_hasher_finalize_seek__funptr)(self,seek,out,out_len)


cdef void* _llvm_blake3_hasher_reset__funptr = NULL
cdef void llvm_blake3_hasher_reset(llvm_blake3_hasher * self) nogil:
    global _llvm_blake3_hasher_reset__funptr
    __init_symbol(&_llvm_blake3_hasher_reset__funptr,"llvm_blake3_hasher_reset")
    return (<void (*)(llvm_blake3_hasher *) nogil> _llvm_blake3_hasher_reset__funptr)(self)
