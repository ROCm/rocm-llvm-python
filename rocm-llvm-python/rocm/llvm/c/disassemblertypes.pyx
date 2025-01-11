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


"""
(No short description)


"""

import cython
import ctypes
import enum


cdef class LLVMOpInfoCallback(rocm.llvm._util.types.Pointer):
    """Python wrapper for cdef class cdisassemblertypes.LLVMOpInfoCallback.

    Python wrapper for cdef class cdisassemblertypes.LLVMOpInfoCallback.

    If this type is initialized via its `__init__` method, it allocates a
    member of the underlying C type and destroys it again if the wrapper
    type is deallocated.

    This type also serves as adapter when appearing as argument type in a
    function signature. In this case, the type can further be initialized
    from a number of Python objects:

    * `None`:

      This will set the ``self._ptr`` attribute to ``NULL``.

    * `int`:

      Interprets the integer value as pointer address and writes it to ``self._ptr``.
      No ownership is transferred.

    * `ctypes.c_void_p`:

      Takes the pointer address ``pyobj.value`` and writes it to ``self._ptr``.
      No ownership is transferred.

    * `object` that implements the `CUDA Array Interface <https://numba.readthedocs.io/en/stable/cuda/cuda_array_interface.html>`_ protocol:

      Takes the integer-valued pointer address, i.e. the first entry of the `data` tuple
      from `pyobj`'s member ``__cuda_array_interface__``  and writes it to ``self._ptr``.

    * `object` that implements the Python buffer protocol:

      If the object represents a simple contiguous array,
      writes the `Py_buffer` associated with ``pyobj`` to `self._py_buffer`,
      sets the `self._py_buffer_acquired` flag to `True`, and
      writes `self._py_buffer.buf` to the data pointer `self._ptr`.

    * `rocm.llvm._util.types.Pointer`:

      Takes the pointer address ``pyobj._ptr`` and writes it to ``self._ptr``.
      No ownership is transferred.

    Type checks are performed in the above order.

    C Attributes:
        _ptr (C type ``void *``, protected):
            Stores a pointer to the data of the original Python object.
        _is_ptr_owner (C type ``bint``, protected):
            If this wrapper is the owner of the underlying data.
        _py_buffer (C type ``Py_buffer`, protected):
            Stores a pointer to the data of the original Python object.
        _py_buffer_acquired (C type ``bint``, protected):
            Stores a pointer to the data of the original Python object.
    """
    # C members declared in pxd file

    def __cinit__(self):
        self._ptr = NULL
        self._is_ptr_owner = False
        self._py_buffer_acquired = False

    cdef cdisassemblertypes.LLVMOpInfoCallback getElementPtr(self):
        return <cdisassemblertypes.LLVMOpInfoCallback>self._ptr

    @staticmethod
    cdef LLVMOpInfoCallback fromPtr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMOpInfoCallback`` objects from
        given ``cdisassemblertypes.LLVMOpInfoCallback`` pointer.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMOpInfoCallback wrapper = LLVMOpInfoCallback.__new__(LLVMOpInfoCallback)
        wrapper._ptr = ptr
        wrapper._is_ptr_owner = owner
        return wrapper

    @staticmethod
    def fromObj(pyobj):
        """Creates a LLVMOpInfoCallback from a Python object.

        Derives a LLVMOpInfoCallback from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpInfoCallback`` reference, this method
        returns it directly. No new ``LLVMOpInfoCallback`` is created in this case.
        """
        return LLVMOpInfoCallback.fromPyobj(pyobj)

    @staticmethod
    cdef LLVMOpInfoCallback fromPyobj(object pyobj):
        """Creates a LLVMOpInfoCallback from a Python object.

        Derives a LLVMOpInfoCallback from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpInfoCallback`` reference, this method
        returns it directly. No new ``LLVMOpInfoCallback`` is created in this case.

        Args:
            pyobj (object): Must be either `None`; a `rocm.llvm._util.types.Pointer`; a simple, contiguous buffer according to the buffer protocol;
                            or of type `LLVMOpInfoCallback`; `int`; or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of LLVMOpInfoCallback!
        """
        cdef LLVMOpInfoCallback wrapper

        if isinstance(pyobj,LLVMOpInfoCallback):
            return pyobj
        else:
            wrapper = LLVMOpInfoCallback.__new__(LLVMOpInfoCallback)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        # Release the buffer handle
        if self._py_buffer_acquired is True:
            cpython.buffer.PyBuffer_Release(&self._py_buffer)

    def __int__(self):
        """Returns the data's address as long integer.
        """
        return cpython.long.PyLong_FromVoidPtr(self._ptr)

    def __repr__(self):
        return f"<LLVMOpInfoCallback object, ptr: {int(self)}>"

    def as_c_void_p(self):
        """Returns the data's address as `ctypes.c_void_p`
        Note:
            Implemented as function to not collide with
            autogenerated property names.
        """
        return ctypes.c_void_p(int(self))


cdef class LLVMOpInfoSymbol1(rocm.llvm._util.types.Pointer):
    """Python wrapper for cdef class cdisassemblertypes.LLVMOpInfoSymbol1.

    Python wrapper for cdef class cdisassemblertypes.LLVMOpInfoSymbol1.

    If this type is initialized via its `__init__` method, it allocates a
    member of the underlying C type and destroys it again if the wrapper
    type is deallocated.

    This type also serves as adapter when appearing as argument type in a
    function signature. In this case, the type can further be initialized
    from a number of Python objects:

    * `None`:

      This will set the ``self._ptr`` attribute to ``NULL``.

    * `int`:

      Interprets the integer value as pointer address and writes it to ``self._ptr``.
      No ownership is transferred.

    * `ctypes.c_void_p`:

      Takes the pointer address ``pyobj.value`` and writes it to ``self._ptr``.
      No ownership is transferred.

    * `object` that implements the `CUDA Array Interface <https://numba.readthedocs.io/en/stable/cuda/cuda_array_interface.html>`_ protocol:

      Takes the integer-valued pointer address, i.e. the first entry of the `data` tuple
      from `pyobj`'s member ``__cuda_array_interface__``  and writes it to ``self._ptr``.

    * `object` that implements the Python buffer protocol:

      If the object represents a simple contiguous array,
      writes the `Py_buffer` associated with ``pyobj`` to `self._py_buffer`,
      sets the `self._py_buffer_acquired` flag to `True`, and
      writes `self._py_buffer.buf` to the data pointer `self._ptr`.

    * `rocm.llvm._util.types.Pointer`:

      Takes the pointer address ``pyobj._ptr`` and writes it to ``self._ptr``.
      No ownership is transferred.

    Type checks are performed in the above order.

    C Attributes:
        _ptr (C type ``void *``, protected):
            Stores a pointer to the data of the original Python object.
        _is_ptr_owner (C type ``bint``, protected):
            If this wrapper is the owner of the underlying data.
        _py_buffer (C type ``Py_buffer`, protected):
            Stores a pointer to the data of the original Python object.
        _py_buffer_acquired (C type ``bint``, protected):
            Stores a pointer to the data of the original Python object.
    """
    # C members declared in pxd file

    def __cinit__(self):
        self._ptr = NULL
        self._is_ptr_owner = False
        self._py_buffer_acquired = False

    cdef cdisassemblertypes.LLVMOpInfoSymbol1* getElementPtr(self):
        return <cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr

    @staticmethod
    cdef LLVMOpInfoSymbol1 fromPtr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMOpInfoSymbol1`` objects from
        given ``cdisassemblertypes.LLVMOpInfoSymbol1`` pointer.

        Setting ``owner`` flag to ``True`` causes
        the extension type to free the structure pointed to by ``ptr``
        when the wrapper object is deallocated.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMOpInfoSymbol1 wrapper = LLVMOpInfoSymbol1.__new__(LLVMOpInfoSymbol1)
        wrapper._ptr = ptr
        wrapper._is_ptr_owner = owner
        return wrapper

    @staticmethod
    def fromObj(pyobj):
        """Creates a LLVMOpInfoSymbol1 from a Python object.

        Derives a LLVMOpInfoSymbol1 from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpInfoSymbol1`` reference, this method
        returns it directly. No new ``LLVMOpInfoSymbol1`` is created in this case.
        """
        return LLVMOpInfoSymbol1.fromPyobj(pyobj)

    @staticmethod
    cdef LLVMOpInfoSymbol1 fromPyobj(object pyobj):
        """Creates a LLVMOpInfoSymbol1 from a Python object.

        Derives a LLVMOpInfoSymbol1 from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpInfoSymbol1`` reference, this method
        returns it directly. No new ``LLVMOpInfoSymbol1`` is created in this case.

        Args:
            pyobj (object): Must be either `None`; a `rocm.llvm._util.types.Pointer`; a simple, contiguous buffer according to the buffer protocol;
                            or of type `LLVMOpInfoSymbol1`; `int`; or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of LLVMOpInfoSymbol1!
        """
        cdef LLVMOpInfoSymbol1 wrapper

        if isinstance(pyobj,LLVMOpInfoSymbol1):
            return pyobj
        else:
            wrapper = LLVMOpInfoSymbol1.__new__(LLVMOpInfoSymbol1)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        # Release the buffer handle
        if self._py_buffer_acquired is True:
            cpython.buffer.PyBuffer_Release(&self._py_buffer)
        # De-allocate if not null and flag is set
        if self._ptr is not NULL and self._is_ptr_owner is True:
            stdlib.free(self._ptr)
            self._ptr = NULL

    @staticmethod
    cdef __allocate(void** ptr):
        ptr[0] = stdlib.malloc(sizeof(cdisassemblertypes.LLVMOpInfoSymbol1))
        string.memset(<void*>ptr[0], 0, sizeof(cdisassemblertypes.LLVMOpInfoSymbol1))

        if ptr[0] is NULL:
            raise MemoryError

    @staticmethod
    cdef LLVMOpInfoSymbol1 new():
        """Factory function to create LLVMOpInfoSymbol1 objects with
        newly allocated cdisassemblertypes.LLVMOpInfoSymbol1"""
        cdef void* ptr
        LLVMOpInfoSymbol1.__allocate(&ptr)
        return LLVMOpInfoSymbol1.fromPtr(ptr, owner=True)

    @staticmethod
    cdef LLVMOpInfoSymbol1 fromValue(cdisassemblertypes.LLVMOpInfoSymbol1 other):
        """Allocate new C type and copy from ``other``.
        """
        wrapper = LLVMOpInfoSymbol1.new()
        string.memcpy(wrapper._ptr, &other, sizeof(cdisassemblertypes.LLVMOpInfoSymbol1))
        return wrapper

    def c_sizeof(self):
        """Returns the size of the underlying C type in bytes.
        Note:
            Implemented as function to not collide with
            autogenerated property names.
        """
        return sizeof(cdisassemblertypes.LLVMOpInfoSymbol1)

    def __int__(self):
        """Returns the data's address as long integer.
        """
        return cpython.long.PyLong_FromVoidPtr(self._ptr)

    def __repr__(self):
        return f"<LLVMOpInfoSymbol1 object, ptr: {int(self)}>"

    def as_c_void_p(self):
        """Returns the data's address as `ctypes.c_void_p`
        Note:
            Implemented as function to not collide with
            autogenerated property names.
        """
        return ctypes.c_void_p(int(self))

    def __init__(self,*args,**kwargs):
        """Constructor type LLVMOpInfoSymbol1.

        Constructor for type LLVMOpInfoSymbol1.

        Args:
            *args:
                Positional arguments. Initialize all or a subset of the member variables
                according to their order of declaration.
            **kwargs:
                Can be used to initialize member variables at construction,
                Just pass an argument expression of the form <member>=<value>
                per member that you want to initialize.
        """
        LLVMOpInfoSymbol1.__allocate(&self._ptr)
        self._is_ptr_owner = True
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
    def get_Present(self, i):
        """Get value ``Present`` of ``(<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i]``.
        """
        return (<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i].Present
    def set_Present(self, i, unsigned long value):
        """Set value ``Present`` of ``(<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i]``.
        """
        (<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i].Present = value
    @property
    def Present(self):
        """(undocumented)"""
        return self.get_Present(0)
    @Present.setter
    def Present(self, unsigned long value):
        self.set_Present(0,value)

    def get_Name(self, i):
        """Get value ``Name`` of ``(<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i]``.
        """
        return (<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i].Name
    def set_Name(self, i, const char * value):
        """Set value ``Name`` of ``(<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i]``.
        """
        (<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i].Name = value
    @property
    def Name(self):
        """(undocumented)"""
        return self.get_Name(0)
    @Name.setter
    def Name(self, const char * value):
        self.set_Name(0,value)

    def get_Value(self, i):
        """Get value ``Value`` of ``(<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i]``.
        """
        return (<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i].Value
    def set_Value(self, i, unsigned long value):
        """Set value ``Value`` of ``(<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i]``.
        """
        (<cdisassemblertypes.LLVMOpInfoSymbol1*>self._ptr)[i].Value = value
    @property
    def Value(self):
        """(undocumented)"""
        return self.get_Value(0)
    @Value.setter
    def Value(self, unsigned long value):
        self.set_Value(0,value)

    @staticmethod
    def PROPERTIES():
        return ["Present","Name","Value"]

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


cdef class LLVMOpInfo1(rocm.llvm._util.types.Pointer):
    """Python wrapper for cdef class cdisassemblertypes.LLVMOpInfo1.

    Python wrapper for cdef class cdisassemblertypes.LLVMOpInfo1.

    If this type is initialized via its `__init__` method, it allocates a
    member of the underlying C type and destroys it again if the wrapper
    type is deallocated.

    This type also serves as adapter when appearing as argument type in a
    function signature. In this case, the type can further be initialized
    from a number of Python objects:

    * `None`:

      This will set the ``self._ptr`` attribute to ``NULL``.

    * `int`:

      Interprets the integer value as pointer address and writes it to ``self._ptr``.
      No ownership is transferred.

    * `ctypes.c_void_p`:

      Takes the pointer address ``pyobj.value`` and writes it to ``self._ptr``.
      No ownership is transferred.

    * `object` that implements the `CUDA Array Interface <https://numba.readthedocs.io/en/stable/cuda/cuda_array_interface.html>`_ protocol:

      Takes the integer-valued pointer address, i.e. the first entry of the `data` tuple
      from `pyobj`'s member ``__cuda_array_interface__``  and writes it to ``self._ptr``.

    * `object` that implements the Python buffer protocol:

      If the object represents a simple contiguous array,
      writes the `Py_buffer` associated with ``pyobj`` to `self._py_buffer`,
      sets the `self._py_buffer_acquired` flag to `True`, and
      writes `self._py_buffer.buf` to the data pointer `self._ptr`.

    * `rocm.llvm._util.types.Pointer`:

      Takes the pointer address ``pyobj._ptr`` and writes it to ``self._ptr``.
      No ownership is transferred.

    Type checks are performed in the above order.

    C Attributes:
        _ptr (C type ``void *``, protected):
            Stores a pointer to the data of the original Python object.
        _is_ptr_owner (C type ``bint``, protected):
            If this wrapper is the owner of the underlying data.
        _py_buffer (C type ``Py_buffer`, protected):
            Stores a pointer to the data of the original Python object.
        _py_buffer_acquired (C type ``bint``, protected):
            Stores a pointer to the data of the original Python object.
    """
    # C members declared in pxd file

    def __cinit__(self):
        self._ptr = NULL
        self._is_ptr_owner = False
        self._py_buffer_acquired = False

    cdef cdisassemblertypes.LLVMOpInfo1* getElementPtr(self):
        return <cdisassemblertypes.LLVMOpInfo1*>self._ptr

    @staticmethod
    cdef LLVMOpInfo1 fromPtr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMOpInfo1`` objects from
        given ``cdisassemblertypes.LLVMOpInfo1`` pointer.

        Setting ``owner`` flag to ``True`` causes
        the extension type to free the structure pointed to by ``ptr``
        when the wrapper object is deallocated.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMOpInfo1 wrapper = LLVMOpInfo1.__new__(LLVMOpInfo1)
        wrapper._ptr = ptr
        wrapper._is_ptr_owner = owner
        return wrapper

    @staticmethod
    def fromObj(pyobj):
        """Creates a LLVMOpInfo1 from a Python object.

        Derives a LLVMOpInfo1 from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpInfo1`` reference, this method
        returns it directly. No new ``LLVMOpInfo1`` is created in this case.
        """
        return LLVMOpInfo1.fromPyobj(pyobj)

    @staticmethod
    cdef LLVMOpInfo1 fromPyobj(object pyobj):
        """Creates a LLVMOpInfo1 from a Python object.

        Derives a LLVMOpInfo1 from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpInfo1`` reference, this method
        returns it directly. No new ``LLVMOpInfo1`` is created in this case.

        Args:
            pyobj (object): Must be either `None`; a `rocm.llvm._util.types.Pointer`; a simple, contiguous buffer according to the buffer protocol;
                            or of type `LLVMOpInfo1`; `int`; or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of LLVMOpInfo1!
        """
        cdef LLVMOpInfo1 wrapper

        if isinstance(pyobj,LLVMOpInfo1):
            return pyobj
        else:
            wrapper = LLVMOpInfo1.__new__(LLVMOpInfo1)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        # Release the buffer handle
        if self._py_buffer_acquired is True:
            cpython.buffer.PyBuffer_Release(&self._py_buffer)
        # De-allocate if not null and flag is set
        if self._ptr is not NULL and self._is_ptr_owner is True:
            stdlib.free(self._ptr)
            self._ptr = NULL

    @staticmethod
    cdef __allocate(void** ptr):
        ptr[0] = stdlib.malloc(sizeof(cdisassemblertypes.LLVMOpInfo1))
        string.memset(<void*>ptr[0], 0, sizeof(cdisassemblertypes.LLVMOpInfo1))

        if ptr[0] is NULL:
            raise MemoryError

    @staticmethod
    cdef LLVMOpInfo1 new():
        """Factory function to create LLVMOpInfo1 objects with
        newly allocated cdisassemblertypes.LLVMOpInfo1"""
        cdef void* ptr
        LLVMOpInfo1.__allocate(&ptr)
        return LLVMOpInfo1.fromPtr(ptr, owner=True)

    @staticmethod
    cdef LLVMOpInfo1 fromValue(cdisassemblertypes.LLVMOpInfo1 other):
        """Allocate new C type and copy from ``other``.
        """
        wrapper = LLVMOpInfo1.new()
        string.memcpy(wrapper._ptr, &other, sizeof(cdisassemblertypes.LLVMOpInfo1))
        return wrapper

    def c_sizeof(self):
        """Returns the size of the underlying C type in bytes.
        Note:
            Implemented as function to not collide with
            autogenerated property names.
        """
        return sizeof(cdisassemblertypes.LLVMOpInfo1)

    def __int__(self):
        """Returns the data's address as long integer.
        """
        return cpython.long.PyLong_FromVoidPtr(self._ptr)

    def __repr__(self):
        return f"<LLVMOpInfo1 object, ptr: {int(self)}>"

    def as_c_void_p(self):
        """Returns the data's address as `ctypes.c_void_p`
        Note:
            Implemented as function to not collide with
            autogenerated property names.
        """
        return ctypes.c_void_p(int(self))

    def __init__(self,*args,**kwargs):
        """Constructor type LLVMOpInfo1.

        Constructor for type LLVMOpInfo1.

        Args:
            *args:
                Positional arguments. Initialize all or a subset of the member variables
                according to their order of declaration.
            **kwargs:
                Can be used to initialize member variables at construction,
                Just pass an argument expression of the form <member>=<value>
                per member that you want to initialize.
        """
        LLVMOpInfo1.__allocate(&self._ptr)
        self._is_ptr_owner = True
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
    def get_AddSymbol(self, i):
        """Get value of ``AddSymbol`` of ``(<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i]``.
        """
        return LLVMOpInfoSymbol1.fromPtr(&(<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i].AddSymbol)
    @property
    def AddSymbol(self):
        """(undocumented)"""
        return self.get_AddSymbol(0)

    def get_SubtractSymbol(self, i):
        """Get value of ``SubtractSymbol`` of ``(<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i]``.
        """
        return LLVMOpInfoSymbol1.fromPtr(&(<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i].SubtractSymbol)
    @property
    def SubtractSymbol(self):
        """(undocumented)"""
        return self.get_SubtractSymbol(0)

    def get_Value(self, i):
        """Get value ``Value`` of ``(<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i]``.
        """
        return (<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i].Value
    def set_Value(self, i, unsigned long value):
        """Set value ``Value`` of ``(<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i]``.
        """
        (<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i].Value = value
    @property
    def Value(self):
        """(undocumented)"""
        return self.get_Value(0)
    @Value.setter
    def Value(self, unsigned long value):
        self.set_Value(0,value)

    def get_VariantKind(self, i):
        """Get value ``VariantKind`` of ``(<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i]``.
        """
        return (<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i].VariantKind
    def set_VariantKind(self, i, unsigned long value):
        """Set value ``VariantKind`` of ``(<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i]``.
        """
        (<cdisassemblertypes.LLVMOpInfo1*>self._ptr)[i].VariantKind = value
    @property
    def VariantKind(self):
        """(undocumented)"""
        return self.get_VariantKind(0)
    @VariantKind.setter
    def VariantKind(self, unsigned long value):
        self.set_VariantKind(0,value)

    @staticmethod
    def PROPERTIES():
        return ["AddSymbol","SubtractSymbol","Value","VariantKind"]

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


cdef class LLVMSymbolLookupCallback(rocm.llvm._util.types.Pointer):
    """Python wrapper for cdef class cdisassemblertypes.LLVMSymbolLookupCallback.

    Python wrapper for cdef class cdisassemblertypes.LLVMSymbolLookupCallback.

    If this type is initialized via its `__init__` method, it allocates a
    member of the underlying C type and destroys it again if the wrapper
    type is deallocated.

    This type also serves as adapter when appearing as argument type in a
    function signature. In this case, the type can further be initialized
    from a number of Python objects:

    * `None`:

      This will set the ``self._ptr`` attribute to ``NULL``.

    * `int`:

      Interprets the integer value as pointer address and writes it to ``self._ptr``.
      No ownership is transferred.

    * `ctypes.c_void_p`:

      Takes the pointer address ``pyobj.value`` and writes it to ``self._ptr``.
      No ownership is transferred.

    * `object` that implements the `CUDA Array Interface <https://numba.readthedocs.io/en/stable/cuda/cuda_array_interface.html>`_ protocol:

      Takes the integer-valued pointer address, i.e. the first entry of the `data` tuple
      from `pyobj`'s member ``__cuda_array_interface__``  and writes it to ``self._ptr``.

    * `object` that implements the Python buffer protocol:

      If the object represents a simple contiguous array,
      writes the `Py_buffer` associated with ``pyobj`` to `self._py_buffer`,
      sets the `self._py_buffer_acquired` flag to `True`, and
      writes `self._py_buffer.buf` to the data pointer `self._ptr`.

    * `rocm.llvm._util.types.Pointer`:

      Takes the pointer address ``pyobj._ptr`` and writes it to ``self._ptr``.
      No ownership is transferred.

    Type checks are performed in the above order.

    C Attributes:
        _ptr (C type ``void *``, protected):
            Stores a pointer to the data of the original Python object.
        _is_ptr_owner (C type ``bint``, protected):
            If this wrapper is the owner of the underlying data.
        _py_buffer (C type ``Py_buffer`, protected):
            Stores a pointer to the data of the original Python object.
        _py_buffer_acquired (C type ``bint``, protected):
            Stores a pointer to the data of the original Python object.
    """
    # C members declared in pxd file

    def __cinit__(self):
        self._ptr = NULL
        self._is_ptr_owner = False
        self._py_buffer_acquired = False

    cdef cdisassemblertypes.LLVMSymbolLookupCallback getElementPtr(self):
        return <cdisassemblertypes.LLVMSymbolLookupCallback>self._ptr

    @staticmethod
    cdef LLVMSymbolLookupCallback fromPtr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMSymbolLookupCallback`` objects from
        given ``cdisassemblertypes.LLVMSymbolLookupCallback`` pointer.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMSymbolLookupCallback wrapper = LLVMSymbolLookupCallback.__new__(LLVMSymbolLookupCallback)
        wrapper._ptr = ptr
        wrapper._is_ptr_owner = owner
        return wrapper

    @staticmethod
    def fromObj(pyobj):
        """Creates a LLVMSymbolLookupCallback from a Python object.

        Derives a LLVMSymbolLookupCallback from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMSymbolLookupCallback`` reference, this method
        returns it directly. No new ``LLVMSymbolLookupCallback`` is created in this case.
        """
        return LLVMSymbolLookupCallback.fromPyobj(pyobj)

    @staticmethod
    cdef LLVMSymbolLookupCallback fromPyobj(object pyobj):
        """Creates a LLVMSymbolLookupCallback from a Python object.

        Derives a LLVMSymbolLookupCallback from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMSymbolLookupCallback`` reference, this method
        returns it directly. No new ``LLVMSymbolLookupCallback`` is created in this case.

        Args:
            pyobj (object): Must be either `None`; a `rocm.llvm._util.types.Pointer`; a simple, contiguous buffer according to the buffer protocol;
                            or of type `LLVMSymbolLookupCallback`; `int`; or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of LLVMSymbolLookupCallback!
        """
        cdef LLVMSymbolLookupCallback wrapper

        if isinstance(pyobj,LLVMSymbolLookupCallback):
            return pyobj
        else:
            wrapper = LLVMSymbolLookupCallback.__new__(LLVMSymbolLookupCallback)
            wrapper.init_from_pyobj(pyobj)
            return wrapper

    def __dealloc__(self):
        # Release the buffer handle
        if self._py_buffer_acquired is True:
            cpython.buffer.PyBuffer_Release(&self._py_buffer)

    def __int__(self):
        """Returns the data's address as long integer.
        """
        return cpython.long.PyLong_FromVoidPtr(self._ptr)

    def __repr__(self):
        return f"<LLVMSymbolLookupCallback object, ptr: {int(self)}>"

    def as_c_void_p(self):
        """Returns the data's address as `ctypes.c_void_p`
        Note:
            Implemented as function to not collide with
            autogenerated property names.
        """
        return ctypes.c_void_p(int(self))

__all__ = [
    "LLVMOpInfoCallback",
    "LLVMOpInfoSymbol1",
    "LLVMOpInfo1",
    "LLVMSymbolLookupCallback",
]