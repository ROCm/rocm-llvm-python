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


"""
(No short description)


"""

import cython
import ctypes
import enum
cdef class llvm_blake3_chunk_state:
    """Python wrapper for C type cblake3.llvm_blake3_chunk_state.
    
    Python wrapper for C type cblake3.llvm_blake3_chunk_state.

    If this type is initialized via its `__init__` method, it allocates a member of the underlying C type and
    destroys it again if the wrapper type is deallocted.

    This type also serves as adapter when appearing as argument type in a function signature.
    In this case, the type can further be initialized from the following Python objects
    that you can pass as argument instead:
    
    * `None`:

      This will set the ``self._ptr`` attribute to ``NULL``.

    * `int`:
      
      Interprets the integer value as pointer address and writes it to ``self._ptr``.
      
    * `ctypes.c_void_p`:
      
      Takes the pointer address ``pyobj.value`` and writes it to ``self._ptr``.

    * `object` that implements the `CUDA Array Interface <https://numba.readthedocs.io/en/stable/cuda/cuda_array_interface.html>`_ protocol:
      
      Takes the integer-valued pointer address, i.e. the first entry of the `data` tuple 
      from `pyobj`'s member ``__cuda_array_interface__``  and writes it to ``self._ptr``.

    * `object` that implements the Python buffer protocol:
      
      If the object represents a simple contiguous array,
      writes the `Py_buffer` associated with ``pyobj`` to `self._py_buffer`,
      sets the `self._py_buffer_acquired` flag to `True`, and
      writes `self._py_buffer.buf` to the data pointer `self._ptr`.
    
    Type checks are performed in the above order.

    C Attributes:
        _ptr (C type ``void *``, protected):
            Stores a pointer to the data of the original Python object.
        _ptr_owner (C type ``bint``, protected):
            If this wrapper is the owner of the underlying data.
        _py_buffer (C type ``Py_buffer`, protected):
            Stores a pointer to the data of the original Python object.
        _py_buffer_acquired (C type ``bint``, protected):
            Stores a pointer to the data of the original Python object.
    """
    # members declared in pxd file

    def __cinit__(self):
        self._ptr = NULL
        self.ptr_owner = False
        self._py_buffer_acquired = False

    @staticmethod
    cdef llvm_blake3_chunk_state from_ptr(cblake3.llvm_blake3_chunk_state* ptr, bint owner=False):
        """Factory function to create ``llvm_blake3_chunk_state`` objects from
        given ``cblake3.llvm_blake3_chunk_state`` pointer.

        Setting ``owner`` flag to ``True`` causes
        the extension type to free the structure pointed to by ``ptr``
        when the wrapper object is deallocated.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef llvm_blake3_chunk_state wrapper = llvm_blake3_chunk_state.__new__(llvm_blake3_chunk_state)
        wrapper._ptr = ptr
        wrapper.ptr_owner = owner
        return wrapper

    @staticmethod
    cdef llvm_blake3_chunk_state from_pyobj(object pyobj):
        """Derives a llvm_blake3_chunk_state from a Python object.

        Derives a llvm_blake3_chunk_state from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``llvm_blake3_chunk_state`` reference, this method
        returns it directly. No new ``llvm_blake3_chunk_state`` is created in this case.

        Args:
            pyobj (object): Must be either `None`, a simple, contiguous buffer according to the buffer protocol,
                            or of type `llvm_blake3_chunk_state`, `int`, or `ctypes.c_void_p`

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of llvm_blake3_chunk_state!
        """
        cdef llvm_blake3_chunk_state wrapper = llvm_blake3_chunk_state.__new__(llvm_blake3_chunk_state)
        cdef dict cuda_array_interface = getattr(pyobj, "__cuda_array_interface__", None)

        if pyobj is None:
            wrapper._ptr = NULL
        elif isinstance(pyobj,llvm_blake3_chunk_state):
            return pyobj
        elif isinstance(pyobj,int):
            wrapper._ptr = <cblake3.llvm_blake3_chunk_state*>cpython.long.PyLong_AsVoidPtr(pyobj)
        elif isinstance(pyobj,ctypes.c_void_p):
            wrapper._ptr = <cblake3.llvm_blake3_chunk_state*>cpython.long.PyLong_AsVoidPtr(pyobj.value) if pyobj.value != None else NULL
        elif cuda_array_interface != None:
            if not "data" in cuda_array_interface:
                raise ValueError("input object has '__cuda_array_interface__' attribute but the dict has no 'data' key")
            ptr_as_int = cuda_array_interface["data"][0]
            wrapper._ptr = <cblake3.llvm_blake3_chunk_state*>cpython.long.PyLong_AsVoidPtr(ptr_as_int)
        elif cpython.buffer.PyObject_CheckBuffer(pyobj):
            err = cpython.buffer.PyObject_GetBuffer( 
                pyobj,
                &wrapper._py_buffer, 
                cpython.buffer.PyBUF_SIMPLE | cpython.buffer.PyBUF_ANY_CONTIGUOUS
            )
            if err == -1:
                raise RuntimeError("failed to create simple, contiguous Py_buffer from Python object")
            wrapper._py_buffer_acquired = True
            wrapper._ptr = <cblake3.llvm_blake3_chunk_state*>wrapper._py_buffer.buf
        else:
            raise TypeError(f"unsupported input type: '{str(type(pyobj))}'")
        return wrapper
    def __dealloc__(self):
        # Release the buffer handle
        if self._py_buffer_acquired is True:
            cpython.buffer.PyBuffer_Release(&self._py_buffer)
        # De-allocate if not null and flag is set
        if self._ptr is not NULL and self.ptr_owner is True:
            stdlib.free(self._ptr)
            self._ptr = NULL

    @staticmethod
    cdef __allocate(cblake3.llvm_blake3_chunk_state** ptr):
        ptr[0] = <cblake3.llvm_blake3_chunk_state*>stdlib.malloc(sizeof(cblake3.llvm_blake3_chunk_state))
        string.memset(<void*>ptr[0], 0, sizeof(cblake3.llvm_blake3_chunk_state))

        if ptr[0] is NULL:
            raise MemoryError

    @staticmethod
    cdef llvm_blake3_chunk_state new():
        """Factory function to create llvm_blake3_chunk_state objects with
        newly allocated cblake3.llvm_blake3_chunk_state"""
        cdef cblake3.llvm_blake3_chunk_state* ptr
        llvm_blake3_chunk_state.__allocate(&ptr)
        return llvm_blake3_chunk_state.from_ptr(ptr, owner=True)

    @staticmethod
    cdef llvm_blake3_chunk_state from_value(cblake3.llvm_blake3_chunk_state other):
        """Allocate new C type and copy from ``other``.
        """
        wrapper = llvm_blake3_chunk_state.new()
        string.memcpy(wrapper._ptr, &other, sizeof(cblake3.llvm_blake3_chunk_state))
        return wrapper
   
    def __init__(self,*args,**kwargs):
        """Constructor type llvm_blake3_chunk_state.

        Constructor for type llvm_blake3_chunk_state.

        Args:
            *args:
                Positional arguments. Initialize all or a subset of the member variables
                according to their order of declaration.
            **kwargs: 
                Can be used to initialize member variables at construction,
                Just pass an argument expression of the form <member>=<value>
                per member that you want to initialize.
        """
        llvm_blake3_chunk_state.__allocate(&self._ptr)
        self.ptr_owner = True
        attribs = self.PROPERTIES()
        used_attribs = set()
        if len(args) > len(attribs):
            raise ValueError("More positional arguments specified than this type has properties.")
        for i,v in enumerate(args):
            setattr(self,attribs[i],v)
            used_attribs.add(attribs[i])
        valid_names = ", ".join(["'"+p+"'" for p in attribs])
        for k,v in kwargs.items():
            if k in used_attribs:
                raise KeyError(f"argument '{k}' has already been specified as positional argument.")
            elif k not in attribs:
                raise KeyError(f"'{k}' is no valid property name. Valid names: {valid_names}")
            setattr(self,k,v)
    
    def __int__(self):
        """Returns the data's address as long integer.
        """
        return cpython.long.PyLong_FromVoidPtr(self._ptr)
    def __repr__(self):
        return f"<llvm_blake3_chunk_state object, self.ptr={int(self)}>"
    def as_c_void_p(self):
        """Returns the data's address as `ctypes.c_void_p`
        Note:
            Implements as function to not collide with 
            autogenerated property names.
        """
        return ctypes.c_void_p(int(self))
    def c_sizeof(self):
        """Returns the size of the underlying C type in bytes.
        Note:
            Implements as function to not collide with 
            autogenerated property names.
        """
        return sizeof(cblake3.llvm_blake3_chunk_state)
    def get_cv(self, i):
        """Get value of ``cv`` of ``self._ptr[i]``.
        """
        return self._ptr[i].cv
    # TODO add setters
    #def set_cv(self, i, unsigned int[8] value):
    #    """Set value ``cv`` of ``self._ptr[i]``.
    #    """
    #    self._ptr[i].cv = value
    @property
    def cv(self):
        """(undocumented)"""
        return self.get_cv(0)
    # TODO add setters
    #@cv.setter
    #def cv(self, unsigned int[8] value):
    #    self.set_cv(0,value)

    def get_chunk_counter(self, i):
        """Get value ``chunk_counter`` of ``self._ptr[i]``.
        """
        return self._ptr[i].chunk_counter
    def set_chunk_counter(self, i, unsigned long value):
        """Set value ``chunk_counter`` of ``self._ptr[i]``.
        """
        self._ptr[i].chunk_counter = value
    @property
    def chunk_counter(self):
        """(undocumented)"""
        return self.get_chunk_counter(0)
    @chunk_counter.setter
    def chunk_counter(self, unsigned long value):
        self.set_chunk_counter(0,value)

    def get_buf(self, i):
        """Get value of ``buf`` of ``self._ptr[i]``.
        """
        return self._ptr[i].buf
    # TODO add setters
    #def set_buf(self, i, unsigned char[64] value):
    #    """Set value ``buf`` of ``self._ptr[i]``.
    #    """
    #    self._ptr[i].buf = value
    @property
    def buf(self):
        """(undocumented)"""
        return self.get_buf(0)
    # TODO add setters
    #@buf.setter
    #def buf(self, unsigned char[64] value):
    #    self.set_buf(0,value)

    def get_buf_len(self, i):
        """Get value ``buf_len`` of ``self._ptr[i]``.
        """
        return self._ptr[i].buf_len
    def set_buf_len(self, i, unsigned char value):
        """Set value ``buf_len`` of ``self._ptr[i]``.
        """
        self._ptr[i].buf_len = value
    @property
    def buf_len(self):
        """(undocumented)"""
        return self.get_buf_len(0)
    @buf_len.setter
    def buf_len(self, unsigned char value):
        self.set_buf_len(0,value)

    def get_blocks_compressed(self, i):
        """Get value ``blocks_compressed`` of ``self._ptr[i]``.
        """
        return self._ptr[i].blocks_compressed
    def set_blocks_compressed(self, i, unsigned char value):
        """Set value ``blocks_compressed`` of ``self._ptr[i]``.
        """
        self._ptr[i].blocks_compressed = value
    @property
    def blocks_compressed(self):
        """(undocumented)"""
        return self.get_blocks_compressed(0)
    @blocks_compressed.setter
    def blocks_compressed(self, unsigned char value):
        self.set_blocks_compressed(0,value)

    def get_flags(self, i):
        """Get value ``flags`` of ``self._ptr[i]``.
        """
        return self._ptr[i].flags
    def set_flags(self, i, unsigned char value):
        """Set value ``flags`` of ``self._ptr[i]``.
        """
        self._ptr[i].flags = value
    @property
    def flags(self):
        """(undocumented)"""
        return self.get_flags(0)
    @flags.setter
    def flags(self, unsigned char value):
        self.set_flags(0,value)

    @staticmethod
    def PROPERTIES():
        return ["cv","chunk_counter","buf","buf_len","blocks_compressed","flags"]

    def __contains__(self,item):
        properties = self.PROPERTIES()
        return item in properties

    def __getitem__(self,item):
        properties = self.PROPERTIES()
        if isinstance(item,int):
            if item < 0 or item >= len(properties):
                raise IndexError()
            return getattr(self,properties[item])
        raise ValueError("'item' type must be 'int'")


cdef class llvm_blake3_hasher:
    """Python wrapper for C type cblake3.llvm_blake3_hasher.
    
    Python wrapper for C type cblake3.llvm_blake3_hasher.

    If this type is initialized via its `__init__` method, it allocates a member of the underlying C type and
    destroys it again if the wrapper type is deallocted.

    This type also serves as adapter when appearing as argument type in a function signature.
    In this case, the type can further be initialized from the following Python objects
    that you can pass as argument instead:
    
    * `None`:

      This will set the ``self._ptr`` attribute to ``NULL``.

    * `int`:
      
      Interprets the integer value as pointer address and writes it to ``self._ptr``.
      
    * `ctypes.c_void_p`:
      
      Takes the pointer address ``pyobj.value`` and writes it to ``self._ptr``.

    * `object` that implements the `CUDA Array Interface <https://numba.readthedocs.io/en/stable/cuda/cuda_array_interface.html>`_ protocol:
      
      Takes the integer-valued pointer address, i.e. the first entry of the `data` tuple 
      from `pyobj`'s member ``__cuda_array_interface__``  and writes it to ``self._ptr``.

    * `object` that implements the Python buffer protocol:
      
      If the object represents a simple contiguous array,
      writes the `Py_buffer` associated with ``pyobj`` to `self._py_buffer`,
      sets the `self._py_buffer_acquired` flag to `True`, and
      writes `self._py_buffer.buf` to the data pointer `self._ptr`.
    
    Type checks are performed in the above order.

    C Attributes:
        _ptr (C type ``void *``, protected):
            Stores a pointer to the data of the original Python object.
        _ptr_owner (C type ``bint``, protected):
            If this wrapper is the owner of the underlying data.
        _py_buffer (C type ``Py_buffer`, protected):
            Stores a pointer to the data of the original Python object.
        _py_buffer_acquired (C type ``bint``, protected):
            Stores a pointer to the data of the original Python object.
    """
    # members declared in pxd file

    def __cinit__(self):
        self._ptr = NULL
        self.ptr_owner = False
        self._py_buffer_acquired = False

    @staticmethod
    cdef llvm_blake3_hasher from_ptr(cblake3.llvm_blake3_hasher* ptr, bint owner=False):
        """Factory function to create ``llvm_blake3_hasher`` objects from
        given ``cblake3.llvm_blake3_hasher`` pointer.

        Setting ``owner`` flag to ``True`` causes
        the extension type to free the structure pointed to by ``ptr``
        when the wrapper object is deallocated.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef llvm_blake3_hasher wrapper = llvm_blake3_hasher.__new__(llvm_blake3_hasher)
        wrapper._ptr = ptr
        wrapper.ptr_owner = owner
        return wrapper

    @staticmethod
    cdef llvm_blake3_hasher from_pyobj(object pyobj):
        """Derives a llvm_blake3_hasher from a Python object.

        Derives a llvm_blake3_hasher from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``llvm_blake3_hasher`` reference, this method
        returns it directly. No new ``llvm_blake3_hasher`` is created in this case.

        Args:
            pyobj (object): Must be either `None`, a simple, contiguous buffer according to the buffer protocol,
                            or of type `llvm_blake3_hasher`, `int`, or `ctypes.c_void_p`

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of llvm_blake3_hasher!
        """
        cdef llvm_blake3_hasher wrapper = llvm_blake3_hasher.__new__(llvm_blake3_hasher)
        cdef dict cuda_array_interface = getattr(pyobj, "__cuda_array_interface__", None)

        if pyobj is None:
            wrapper._ptr = NULL
        elif isinstance(pyobj,llvm_blake3_hasher):
            return pyobj
        elif isinstance(pyobj,int):
            wrapper._ptr = <cblake3.llvm_blake3_hasher*>cpython.long.PyLong_AsVoidPtr(pyobj)
        elif isinstance(pyobj,ctypes.c_void_p):
            wrapper._ptr = <cblake3.llvm_blake3_hasher*>cpython.long.PyLong_AsVoidPtr(pyobj.value) if pyobj.value != None else NULL
        elif cuda_array_interface != None:
            if not "data" in cuda_array_interface:
                raise ValueError("input object has '__cuda_array_interface__' attribute but the dict has no 'data' key")
            ptr_as_int = cuda_array_interface["data"][0]
            wrapper._ptr = <cblake3.llvm_blake3_hasher*>cpython.long.PyLong_AsVoidPtr(ptr_as_int)
        elif cpython.buffer.PyObject_CheckBuffer(pyobj):
            err = cpython.buffer.PyObject_GetBuffer( 
                pyobj,
                &wrapper._py_buffer, 
                cpython.buffer.PyBUF_SIMPLE | cpython.buffer.PyBUF_ANY_CONTIGUOUS
            )
            if err == -1:
                raise RuntimeError("failed to create simple, contiguous Py_buffer from Python object")
            wrapper._py_buffer_acquired = True
            wrapper._ptr = <cblake3.llvm_blake3_hasher*>wrapper._py_buffer.buf
        else:
            raise TypeError(f"unsupported input type: '{str(type(pyobj))}'")
        return wrapper
    def __dealloc__(self):
        # Release the buffer handle
        if self._py_buffer_acquired is True:
            cpython.buffer.PyBuffer_Release(&self._py_buffer)
        # De-allocate if not null and flag is set
        if self._ptr is not NULL and self.ptr_owner is True:
            stdlib.free(self._ptr)
            self._ptr = NULL

    @staticmethod
    cdef __allocate(cblake3.llvm_blake3_hasher** ptr):
        ptr[0] = <cblake3.llvm_blake3_hasher*>stdlib.malloc(sizeof(cblake3.llvm_blake3_hasher))
        string.memset(<void*>ptr[0], 0, sizeof(cblake3.llvm_blake3_hasher))

        if ptr[0] is NULL:
            raise MemoryError

    @staticmethod
    cdef llvm_blake3_hasher new():
        """Factory function to create llvm_blake3_hasher objects with
        newly allocated cblake3.llvm_blake3_hasher"""
        cdef cblake3.llvm_blake3_hasher* ptr
        llvm_blake3_hasher.__allocate(&ptr)
        return llvm_blake3_hasher.from_ptr(ptr, owner=True)

    @staticmethod
    cdef llvm_blake3_hasher from_value(cblake3.llvm_blake3_hasher other):
        """Allocate new C type and copy from ``other``.
        """
        wrapper = llvm_blake3_hasher.new()
        string.memcpy(wrapper._ptr, &other, sizeof(cblake3.llvm_blake3_hasher))
        return wrapper
   
    def __init__(self,*args,**kwargs):
        """Constructor type llvm_blake3_hasher.

        Constructor for type llvm_blake3_hasher.

        Args:
            *args:
                Positional arguments. Initialize all or a subset of the member variables
                according to their order of declaration.
            **kwargs: 
                Can be used to initialize member variables at construction,
                Just pass an argument expression of the form <member>=<value>
                per member that you want to initialize.
        """
        llvm_blake3_hasher.__allocate(&self._ptr)
        self.ptr_owner = True
        attribs = self.PROPERTIES()
        used_attribs = set()
        if len(args) > len(attribs):
            raise ValueError("More positional arguments specified than this type has properties.")
        for i,v in enumerate(args):
            setattr(self,attribs[i],v)
            used_attribs.add(attribs[i])
        valid_names = ", ".join(["'"+p+"'" for p in attribs])
        for k,v in kwargs.items():
            if k in used_attribs:
                raise KeyError(f"argument '{k}' has already been specified as positional argument.")
            elif k not in attribs:
                raise KeyError(f"'{k}' is no valid property name. Valid names: {valid_names}")
            setattr(self,k,v)
    
    def __int__(self):
        """Returns the data's address as long integer.
        """
        return cpython.long.PyLong_FromVoidPtr(self._ptr)
    def __repr__(self):
        return f"<llvm_blake3_hasher object, self.ptr={int(self)}>"
    def as_c_void_p(self):
        """Returns the data's address as `ctypes.c_void_p`
        Note:
            Implements as function to not collide with 
            autogenerated property names.
        """
        return ctypes.c_void_p(int(self))
    def c_sizeof(self):
        """Returns the size of the underlying C type in bytes.
        Note:
            Implements as function to not collide with 
            autogenerated property names.
        """
        return sizeof(cblake3.llvm_blake3_hasher)
    def get_key(self, i):
        """Get value of ``key`` of ``self._ptr[i]``.
        """
        return self._ptr[i].key
    # TODO add setters
    #def set_key(self, i, unsigned int[8] value):
    #    """Set value ``key`` of ``self._ptr[i]``.
    #    """
    #    self._ptr[i].key = value
    @property
    def key(self):
        """(undocumented)"""
        return self.get_key(0)
    # TODO add setters
    #@key.setter
    #def key(self, unsigned int[8] value):
    #    self.set_key(0,value)

    def get_chunk(self, i):
        """Get value of ``chunk`` of ``self._ptr[i]``.
        """
        return llvm_blake3_chunk_state.from_ptr(&self._ptr[i].chunk)
    @property
    def chunk(self):
        """(undocumented)"""
        return self.get_chunk(0)

    def get_cv_stack_len(self, i):
        """Get value ``cv_stack_len`` of ``self._ptr[i]``.
        """
        return self._ptr[i].cv_stack_len
    def set_cv_stack_len(self, i, unsigned char value):
        """Set value ``cv_stack_len`` of ``self._ptr[i]``.
        """
        self._ptr[i].cv_stack_len = value
    @property
    def cv_stack_len(self):
        """(undocumented)"""
        return self.get_cv_stack_len(0)
    @cv_stack_len.setter
    def cv_stack_len(self, unsigned char value):
        self.set_cv_stack_len(0,value)

    def get_cv_stack(self, i):
        """Get value of ``cv_stack`` of ``self._ptr[i]``.
        """
        return self._ptr[i].cv_stack
    # TODO add setters
    #def set_cv_stack(self, i, unsigned char[1760] value):
    #    """Set value ``cv_stack`` of ``self._ptr[i]``.
    #    """
    #    self._ptr[i].cv_stack = value
    @property
    def cv_stack(self):
        """(undocumented)"""
        return self.get_cv_stack(0)
    # TODO add setters
    #@cv_stack.setter
    #def cv_stack(self, unsigned char[1760] value):
    #    self.set_cv_stack(0,value)

    @staticmethod
    def PROPERTIES():
        return ["key","chunk","cv_stack_len","cv_stack"]

    def __contains__(self,item):
        properties = self.PROPERTIES()
        return item in properties

    def __getitem__(self,item):
        properties = self.PROPERTIES()
        if isinstance(item,int):
            if item < 0 or item >= len(properties):
                raise IndexError()
            return getattr(self,properties[item])
        raise ValueError("'item' type must be 'int'")


@cython.embedsignature(True)
def llvm_blake3_version():
    r"""(No short description, might be part of a group.)

    Returns:
        A `~.tuple` of size 1 that contains (in that order):

        * `~.bytes`
    """
    cdef const char * _llvm_blake3_version__retval = cblake3.llvm_blake3_version()    # fully specified
    return (_llvm_blake3_version__retval,)


@cython.embedsignature(True)
def llvm_blake3_hasher_init(object self):
    r"""(No short description, might be part of a group.)

    Args:
        self (`~.llvm_blake3_hasher`/`~.object`):
            (undocumented)
    """
    cblake3.llvm_blake3_hasher_init(
        llvm_blake3_hasher.from_pyobj(self)._ptr)    # fully specified


@cython.embedsignature(True)
def llvm_blake3_hasher_init_keyed(object self, const unsigned char[32] key):
    r"""(No short description, might be part of a group.)

    Args:
        self (`~.llvm_blake3_hasher`/`~.object`):
            (undocumented)

        key (`~.l`/`~.i`/`~.s`/`~.t`):
            (undocumented)
    """
    cblake3.llvm_blake3_hasher_init_keyed(
        llvm_blake3_hasher.from_pyobj(self)._ptr,key)    # fully specified


@cython.embedsignature(True)
def llvm_blake3_hasher_init_derive_key(object self, const char * context):
    r"""(No short description, might be part of a group.)

    Args:
        self (`~.llvm_blake3_hasher`/`~.object`):
            (undocumented)

        context (`~.bytes`):
            (undocumented)
    """
    cblake3.llvm_blake3_hasher_init_derive_key(
        llvm_blake3_hasher.from_pyobj(self)._ptr,context)    # fully specified


@cython.embedsignature(True)
def llvm_blake3_hasher_init_derive_key_raw(object self, object context, unsigned long context_len):
    r"""(No short description, might be part of a group.)

    Args:
        self (`~.llvm_blake3_hasher`/`~.object`):
            (undocumented)

        context (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        context_len (`~.int`):
            (undocumented)
    """
    cblake3.llvm_blake3_hasher_init_derive_key_raw(
        llvm_blake3_hasher.from_pyobj(self)._ptr,
        <const void *>rocm.llvm._util.Pointer.from_pyobj(context)._ptr,context_len)    # fully specified


@cython.embedsignature(True)
def llvm_blake3_hasher_update(object self, object input, unsigned long input_len):
    r"""(No short description, might be part of a group.)

    Args:
        self (`~.llvm_blake3_hasher`/`~.object`):
            (undocumented)

        input (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        input_len (`~.int`):
            (undocumented)
    """
    cblake3.llvm_blake3_hasher_update(
        llvm_blake3_hasher.from_pyobj(self)._ptr,
        <const void *>rocm.llvm._util.Pointer.from_pyobj(input)._ptr,input_len)    # fully specified


@cython.embedsignature(True)
def llvm_blake3_hasher_finalize(object self, object out, unsigned long out_len):
    r"""(No short description, might be part of a group.)

    Args:
        self (`~.llvm_blake3_hasher`/`~.object`):
            (undocumented)

        out (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        out_len (`~.int`):
            (undocumented)
    """
    cblake3.llvm_blake3_hasher_finalize(
        llvm_blake3_hasher.from_pyobj(self)._ptr,
        <unsigned char *>rocm.llvm._util.Pointer.from_pyobj(out)._ptr,out_len)    # fully specified


@cython.embedsignature(True)
def llvm_blake3_hasher_finalize_seek(object self, unsigned long seek, object out, unsigned long out_len):
    r"""(No short description, might be part of a group.)

    Args:
        self (`~.llvm_blake3_hasher`/`~.object`):
            (undocumented)

        seek (`~.int`):
            (undocumented)

        out (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        out_len (`~.int`):
            (undocumented)
    """
    cblake3.llvm_blake3_hasher_finalize_seek(
        llvm_blake3_hasher.from_pyobj(self)._ptr,seek,
        <unsigned char *>rocm.llvm._util.Pointer.from_pyobj(out)._ptr,out_len)    # fully specified


@cython.embedsignature(True)
def llvm_blake3_hasher_reset(object self):
    r"""(No short description, might be part of a group.)

    Args:
        self (`~.llvm_blake3_hasher`/`~.object`):
            (undocumented)
    """
    cblake3.llvm_blake3_hasher_reset(
        llvm_blake3_hasher.from_pyobj(self)._ptr)    # fully specified

__all__ = [
    "llvm_blake3_chunk_state",
    "llvm_blake3_hasher",
    "llvm_blake3_version",
    "llvm_blake3_hasher_init",
    "llvm_blake3_hasher_init_keyed",
    "llvm_blake3_hasher_init_derive_key",
    "llvm_blake3_hasher_init_derive_key_raw",
    "llvm_blake3_hasher_update",
    "llvm_blake3_hasher_finalize",
    "llvm_blake3_hasher_finalize_seek",
    "llvm_blake3_hasher_reset",
]