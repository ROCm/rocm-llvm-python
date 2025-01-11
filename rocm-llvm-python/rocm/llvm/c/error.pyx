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

Attributes:
    LLVMErrorRef:
        alias of `~.LLVMOpaqueError`

"""

import cython
import ctypes
import enum
cdef class LLVMOpaqueError(rocm.llvm._util.types.Pointer):
    """Python wrapper for cdef class cerror.LLVMOpaqueError.

    Python wrapper for cdef class cerror.LLVMOpaqueError.

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

    cdef cerror.LLVMOpaqueError* getElementPtr(self):
        return <cerror.LLVMOpaqueError*>self._ptr

    @staticmethod
    cdef LLVMOpaqueError fromPtr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMOpaqueError`` objects from
        given ``cerror.LLVMOpaqueError`` pointer.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMOpaqueError wrapper = LLVMOpaqueError.__new__(LLVMOpaqueError)
        wrapper._ptr = ptr
        wrapper._is_ptr_owner = owner
        return wrapper

    @staticmethod
    def fromObj(pyobj):
        """Creates a LLVMOpaqueError from a Python object.

        Derives a LLVMOpaqueError from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpaqueError`` reference, this method
        returns it directly. No new ``LLVMOpaqueError`` is created in this case.
        """
        return LLVMOpaqueError.fromPyobj(pyobj)

    @staticmethod
    cdef LLVMOpaqueError fromPyobj(object pyobj):
        """Creates a LLVMOpaqueError from a Python object.

        Derives a LLVMOpaqueError from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpaqueError`` reference, this method
        returns it directly. No new ``LLVMOpaqueError`` is created in this case.

        Args:
            pyobj (object): Must be either `None`; a `rocm.llvm._util.types.Pointer`; a simple, contiguous buffer according to the buffer protocol;
                            or of type `LLVMOpaqueError`; `int`; or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of LLVMOpaqueError!
        """
        cdef LLVMOpaqueError wrapper

        if isinstance(pyobj,LLVMOpaqueError):
            return pyobj
        else:
            wrapper = LLVMOpaqueError.__new__(LLVMOpaqueError)
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
        return f"<LLVMOpaqueError object, ptr: {int(self)}>"

    def as_c_void_p(self):
        """Returns the data's address as `ctypes.c_void_p`
        Note:
            Implemented as function to not collide with
            autogenerated property names.
        """
        return ctypes.c_void_p(int(self))

    @staticmethod
    def PROPERTIES():
        return []

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


LLVMErrorRef = LLVMOpaqueError

@cython.embedsignature(True)
def LLVMGetErrorTypeId(object Err):
    r"""(No short description, might be part of a group.)

    Returns the type id for the given error instance, which must be a failure
    value (i.e. non-null).

    Args:
        Err (`~.LLVMOpaqueError`/`~.object`):
            (undocumented)
    """
    _LLVMGetErrorTypeId__retval = rocm.llvm._util.types.Pointer.fromPtr(<void*>cerror.LLVMGetErrorTypeId(
        LLVMOpaqueError.fromPyobj(Err).getElementPtr()))
    return None if _LLVMGetErrorTypeId__retval._ptr == NULL else _LLVMGetErrorTypeId__retval


@cython.embedsignature(True)
def LLVMConsumeError(object Err):
    r"""(No short description, might be part of a group.)

    Dispose of the given error without handling it. This operation consumes the
    error, and the given LLVMErrorRef value is not usable once this call returns.
    Note: This method *only* needs to be called if the error is not being passed
    to some other consuming operation, e.g. LLVMGetErrorMessage.

    Args:
        Err (`~.LLVMOpaqueError`/`~.object`):
            (undocumented)
    """
    cerror.LLVMConsumeError(
        LLVMOpaqueError.fromPyobj(Err).getElementPtr())


@cython.embedsignature(True)
def LLVMGetErrorMessage(object Err):
    r"""(No short description, might be part of a group.)

    Returns the given string's error message. This operation consumes the error,
    and the given LLVMErrorRef value is not usable once this call returns.
    The caller is responsible for disposing of the string by calling
    LLVMDisposeErrorMessage.

    Args:
        Err (`~.LLVMOpaqueError`/`~.object`):
            (undocumented)
    """
    _LLVMGetErrorMessage__retval = rocm.llvm._util.types.CStr.fromPtr(<void*>cerror.LLVMGetErrorMessage(
        LLVMOpaqueError.fromPyobj(Err).getElementPtr()))
    return None if _LLVMGetErrorMessage__retval._ptr == NULL else _LLVMGetErrorMessage__retval


@cython.embedsignature(True)
def LLVMDisposeErrorMessage(object ErrMsg):
    r"""(No short description, might be part of a group.)

    Dispose of the given error message.

    Args:
        ErrMsg (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)
    """
    cerror.LLVMDisposeErrorMessage(
        <char *>rocm.llvm._util.types.CStr.fromPyobj(ErrMsg)._ptr)


@cython.embedsignature(True)
def LLVMGetStringErrorTypeId():
    r"""(No short description, might be part of a group.)

    Returns the type id for llvm StringError.
    """
    _LLVMGetStringErrorTypeId__retval = rocm.llvm._util.types.Pointer.fromPtr(<void*>cerror.LLVMGetStringErrorTypeId())
    return None if _LLVMGetStringErrorTypeId__retval._ptr == NULL else _LLVMGetStringErrorTypeId__retval


@cython.embedsignature(True)
def LLVMCreateStringError(object ErrMsg):
    r"""(No short description, might be part of a group.)

    Create a StringError.

    Args:
        ErrMsg (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)
    """
    _LLVMCreateStringError__retval = LLVMOpaqueError.fromPtr(cerror.LLVMCreateStringError(
        <const char *>rocm.llvm._util.types.CStr.fromPyobj(ErrMsg)._ptr))
    return None if _LLVMCreateStringError__retval._ptr == NULL else _LLVMCreateStringError__retval

__all__ = [
    "LLVMOpaqueError",
    "LLVMErrorRef",
    "LLVMGetErrorTypeId",
    "LLVMConsumeError",
    "LLVMGetErrorMessage",
    "LLVMDisposeErrorMessage",
    "LLVMGetStringErrorTypeId",
    "LLVMCreateStringError",
]