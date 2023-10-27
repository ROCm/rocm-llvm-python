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

cimport cpython.long
cimport cpython.int
cimport cpython.buffer
cimport libc.stdlib
cimport libc.string
cimport libc.stdint

import ctypes
import math

__all__ = [
    # __all__ is important for generating the API documentation in source order
    "Pointer",
    "ListOfBytes",
    "ListOfPointer",
    "ListOfInt",
    "ListOfUnsigned",
    "ListOfUnsignedLong",
]

cdef class Pointer:
    """Datatype for handling Python arguments that need to be converted to a pointer type.

    Datatype for handling Python arguments that need to be converted to a pointer type
    when passed to an underlying C function.

    This type stores a C ``void *`` pointer to the original Python object's data
    plus an additional `Py_buffer` object if the pointer has ben acquired from a
    Python object that implements the `Python buffer protocol <https://docs.python.org/3/c-api/buffer.html>`_.

    In summary, the type can be initialized from the following Python objects:

    * `None`:

        This will set the ``self._ptr`` attribute to ``NULL``.

    * `~.Pointer`:

        Copies ``pyobj._ptr`` to ``self._ptr``.
        `~.Py_buffer` object ownership is not transferred!

    * `int`:
        
        Interprets the integer value as pointer address and writes it to ``self._ptr``.

    * `ctypes.c_void_p`:
        
        Takes the pointer address ``pyobj.value`` and writes it to ``self._ptr``.

    * `object` that implements the Python buffer protocol:
        
        If the object represents a simple contiguous array,
        writes the `Py_buffer` associated with ``pyobj`` to `self._py_buffer`,
        sets the `self._py_buffer_acquired` flag to `True`, and
        writes `self._py_buffer.buf` to the data pointer `self._ptr`.
    
    Type checks are performed in the above order.

    C Attributes:
        _ptr (C type ``void *``, protected):
            Stores a pointer to the data of the original Python object.
        _py_buffer (C type ``Py_buffer`, protected):
            Stores a pointer to the data of the original Python object.
        _py_buffer_acquired (C type ``bint``, protected):
            Stores a pointer to the data of the original Python object.
    """

    """
        """
    # C members declared in declaration part ``types.pxd``

    def __cinit__(self):
        self._ptr = NULL
        self._py_buffer_acquired = False

    cdef void* get_ptr(self):
        return self._ptr

    @staticmethod
    cdef Pointer from_ptr(void* ptr):
        cdef Pointer wrapper = Pointer.__new__(Pointer)
        wrapper._ptr = ptr
        return wrapper

    cdef void init_from_pyobj(self, object pyobj):
        """
        Note:
            If ``pyobj`` is an instance of Pointer, only the pointer is copied.
            Releasing an acquired Py_buffer handles is still an obligation of the original object.
        """       
        self._py_buffer_acquired = False
        if pyobj is None:
            self._ptr = NULL
        elif isinstance(pyobj,Pointer):
            self._ptr = (<Pointer>pyobj)._ptr
        elif isinstance(pyobj,int):
            self._ptr = cpython.long.PyLong_AsVoidPtr(pyobj)
        elif isinstance(pyobj,ctypes.c_void_p):
            self._ptr = cpython.long.PyLong_AsVoidPtr(pyobj.value) if pyobj.value != None else NULL
        elif cpython.buffer.PyObject_CheckBuffer(pyobj):
            err = cpython.buffer.PyObject_GetBuffer( 
                pyobj, 
                &self._py_buffer, 
                cpython.buffer.PyBUF_SIMPLE | cpython.buffer.PyBUF_ANY_CONTIGUOUS
            )
            if err == -1:
                raise RuntimeError("failed to create simple, contiguous Py_buffer from Python object")
            self._py_buffer_acquired = True
            self._ptr = self._py_buffer.buf
        else:
            raise TypeError(f"unsupported input type: '{str(type(pyobj))}'")

    @staticmethod
    cdef Pointer from_pyobj(object pyobj):
        """Derives a Pointer from the given object.

        In case ``pyobj`` is itself an ``Pointer`` instance, this method
        returns it directly. No new Pointer is created.

        Args:
            pyobj (`object`): 
                Must be either `None`, a simple, contiguous buffer according to the buffer protocol,
                or of type `~.Pointer`, `int`, or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original pyobj
            if ``pyobj`` is an instance of `~.Pointer`.
        """
        cdef Pointer wrapper = Pointer.__new__(Pointer)
        
        if isinstance(pyobj,Pointer):
            return pyobj
        else:
            wrapper = Pointer.__new__(Pointer)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        if self._py_buffer_acquired is True:
            cpython.buffer.PyBuffer_Release(&self._py_buffer)
    @property
    def is_ptr_null(self):
        """If data pointer is NULL.
        """
        return self._ptr == NULL
    def __int__(self):
        """Integer representation of the data pointer.
        """
        return cpython.long.PyLong_FromVoidPtr(self._ptr)
    def __repr__(self):
        return f"<Pointer object, _ptr={int(self)}>"
    def as_c_void_p(self):
        """"Data pointer as ``ctypes.c_void_p``.
        """
        return ctypes.c_void_p(int(self))

    def __getitem__(self,offset):
        """Returns a new Pointer whose pointer is this instance's pointer offsetted by ``offset``.

        Args:
            offset (`int`): Offset (in bytes) to add to this instance's pointer.
        """
        cdef Pointer result
        if isinstance(offset,int):
            if offset < 0:
                raise ValueError("offset='{offset}' must be non-negative")
            return Pointer.from_ptr(<void*>(<unsigned long>self._ptr + cpython.long.PyLong_AsUnsignedLong(offset)))
        raise NotImplementedError("'__getitem__': not implemented for other 'offset' types than 'int'")
    
    def __init__(self,object pyobj):
        """Constructor.

        Args:
            pyobj (`object`): 
                See the class description `~.Pointer` for information
                about accepted types for ``pyobj``.

        Raises:
            `TypeError`: If the input object ``pyobj`` is not of the right type.
        """

        Pointer.init_from_pyobj(self,pyobj)

cdef class ListOfBytes(Pointer):
    """Datatype for handling Python `list` or `tuple` objects with entries of type `bytes`.

    Datatype for handling Python `list` and `tuple` objects with entries of type `bytes`
    that need to be converted to a pointer type when passed to the underlying C function.

    The type can be initialized from the following Python objects:

    * `list` / `tuple` of `bytes:

        A `list` or `tuple` of `bytes` objects.
        In this case, this type allocates an array of ``const char*`` pointers wherein it stores the addresses from the `list`/`tuple` entries.
        Furthermore, the instance's `self._owner` C attribute is set to `True` in this case.

    * `object` that is accepted as input by `~.Pointer.__init__`:

        In this case, init code from `~.Pointer` is used and the C attribute `self._owner` remains unchanged.
        See `~.Pointer.__init__` for more information.
        
    Note:
        Type checks are performed in the above order.

    C Attributes:
        _ptr (``void *``, protected):
            See `~.Pointer` for more information.
        _py_buffer (`~.Py_buffer`, protected):
            See `~.Pointer` for more information.
        _py_buffer_acquired (`bool`, protected):
            See `~.Pointer` for more information.
        _owner (`bint`, protected):
            If this object is the owner of the allocated buffer. Defaults to `False`.
    """
    # C members declared in declaration part ``types.pxd``

    def __repr__(self):
        return f"<ListOfBytes object, _ptr={int(self)}>"

    def __cinit__(self):
        self._owner = False

    @staticmethod
    cdef ListOfBytes from_ptr(void* ptr):
        cdef ListOfBytes wrapper = ListOfBytes.__new__(ListOfBytes)
        wrapper._ptr = ptr
        return wrapper

    cdef void init_from_pyobj(self, object pyobj):
        """
        Note:
            If ``pyobj`` is an instance of `ListOfBytes`, only the pointer is copied.
            Releasing an acquired Py_buffer and temporary memory are still obligations 
            of the original object.
        """
        cdef const char* entry_as_cstr = NULL

        self._py_buffer_acquired = False
        self._owner = False
        if isinstance(pyobj,ListOfBytes):
            self._ptr = (<ListOfBytes>pyobj)._ptr
        elif isinstance(pyobj,(tuple,list)):
            self._owner = True
            self._ptr = libc.stdlib.malloc(len(pyobj)*sizeof(const char*))
            libc.string.memset(<void*>self._ptr, 0, len(pyobj)*sizeof(const char*))
            for i,entry in enumerate(pyobj):
                if not isinstance(entry,bytes):
                    raise ValueError("elements of list/tuple input must be of type 'bytes'")
                entry_as_cstr = entry # assumes pyobj/pyobj's entries won't be garbage collected
                # More details: https://cython.readthedocs.io/en/latest/src/tutorial/strings.html
                (<const char**>self._ptr)[i] = entry_as_cstr
        else:
            self._owner = False
            Pointer.init_from_pyobj(self,pyobj)

    @staticmethod
    cdef ListOfBytes from_pyobj(object pyobj):
        """Derives a ListOfBytes from the given object.

        In case ``pyobj`` is itself an `ListOfBytes` instance, this method
        returns it directly. No new ListOfBytes is created.

        Args:
            pyobj (`object`): Must be either `None`, a simple, contiguous buffer according to the buffer protocol,
                or of type `ListOfBytes`, `int`, or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original pyobj
            if ``pyobj`` is an instance of ListOfBytes.
        Note:
            This routines assumes that the original input is not garbage
            collected before the deletion of this object.
        """
        cdef ListOfBytes wrapper = ListOfBytes.__new__(ListOfBytes)
        
        if isinstance(pyobj,ListOfBytes):
            return pyobj
        else:
            wrapper = ListOfBytes.__new__(ListOfBytes)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        if self._owner:
            libc.stdlib.free(self._ptr)

    def __init__(self,object pyobj):
        """Constructor.

        Args:
            pyobj (`object`): 
                See the class description `~.ListOfBytes` for information
                about accepted types for ``pyobj``.

        Raises:
            `TypeError`: If the input object ``pyobj`` is not of the right type.
        """
        ListOfBytes.init_from_pyobj(self,pyobj)

cdef class ListOfPointer(Pointer):
    """Datatype for handling Python `list` or `tuple` objects with entries that can be converted to type `~.Pointer`.

    Datatype for handling Python `list` and `tuple` objects with entries that can be converted to type `~.Pointer`.
    Such entries might be of type `None`, `int`, `ctypes.c_void_p`, Python buffer interface implementors, `~.Pointer`, subclasses of `~.Pointer`.

    The type can be initialized from the following Python objects:

    * `list` / `tuple` of `bytes`:

        A `list` or `tuple` of types that can be converted to `~.Pointer`.
        In this case, this type allocates an array of ``void *`` pointers wherein it stores the addresses obtained from the `list`/`tuple` entries.
        Furthermore, the instance's `self._owner` C attribute is set to `True` in this case.

    * `object` that is accepted as input by `~.Pointer.__init__`:

        In this case, init code from `~.Pointer` is used and the C attribute `self._owner` remains unchanged.
        See `~.Pointer.__init__` for more information.
    
    Note:
        Type checks are performed in the above order.

    C Attributes:
        _ptr (``void *``, protected):
            See `~.Pointer` for more information.
        _py_buffer (`~.Py_buffer`, protected):
            See `~.Pointer` for more information.
        _py_buffer_acquired (`bool`, protected):
            See `~.Pointer` for more information.
        _owner (`bint`, protected):
            If this object is the owner of the allocated buffer. Defaults to `False`.
    """
    # C members declared in declaration part ``types.pxd``
    
    def __repr__(self):
        return f"<ListOfPointer object, _ptr={int(self)}>"

    def __cinit__(self):
        self._owner = False

    @staticmethod
    cdef ListOfPointer from_ptr(void* ptr):
        cdef ListOfPointer wrapper = ListOfPointer.__new__(ListOfPointer)
        wrapper._ptr = ptr
        return wrapper

    cdef void init_from_pyobj(self, object pyobj):
        """
        Note:
            If ``pyobj`` is an instance of `ListOfPointer`, only the pointer is copied.
            Releasing an acquired Py_buffer and temporary memory are still obligations 
            of the original object.
        """
        self._py_buffer_acquired = False
        self._owner = False
        if isinstance(pyobj,ListOfPointer):
            self._ptr = (<ListOfPointer>pyobj)._ptr
        
        elif isinstance(pyobj,(tuple,list)):
            self._owner = True
            self._ptr = libc.stdlib.malloc(len(pyobj)*sizeof(void *))
            libc.string.memset(<void*>self._ptr, 0, len(pyobj)*sizeof(void *))
            for i,entry in enumerate(pyobj):
                (<void**>self._ptr)[i] = cpython.long.PyLong_AsVoidPtr(int(Pointer.from_pyobj(entry)))
        else:
            self._owner = False
            Pointer.init_from_pyobj(self,pyobj)

    @staticmethod
    cdef ListOfPointer from_pyobj(object pyobj):
        """Derives a ListOfPointer from the given object.

        In case ``pyobj`` is itself an `ListOfPointer` instance, this method
        returns it directly. No new `ListOfPointer` is created.

        Args:
            pyobj (`object`): 
                Must be either a `list` or `tuple` of objects that can be converted
                to `~.Pointer`, or any other `object` that is accepted as input by `~.Pointer.__init__`.

        Note:
            This routine does not perform a copy but returns the original pyobj
            if `pyobj` is an instance of ListOfPointer.
        Note:
            This routines assumes that the original input is not garbage
            collected before the deletion of this object.
        """
        cdef ListOfPointer wrapper = ListOfPointer.__new__(ListOfPointer)
        
        if isinstance(pyobj,ListOfPointer):
            return pyobj
        else:
            wrapper = ListOfPointer.__new__(ListOfPointer)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        if self._owner:
            libc.stdlib.free(self._ptr)

    def __init__(self,object pyobj):
        """Constructor.

        Args:
            pyobj (`object`): 
                See the class description `~.ListOfPointer` for information
                about accepted types for ``pyobj``.

        Raises:
            `TypeError`: If the input object ``pyobj`` is not of the right type.
        """
        ListOfPointer.init_from_pyobj(self,pyobj)

cdef class ListOfInt(Pointer):
    """Datatype for handling Python `list` or `tuple` objects with entries that can be converted to C type ``int``.

    Datatype for handling Python `list` and `tuple` objects with entries that can be converted to C type ``int``.
    Such entries might be of Python type `None`, `int`, or of any `ctypes` integer type.

    The type can be initialized from the following Python objects:

    * `list` / `tuple` of types that can be converted to C type ``int``:

        A `list` or `tuple` of types that can be converted to C type ``int``.
        In this case, this type allocates an array of C ``int`` values wherein it stores the values obtained from the `list`/`tuple` entries.
        Furthermore, the instance's `self._owner` C attribute is set to `True` in this case.

    * `object` that is accepted as input by `~.Pointer.__init__`:

        In this case, init code from `~.Pointer` is used and the C attribute `self._owner` remains unchanged.
        See `~.Pointer` for more information.
    
    Note:
        Type checks are performed in the above order.

    Note:
        Simple, contiguous numpy and Python 3 array types can be passed
        directly to this routine as they implement the Python buffer protocol.

    C Attributes:
        _ptr (``void *``, protected):
            See `~.Pointer` for more information.
        _py_buffer (`~.Py_buffer`, protected):
            See `~.Pointer` for more information.
        _py_buffer_acquired (`bool`, protected):
            See `~.Pointer` for more information.
        _owner (`bint`, protected):
            If this object is the owner of the allocated buffer. Defaults to `False`.
    """
    # C members declared in declaration part ``types.pxd``

    def __repr__(self):
        return f"<ListOfDataInt object, _ptr={int(self)}>"

    def __cinit__(self):
        self._owner = False

    @staticmethod
    cdef ListOfInt from_ptr(void* ptr):
        cdef ListOfInt wrapper = ListOfInt.__new__(ListOfInt)
        wrapper._ptr = ptr
        return wrapper

    cdef void init_from_pyobj(self, object pyobj):
        """
        Note:
            If ``pyobj`` is an instance of ListOfInt, only the pointer is copied.
            Releasing an acquired Py_buffer and temporary memory are still obligations 
            of the original object.
        """
        self._py_buffer_acquired = False
        self._owner = False
        if isinstance(pyobj,ListOfInt):
            self._ptr = (<ListOfInt>pyobj)._ptr
        
        elif isinstance(pyobj,(tuple,list)):
            self._owner = True
            self._ptr = libc.stdlib.malloc(len(pyobj)*sizeof(int))
            libc.string.memset(<void*>self._ptr, 0, len(pyobj)*sizeof(int))
            for i,entry in enumerate(pyobj):
                if isinstance(entry,int):
                    (<int*>self._ptr)[i] = <int>cpython.long.PyLong_AsLongLong(pyobj)
                elif isinstance(entry,(
                    ctypes.c_bool,
                    ctypes.c_short,
                    ctypes.c_ushort,
                    ctypes.c_int,
                    ctypes.c_uint,
                    ctypes.c_long,
                    ctypes.c_ulong,
                    ctypes.c_longlong,
                    ctypes.c_ulonglong,
                    ctypes.c_size_t,
                    ctypes.c_ssize_t,
                )):
                    (<int*>self._ptr)[i] = <int>cpython.long.PyLong_AsLongLong(entry.value)
                else:
                    raise ValueError(f"element '{i}' of input cannot be converted to C int type")
        else:
            self._owner = False
            Pointer.init_from_pyobj(self,pyobj)

    @staticmethod
    cdef ListOfInt from_pyobj(object pyobj):
        """Derives a ListOfInt from the given object.

        In case ``pyobj`` is itself an ``ListOfInt`` instance, this method
        returns it directly. No new ListOfInt is created.

        Args:
            pyobj (`object`): 
                Must be either a `list` or `tuple` of objects that can be converted
                to C type ``int``, or any other `object` that is accepted as input by `~.Pointer.__init__`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of `ListOfInt`.
        Note:
            This routines assumes that the original input is not garbage
            collected before the deletion of this object.
        """
        cdef ListOfInt wrapper = ListOfInt.__new__(ListOfInt)
        
        if isinstance(pyobj,ListOfInt):
            return pyobj
        else:
            wrapper = ListOfInt.__new__(ListOfInt)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        if self._owner:
            libc.stdlib.free(self._ptr)

    def __init__(self,object pyobj):
        """Constructor.

        Args:
            pyobj (`object`): 
                See the class description `~.ListOfInt` for information
                about accepted types for ``pyobj``.

        Raises:
            `TypeError`: If the input object ``pyobj`` is not of the right type.
        """
        ListOfInt.init_from_pyobj(self,pyobj)

cdef class ListOfUnsigned(Pointer):
    """Datatype for handling Python `list` or `tuple` objects with entries that can be converted to C type ``unsigned``.

    Datatype for handling Python `list` and `tuple` objects with entries that can be converted to C type ``unsigned``.
    Such entries might be of Python type `None`, `int`, or of any `ctypes` integer type.

    The type can be initialized from the following Python objects:

    * `list` / `tuple` of types that can be converted to C type ``unsigned``:

        A `list` or `tuple` of types that can be converted to C type ``unsigned``.
        In this case, this type allocates an array of C ``unsigned`` values wherein it stores the values obtained from the `list`/`tuple` entries.
        Furthermore, the instance's `self._owner` C attribute is set to `True` in this case.

    * `object` that is accepted as input by `~.Pointer.__init__`:

        In this case, init code from `~.Pointer` is used and the C attribute `self._owner` remains unchanged.
        See `~.Pointer` for more information.
    
    Note:
        Type checks are performed in the above order.

    Note:
        Simple, contiguous numpy and Python 3 array types can be passed
        directly to this routine as they implement the Python buffer protocol.

    C Attributes:
        _ptr (``void *``, protected):
            See `~.Pointer` for more information.
        _py_buffer (`~.Py_buffer`, protected):
            See `~.Pointer` for more information.
        _py_buffer_acquired (`bool`, protected):
            See `~.Pointer` for more information.
        _owner (`bint`, protected):
            If this object is the owner of the allocated buffer. Defaults to `False`.
    """
    # C members declared in declaration part ``types.pxd``
    
    def __repr__(self):
        return f"<ListOfUnsigned object, _ptr={int(self)}>"

    def __cinit__(self):
        self._owner = False

    @staticmethod
    cdef ListOfUnsigned from_ptr(void* ptr):
        cdef ListOfUnsigned wrapper = ListOfUnsigned.__new__(ListOfUnsigned)
        wrapper._ptr = ptr
        return wrapper

    cdef void init_from_pyobj(self, object pyobj):
        """
        Note:
            If ``pyobj`` is an instance of `ListOfUnsigned`, only the pointer is copied.
            Releasing an acquired `Py_buffer` and temporary memory are still obligations 
            of the original object.
        """
        self._py_buffer_acquired = False
        self._owner = False
        if isinstance(pyobj,ListOfUnsigned):
            self._ptr = (<ListOfUnsigned>pyobj)._ptr
        
        elif isinstance(pyobj,(tuple,list)):
            self._owner = True
            self._ptr = libc.stdlib.malloc(len(pyobj)*sizeof(unsigned int))
            libc.string.memset(<void*>self._ptr, 0, len(pyobj)*sizeof(unsigned int))
            for i,entry in enumerate(pyobj):
                if isinstance(entry,int):
                    (<unsigned int*>self._ptr)[i] = <unsigned int>cpython.long.PyLong_AsUnsignedLongLong(pyobj)
                elif isinstance(entry,(
                    ctypes.c_bool,
                    ctypes.c_short,
                    ctypes.c_ushort,
                    ctypes.c_int,
                    ctypes.c_uint,
                    ctypes.c_long,
                    ctypes.c_ulong,
                    ctypes.c_longlong,
                    ctypes.c_ulonglong,
                    ctypes.c_size_t,
                    ctypes.c_ssize_t,
                )):
                    (<unsigned int*>self._ptr)[i] = <unsigned int>cpython.long.PyLong_AsUnsignedLongLong(entry.value)
                else:
                    raise ValueError(f"element '{i}' of input cannot be converted to C unsigned int type")
        else:
            self._owner = False
            Pointer.init_from_pyobj(self,pyobj)

    @staticmethod
    cdef ListOfUnsigned from_pyobj(object pyobj):
        """Derives a ListOfUnsigned from the given object.

        In case ``pyobj`` is itself an `ListOfUnsigned` instance, this method
        returns it directly. No new ListOfUnsigned is created.

        Args:
            pyobj (`object`): 
                Must be either a `list` or `tuple` of objects that can be converted
                to C type ``unsigned``, or any other `object` that is accepted as input by `~.Pointer.__init__`.

        Note:
            This routine does not perform a copy but returns the original pyobj
            if ``pyobj`` is an instance of `ListOfUnsigned`.
        Note:
            This routines assumes that the original input is not garbage
            collected before the deletion of this object.
        """
        cdef ListOfUnsigned wrapper = ListOfUnsigned.__new__(ListOfUnsigned)
        
        if isinstance(pyobj,ListOfUnsigned):
            return pyobj
        else:
            wrapper = ListOfUnsigned.__new__(ListOfUnsigned)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        if self._owner:
            libc.stdlib.free(self._ptr)

    def __init__(self,object pyobj):
        """Constructor.

        Args:
            pyobj (`object`): 
                See the class description `~.ListOfUnsigned` for information
                about accepted types for ``pyobj``.

        Raises:
            `TypeError`: If the input object ``pyobj`` is not of the right type.
        """
        ListOfUnsigned.init_from_pyobj(self,pyobj)

cdef class ListOfUnsignedLong(Pointer):
    """Datatype for handling Python `list` or `tuple` objects with entries that can be converted to C type ``unsigned long``.

    Datatype for handling Python `list` and `tuple` objects with entries that can be converted to C type ``unsigned long``.
    Such entries might be of Python type `None`, `int`, or of any `ctypes` integer type.

    The type can be initialized from the following Python objects:

    * `list` / `tuple` of types that can be converted to C type ``unsigned long``:
    
        A `list` or `tuple` of types that can be converted to C type ``unsigned long``.
        In this case, this type allocates an array of C ``unsigned long`` values wherein it stores the values obtained from the `list`/`tuple` entries.
        Furthermore, the instance's `self._owner` C attribute is set to `True` in this case.

    * `object` that is accepted as input by `~.Pointer.__init__`:
    
        In this case, init code from `~.Pointer` is used and the C attribute `self._owner` remains unchanged.
        See `~.Pointer` for more information.
    
    Note:
        Type checks are performed in the above order.

    Note:
        Simple, contiguous numpy and Python 3 array types can be passed
        directly to this routine as they implement the Python buffer protocol.

    C Attributes:
        _ptr (``void *``, protected):
            See `~.Pointer` for more information.
        _py_buffer (`~.Py_buffer`, protected):
            See `~.Pointer` for more information.
        _py_buffer_acquired (`bool`, protected):
            See `~.Pointer` for more information.
        _owner (`bint`, protected):
            If this object is the owner of the allocated buffer. Defaults to `False`.
    """
    # C members declared in declaration part ``types.pxd``
    
    def __repr__(self):
        return f"<ListOfUnsigned object, _ptr={int(self)}>"

    def __cinit__(self):
        self._owner = False

    @staticmethod
    cdef ListOfUnsignedLong from_ptr(void* ptr):
        cdef ListOfUnsignedLong wrapper = ListOfUnsignedLong.__new__(ListOfUnsignedLong)
        wrapper._ptr = ptr
        return wrapper

    cdef void init_from_pyobj(self, object pyobj):
        """
        Note:
            If ``pyobj`` is an instance of `ListOfUnsignedLong`, only the pointer is copied.
            Releasing an acquired `Py_buffer` and temporary memory are still obligations 
            of the original object.
        """
        self._py_buffer_acquired = False
        self._owner = False
        if isinstance(pyobj,ListOfUnsignedLong):
            self._ptr = (<ListOfUnsignedLong>pyobj)._ptr
        
        elif isinstance(pyobj,(tuple,list)):
            self._owner = True
            self._ptr = libc.stdlib.malloc(len(pyobj)*sizeof(unsigned long))
            libc.string.memset(<void*>self._ptr, 0, len(pyobj)*sizeof(unsigned long))
            for i,entry in enumerate(pyobj):
                if isinstance(entry,int):
                    (<unsigned long*>self._ptr)[i] = <unsigned long>cpython.long.PyLong_AsUnsignedLongLong(pyobj)
                elif isinstance(entry,(
                    ctypes.c_bool,
                    ctypes.c_short,
                    ctypes.c_ushort,
                    ctypes.c_int,
                    ctypes.c_uint,
                    ctypes.c_long,
                    ctypes.c_ulong,
                    ctypes.c_longlong,
                    ctypes.c_ulonglong,
                    ctypes.c_size_t,
                    ctypes.c_ssize_t,
                )):
                    (<unsigned long*>self._ptr)[i] = <unsigned long>cpython.long.PyLong_AsUnsignedLongLong(entry.value)
                else:
                    raise ValueError(f"element '{i}' of input cannot be converted to C unsigned long type")
        else:
            self._owner = False
            Pointer.init_from_pyobj(self,pyobj)

    @staticmethod
    cdef ListOfUnsignedLong from_pyobj(object pyobj):
        """Derives a ListOfUnsignedLong from the given object.

        In case ``pyobj`` is itself an ``ListOfUnsignedLong`` instance, this method
        returns it directly. No new ListOfUnsignedLong is created.

        Args:
            pyobj (`object`): 
                Must be either a `list` or `tuple` of objects that can be converted
                to C type ``unsigned long``, or any other `object` that is accepted as input by `~.Pointer.__init__`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of ListOfUnsignedLong.
        Note:
            This routines assumes that the original input is not garbage
            collected before the deletion of this object.
        """
        cdef ListOfUnsignedLong wrapper = ListOfUnsignedLong.__new__(ListOfUnsignedLong)
        
        if isinstance(pyobj,ListOfUnsignedLong):
            return pyobj
        else:
            wrapper = ListOfUnsignedLong.__new__(ListOfUnsignedLong)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        if self._owner:
            libc.stdlib.free(self._ptr)

    def __init__(self,object pyobj):
        """Constructor.

        Args:
            pyobj (`object`): 
                See the class description `~.ListOfUnsigned` for information
                about accepted types for ``pyobj``.

        Raises:
            `TypeError`: If the input object ``pyobj`` is not of the right type.
        """
        ListOfUnsignedLong.init_from_pyobj(self,pyobj)