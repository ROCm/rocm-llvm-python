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


"""
(No short description)

Attributes:
    LLVMTargetDataRef:
        alias of `~.LLVMOpaqueTargetData`

    LLVMTargetLibraryInfoRef:
        alias of `~.LLVMOpaqueTargetLibraryInfotData`

"""

import cython
import ctypes
import enum

from rocm.llvm.c.types import LLVMMemoryBufferRef
from rocm.llvm.c.types import LLVMContextRef
from rocm.llvm.c.types import LLVMModuleRef
from rocm.llvm.c.types import LLVMTypeRef
from rocm.llvm.c.types import LLVMValueRef
from rocm.llvm.c.types import LLVMBasicBlockRef
from rocm.llvm.c.types import LLVMMetadataRef
from rocm.llvm.c.types import LLVMNamedMDNodeRef
from rocm.llvm.c.types import LLVMValueMetadataEntry
from rocm.llvm.c.types import LLVMBuilderRef
from rocm.llvm.c.types import LLVMDIBuilderRef
from rocm.llvm.c.types import LLVMModuleProviderRef
from rocm.llvm.c.types import LLVMPassManagerRef
from rocm.llvm.c.types import LLVMUseRef
from rocm.llvm.c.types import LLVMAttributeRef
from rocm.llvm.c.types import LLVMDiagnosticInfoRef
from rocm.llvm.c.types import LLVMComdatRef
from rocm.llvm.c.types import LLVMModuleFlagEntry
from rocm.llvm.c.types import LLVMJITEventListenerRef
from rocm.llvm.c.types import LLVMBinaryRef


from rocm.llvm.config.llvm_config import LLVM_DEFAULT_TARGET_TRIPLE
from rocm.llvm.config.llvm_config import LLVM_ENABLE_THREADS
from rocm.llvm.config.llvm_config import LLVM_HAS_ATOMICS
from rocm.llvm.config.llvm_config import LLVM_HOST_TRIPLE
from rocm.llvm.config.llvm_config import LLVM_ON_UNIX
from rocm.llvm.config.llvm_config import LLVM_USE_INTEL_JITEVENTS
from rocm.llvm.config.llvm_config import LLVM_USE_OPROFILE
from rocm.llvm.config.llvm_config import LLVM_USE_PERF
from rocm.llvm.config.llvm_config import LLVM_VERSION_MAJOR
from rocm.llvm.config.llvm_config import LLVM_VERSION_MINOR
from rocm.llvm.config.llvm_config import LLVM_VERSION_PATCH
from rocm.llvm.config.llvm_config import LLVM_VERSION_STRING
from rocm.llvm.config.llvm_config import LLVM_FORCE_ENABLE_STATS
from rocm.llvm.config.llvm_config import LLVM_ENABLE_ZLIB
from rocm.llvm.config.llvm_config import LLVM_ENABLE_ZSTD
from rocm.llvm.config.llvm_config import HAVE_SYSEXITS_H
from rocm.llvm.config.llvm_config import LLVM_UNREACHABLE_OPTIMIZE
from rocm.llvm.config.llvm_config import LLVM_ENABLE_DIA_SDK
from rocm.llvm.config.llvm_config import LLVM_ENABLE_PLUGINS

class _LLVMByteOrdering__Base(enum.IntEnum):
    """Empty enum base class that allows subclassing.
    """
    pass
class LLVMByteOrdering(_LLVMByteOrdering__Base):
    """@{

    Attributes:
        LLVMBigEndian:
            (undocumented)
        LLVMLittleEndian:
            (undocumented)
    """
    LLVMBigEndian = ctarget.LLVMBigEndian
    LLVMLittleEndian = ctarget.LLVMLittleEndian
    @staticmethod
    def ctypes_type():
        """The type of the enum constants as ctypes type."""
        return ctypes.c_uint


cdef class LLVMOpaqueTargetData(rocm.llvm._util.types.Pointer):
    """Python wrapper for cdef class ctarget.LLVMOpaqueTargetData.

    Python wrapper for cdef class ctarget.LLVMOpaqueTargetData.

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

    cdef ctarget.LLVMOpaqueTargetData* getElementPtr(self):
        return <ctarget.LLVMOpaqueTargetData*>self._ptr

    @staticmethod
    cdef LLVMOpaqueTargetData fromPtr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMOpaqueTargetData`` objects from
        given ``ctarget.LLVMOpaqueTargetData`` pointer.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMOpaqueTargetData wrapper = LLVMOpaqueTargetData.__new__(LLVMOpaqueTargetData)
        wrapper._ptr = ptr
        wrapper._is_ptr_owner = owner
        return wrapper

    @staticmethod
    def fromObj(pyobj):
        """Creates a LLVMOpaqueTargetData from a Python object.

        Derives a LLVMOpaqueTargetData from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpaqueTargetData`` reference, this method
        returns it directly. No new ``LLVMOpaqueTargetData`` is created in this case.
        """
        return LLVMOpaqueTargetData.fromPyobj(pyobj)

    @staticmethod
    cdef LLVMOpaqueTargetData fromPyobj(object pyobj):
        """Creates a LLVMOpaqueTargetData from a Python object.

        Derives a LLVMOpaqueTargetData from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpaqueTargetData`` reference, this method
        returns it directly. No new ``LLVMOpaqueTargetData`` is created in this case.

        Args:
            pyobj (object): Must be either `None`; a `rocm.llvm._util.types.Pointer`; a simple, contiguous buffer according to the buffer protocol;
                            or of type `LLVMOpaqueTargetData`; `int`; or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of LLVMOpaqueTargetData!
        """
        cdef LLVMOpaqueTargetData wrapper

        if isinstance(pyobj,LLVMOpaqueTargetData):
            return pyobj
        else:
            wrapper = LLVMOpaqueTargetData.__new__(LLVMOpaqueTargetData)
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
        return f"<LLVMOpaqueTargetData object, ptr: {int(self)}>"

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


LLVMTargetDataRef = LLVMOpaqueTargetData

cdef class LLVMOpaqueTargetLibraryInfotData(rocm.llvm._util.types.Pointer):
    """Python wrapper for cdef class ctarget.LLVMOpaqueTargetLibraryInfotData.

    Python wrapper for cdef class ctarget.LLVMOpaqueTargetLibraryInfotData.

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

    cdef ctarget.LLVMOpaqueTargetLibraryInfotData* getElementPtr(self):
        return <ctarget.LLVMOpaqueTargetLibraryInfotData*>self._ptr

    @staticmethod
    cdef LLVMOpaqueTargetLibraryInfotData fromPtr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMOpaqueTargetLibraryInfotData`` objects from
        given ``ctarget.LLVMOpaqueTargetLibraryInfotData`` pointer.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMOpaqueTargetLibraryInfotData wrapper = LLVMOpaqueTargetLibraryInfotData.__new__(LLVMOpaqueTargetLibraryInfotData)
        wrapper._ptr = ptr
        wrapper._is_ptr_owner = owner
        return wrapper

    @staticmethod
    def fromObj(pyobj):
        """Creates a LLVMOpaqueTargetLibraryInfotData from a Python object.

        Derives a LLVMOpaqueTargetLibraryInfotData from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpaqueTargetLibraryInfotData`` reference, this method
        returns it directly. No new ``LLVMOpaqueTargetLibraryInfotData`` is created in this case.
        """
        return LLVMOpaqueTargetLibraryInfotData.fromPyobj(pyobj)

    @staticmethod
    cdef LLVMOpaqueTargetLibraryInfotData fromPyobj(object pyobj):
        """Creates a LLVMOpaqueTargetLibraryInfotData from a Python object.

        Derives a LLVMOpaqueTargetLibraryInfotData from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpaqueTargetLibraryInfotData`` reference, this method
        returns it directly. No new ``LLVMOpaqueTargetLibraryInfotData`` is created in this case.

        Args:
            pyobj (object): Must be either `None`; a `rocm.llvm._util.types.Pointer`; a simple, contiguous buffer according to the buffer protocol;
                            or of type `LLVMOpaqueTargetLibraryInfotData`; `int`; or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of LLVMOpaqueTargetLibraryInfotData!
        """
        cdef LLVMOpaqueTargetLibraryInfotData wrapper

        if isinstance(pyobj,LLVMOpaqueTargetLibraryInfotData):
            return pyobj
        else:
            wrapper = LLVMOpaqueTargetLibraryInfotData.__new__(LLVMOpaqueTargetLibraryInfotData)
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
        return f"<LLVMOpaqueTargetLibraryInfotData object, ptr: {int(self)}>"

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


LLVMTargetLibraryInfoRef = LLVMOpaqueTargetLibraryInfotData

@cython.embedsignature(True)
def LLVMInitializeAllTargetInfos():
    r"""(No short description, might be part of a group.)

    LLVMInitializeAllTargetInfos - The main program should call this function if
    it wants access to all available targets that LLVM is configured to
    support.
    """
    ctarget.LLVMInitializeAllTargetInfos()


@cython.embedsignature(True)
def LLVMInitializeAllTargets():
    r"""(No short description, might be part of a group.)

    LLVMInitializeAllTargets - The main program should call this function if it
    wants to link in all available targets that LLVM is configured to
    support.
    """
    ctarget.LLVMInitializeAllTargets()


@cython.embedsignature(True)
def LLVMInitializeAllTargetMCs():
    r"""(No short description, might be part of a group.)

    LLVMInitializeAllTargetMCs - The main program should call this function if
    it wants access to all available target MC that LLVM is configured to
    support.
    """
    ctarget.LLVMInitializeAllTargetMCs()


@cython.embedsignature(True)
def LLVMInitializeAllAsmPrinters():
    r"""(No short description, might be part of a group.)

    LLVMInitializeAllAsmPrinters - The main program should call this function if
    it wants all asm printers that LLVM is configured to support, to make them
    available via the TargetRegistry.
    """
    ctarget.LLVMInitializeAllAsmPrinters()


@cython.embedsignature(True)
def LLVMInitializeAllAsmParsers():
    r"""(No short description, might be part of a group.)

    LLVMInitializeAllAsmParsers - The main program should call this function if
    it wants all asm parsers that LLVM is configured to support, to make them
    available via the TargetRegistry.
    """
    ctarget.LLVMInitializeAllAsmParsers()


@cython.embedsignature(True)
def LLVMInitializeAllDisassemblers():
    r"""(No short description, might be part of a group.)

    LLVMInitializeAllDisassemblers - The main program should call this function
    if it wants all disassemblers that LLVM is configured to support, to make
    them available via the TargetRegistry.
    """
    ctarget.LLVMInitializeAllDisassemblers()


@cython.embedsignature(True)
def LLVMInitializeNativeTarget():
    r"""(No short description, might be part of a group.)

    LLVMInitializeNativeTarget - The main program should call this function to
    initialize the native target corresponding to the host.  This is useful
    for JIT applications to ensure that the target gets linked in correctly.
    """
    cdef int _LLVMInitializeNativeTarget__retval = ctarget.LLVMInitializeNativeTarget()
    return _LLVMInitializeNativeTarget__retval


@cython.embedsignature(True)
def LLVMInitializeNativeAsmParser():
    r"""(No short description, might be part of a group.)

    LLVMInitializeNativeTargetAsmParser - The main program should call this
    function to initialize the parser for the native target corresponding to the
    host.
    """
    cdef int _LLVMInitializeNativeAsmParser__retval = ctarget.LLVMInitializeNativeAsmParser()
    return _LLVMInitializeNativeAsmParser__retval


@cython.embedsignature(True)
def LLVMInitializeNativeAsmPrinter():
    r"""(No short description, might be part of a group.)

    LLVMInitializeNativeTargetAsmPrinter - The main program should call this
    function to initialize the printer for the native target corresponding to
    the host.
    """
    cdef int _LLVMInitializeNativeAsmPrinter__retval = ctarget.LLVMInitializeNativeAsmPrinter()
    return _LLVMInitializeNativeAsmPrinter__retval


@cython.embedsignature(True)
def LLVMInitializeNativeDisassembler():
    r"""(No short description, might be part of a group.)

    LLVMInitializeNativeTargetDisassembler - The main program should call this
    function to initialize the disassembler for the native target corresponding
    to the host.
    """
    cdef int _LLVMInitializeNativeDisassembler__retval = ctarget.LLVMInitializeNativeDisassembler()
    return _LLVMInitializeNativeDisassembler__retval


@cython.embedsignature(True)
def LLVMGetModuleDataLayout(object M):
    r"""(No short description, might be part of a group.)

    Obtain the data layout for a module.

    See:
        `~.Module``~.`~.getDataLayout``()

    Args:
        M (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)
    """
    _LLVMGetModuleDataLayout__retval = LLVMOpaqueTargetData.fromPtr(ctarget.LLVMGetModuleDataLayout(
        LLVMOpaqueModule.fromPyobj(M).getElementPtr()))
    return None if _LLVMGetModuleDataLayout__retval._ptr == NULL else _LLVMGetModuleDataLayout__retval


@cython.embedsignature(True)
def LLVMSetModuleDataLayout(object M, object DL):
    r"""(No short description, might be part of a group.)

    Set the data layout for a module.

    See:
        `~.Module``~.`~.setDataLayout``()

    Args:
        M (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)

        DL (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)
    """
    ctarget.LLVMSetModuleDataLayout(
        LLVMOpaqueModule.fromPyobj(M).getElementPtr(),
        LLVMOpaqueTargetData.fromPyobj(DL).getElementPtr())


@cython.embedsignature(True)
def LLVMCreateTargetData(object StringRep):
    r"""(No short description, might be part of a group.)

    Creates target data from a target layout string.
    See the constructor llvm`~.DataLayout.DataLayout`.

    Args:
        StringRep (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)
    """
    _LLVMCreateTargetData__retval = LLVMOpaqueTargetData.fromPtr(ctarget.LLVMCreateTargetData(
        <const char *>rocm.llvm._util.types.CStr.fromPyobj(StringRep)._ptr))
    return None if _LLVMCreateTargetData__retval._ptr == NULL else _LLVMCreateTargetData__retval


@cython.embedsignature(True)
def LLVMDisposeTargetData(object TD):
    r"""(No short description, might be part of a group.)

    Deallocates a TargetData.
    See the destructor llvm`~.DataLayout.`~DataLayout.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)
    """
    ctarget.LLVMDisposeTargetData(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr())


@cython.embedsignature(True)
def LLVMAddTargetLibraryInfo(object TLI, object PM):
    r"""(No short description, might be part of a group.)

    Adds target library information to a pass manager. This does not take
    ownership of the target library info.
    See the method llvm`~.PassManagerBase.add`.

    Args:
        TLI (`~.LLVMOpaqueTargetLibraryInfotData`/`~.object`):
            (undocumented)

        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    ctarget.LLVMAddTargetLibraryInfo(
        LLVMOpaqueTargetLibraryInfotData.fromPyobj(TLI).getElementPtr(),
        LLVMOpaquePassManager.fromPyobj(PM).getElementPtr())


@cython.embedsignature(True)
def LLVMCopyStringRepOfTargetData(object TD):
    r"""(No short description, might be part of a group.)

    Converts target data to a target layout string. The string must be disposed
    with LLVMDisposeMessage.
    See the constructor llvm`~.DataLayout.DataLayout`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)
    """
    _LLVMCopyStringRepOfTargetData__retval = rocm.llvm._util.types.CStr.fromPtr(<void*>ctarget.LLVMCopyStringRepOfTargetData(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr()))
    return None if _LLVMCopyStringRepOfTargetData__retval._ptr == NULL else _LLVMCopyStringRepOfTargetData__retval


@cython.embedsignature(True)
def LLVMByteOrder(object TD):
    r"""(No short description, might be part of a group.)

    Returns the byte order of a target, either LLVMBigEndian or
    LLVMLittleEndian.
    See the method llvm`~.DataLayout.isLittleEndian`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)
    """
    _LLVMByteOrder__retval = LLVMByteOrdering(ctarget.LLVMByteOrder(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr()))
    return _LLVMByteOrder__retval


@cython.embedsignature(True)
def LLVMPointerSize(object TD):
    r"""(No short description, might be part of a group.)

    Returns the pointer size in bytes for a target.
    See the method llvm`~.DataLayout.getPointerSize`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)
    """
    cdef unsigned int _LLVMPointerSize__retval = ctarget.LLVMPointerSize(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr())
    return _LLVMPointerSize__retval


@cython.embedsignature(True)
def LLVMPointerSizeForAS(object TD, unsigned int AS):
    r"""(No short description, might be part of a group.)

    Returns the pointer size in bytes for a target for a specified
    address space.
    See the method llvm`~.DataLayout.getPointerSize`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        AS (`~.int`):
            (undocumented)
    """
    cdef unsigned int _LLVMPointerSizeForAS__retval = ctarget.LLVMPointerSizeForAS(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),AS)
    return _LLVMPointerSizeForAS__retval


@cython.embedsignature(True)
def LLVMIntPtrType(object TD):
    r"""(No short description, might be part of a group.)

    Returns the integer type that is the same size as a pointer on a target.
    See the method llvm`~.DataLayout.getIntPtrType`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)
    """
    _LLVMIntPtrType__retval = LLVMOpaqueType.fromPtr(ctarget.LLVMIntPtrType(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr()))
    return None if _LLVMIntPtrType__retval._ptr == NULL else _LLVMIntPtrType__retval


@cython.embedsignature(True)
def LLVMIntPtrTypeForAS(object TD, unsigned int AS):
    r"""(No short description, might be part of a group.)

    Returns the integer type that is the same size as a pointer on a target.
    This version allows the address space to be specified.
    See the method llvm`~.DataLayout.getIntPtrType`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        AS (`~.int`):
            (undocumented)
    """
    _LLVMIntPtrTypeForAS__retval = LLVMOpaqueType.fromPtr(ctarget.LLVMIntPtrTypeForAS(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),AS))
    return None if _LLVMIntPtrTypeForAS__retval._ptr == NULL else _LLVMIntPtrTypeForAS__retval


@cython.embedsignature(True)
def LLVMIntPtrTypeInContext(object C, object TD):
    r"""(No short description, might be part of a group.)

    Returns the integer type that is the same size as a pointer on a target.
    See the method llvm`~.DataLayout.getIntPtrType`.

    Args:
        C (`~.LLVMOpaqueContext`/`~.object`):
            (undocumented)

        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)
    """
    _LLVMIntPtrTypeInContext__retval = LLVMOpaqueType.fromPtr(ctarget.LLVMIntPtrTypeInContext(
        LLVMOpaqueContext.fromPyobj(C).getElementPtr(),
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr()))
    return None if _LLVMIntPtrTypeInContext__retval._ptr == NULL else _LLVMIntPtrTypeInContext__retval


@cython.embedsignature(True)
def LLVMIntPtrTypeForASInContext(object C, object TD, unsigned int AS):
    r"""(No short description, might be part of a group.)

    Returns the integer type that is the same size as a pointer on a target.
    This version allows the address space to be specified.
    See the method llvm`~.DataLayout.getIntPtrType`.

    Args:
        C (`~.LLVMOpaqueContext`/`~.object`):
            (undocumented)

        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        AS (`~.int`):
            (undocumented)
    """
    _LLVMIntPtrTypeForASInContext__retval = LLVMOpaqueType.fromPtr(ctarget.LLVMIntPtrTypeForASInContext(
        LLVMOpaqueContext.fromPyobj(C).getElementPtr(),
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),AS))
    return None if _LLVMIntPtrTypeForASInContext__retval._ptr == NULL else _LLVMIntPtrTypeForASInContext__retval


@cython.embedsignature(True)
def LLVMSizeOfTypeInBits(object TD, object Ty):
    r"""(No short description, might be part of a group.)

    Computes the size of a type in bytes for a target.
    See the method llvm`~.DataLayout.getTypeSizeInBits`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        Ty (`~.LLVMOpaqueType`/`~.object`):
            (undocumented)
    """
    cdef unsigned long long _LLVMSizeOfTypeInBits__retval = ctarget.LLVMSizeOfTypeInBits(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueType.fromPyobj(Ty).getElementPtr())
    return _LLVMSizeOfTypeInBits__retval


@cython.embedsignature(True)
def LLVMStoreSizeOfType(object TD, object Ty):
    r"""(No short description, might be part of a group.)

    Computes the storage size of a type in bytes for a target.
    See the method llvm`~.DataLayout.getTypeStoreSize`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        Ty (`~.LLVMOpaqueType`/`~.object`):
            (undocumented)
    """
    cdef unsigned long long _LLVMStoreSizeOfType__retval = ctarget.LLVMStoreSizeOfType(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueType.fromPyobj(Ty).getElementPtr())
    return _LLVMStoreSizeOfType__retval


@cython.embedsignature(True)
def LLVMABISizeOfType(object TD, object Ty):
    r"""(No short description, might be part of a group.)

    Computes the ABI size of a type in bytes for a target.
    See the method llvm`~.DataLayout.getTypeAllocSize`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        Ty (`~.LLVMOpaqueType`/`~.object`):
            (undocumented)
    """
    cdef unsigned long long _LLVMABISizeOfType__retval = ctarget.LLVMABISizeOfType(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueType.fromPyobj(Ty).getElementPtr())
    return _LLVMABISizeOfType__retval


@cython.embedsignature(True)
def LLVMABIAlignmentOfType(object TD, object Ty):
    r"""(No short description, might be part of a group.)

    Computes the ABI alignment of a type in bytes for a target.
    See the method llvm`~.DataLayout.getTypeABISize`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        Ty (`~.LLVMOpaqueType`/`~.object`):
            (undocumented)
    """
    cdef unsigned int _LLVMABIAlignmentOfType__retval = ctarget.LLVMABIAlignmentOfType(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueType.fromPyobj(Ty).getElementPtr())
    return _LLVMABIAlignmentOfType__retval


@cython.embedsignature(True)
def LLVMCallFrameAlignmentOfType(object TD, object Ty):
    r"""(No short description, might be part of a group.)

    Computes the call frame alignment of a type in bytes for a target.
    See the method llvm`~.DataLayout.getTypeABISize`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        Ty (`~.LLVMOpaqueType`/`~.object`):
            (undocumented)
    """
    cdef unsigned int _LLVMCallFrameAlignmentOfType__retval = ctarget.LLVMCallFrameAlignmentOfType(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueType.fromPyobj(Ty).getElementPtr())
    return _LLVMCallFrameAlignmentOfType__retval


@cython.embedsignature(True)
def LLVMPreferredAlignmentOfType(object TD, object Ty):
    r"""(No short description, might be part of a group.)

    Computes the preferred alignment of a type in bytes for a target.
    See the method llvm`~.DataLayout.getTypeABISize`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        Ty (`~.LLVMOpaqueType`/`~.object`):
            (undocumented)
    """
    cdef unsigned int _LLVMPreferredAlignmentOfType__retval = ctarget.LLVMPreferredAlignmentOfType(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueType.fromPyobj(Ty).getElementPtr())
    return _LLVMPreferredAlignmentOfType__retval


@cython.embedsignature(True)
def LLVMPreferredAlignmentOfGlobal(object TD, object GlobalVar):
    r"""(No short description, might be part of a group.)

    Computes the preferred alignment of a global variable in bytes for a target.
    See the method llvm`~.DataLayout.getPreferredAlignment`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        GlobalVar (`~.LLVMOpaqueValue`/`~.object`):
            (undocumented)
    """
    cdef unsigned int _LLVMPreferredAlignmentOfGlobal__retval = ctarget.LLVMPreferredAlignmentOfGlobal(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueValue.fromPyobj(GlobalVar).getElementPtr())
    return _LLVMPreferredAlignmentOfGlobal__retval


@cython.embedsignature(True)
def LLVMElementAtOffset(object TD, object StructTy, unsigned long long Offset):
    r"""(No short description, might be part of a group.)

    Computes the structure element that contains the byte offset for a target.
    See the method llvm`~.StructLayout.getElementContainingOffset`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        StructTy (`~.LLVMOpaqueType`/`~.object`):
            (undocumented)

        Offset (`~.int`):
            (undocumented)
    """
    cdef unsigned int _LLVMElementAtOffset__retval = ctarget.LLVMElementAtOffset(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueType.fromPyobj(StructTy).getElementPtr(),Offset)
    return _LLVMElementAtOffset__retval


@cython.embedsignature(True)
def LLVMOffsetOfElement(object TD, object StructTy, unsigned int Element):
    r"""(No short description, might be part of a group.)

    Computes the byte offset of the indexed struct element for a target.
    See the method llvm`~.StructLayout.getElementContainingOffset`.

    Args:
        TD (`~.LLVMOpaqueTargetData`/`~.object`):
            (undocumented)

        StructTy (`~.LLVMOpaqueType`/`~.object`):
            (undocumented)

        Element (`~.int`):
            (undocumented)
    """
    cdef unsigned long long _LLVMOffsetOfElement__retval = ctarget.LLVMOffsetOfElement(
        LLVMOpaqueTargetData.fromPyobj(TD).getElementPtr(),
        LLVMOpaqueType.fromPyobj(StructTy).getElementPtr(),Element)
    return _LLVMOffsetOfElement__retval

__all__ = [
    "_LLVMByteOrdering__Base",
    "LLVMByteOrdering",
    "LLVMOpaqueTargetData",
    "LLVMTargetDataRef",
    "LLVMOpaqueTargetLibraryInfotData",
    "LLVMTargetLibraryInfoRef",
    "LLVMInitializeAllTargetInfos",
    "LLVMInitializeAllTargets",
    "LLVMInitializeAllTargetMCs",
    "LLVMInitializeAllAsmPrinters",
    "LLVMInitializeAllAsmParsers",
    "LLVMInitializeAllDisassemblers",
    "LLVMInitializeNativeTarget",
    "LLVMInitializeNativeAsmParser",
    "LLVMInitializeNativeAsmPrinter",
    "LLVMInitializeNativeDisassembler",
    "LLVMGetModuleDataLayout",
    "LLVMSetModuleDataLayout",
    "LLVMCreateTargetData",
    "LLVMDisposeTargetData",
    "LLVMAddTargetLibraryInfo",
    "LLVMCopyStringRepOfTargetData",
    "LLVMByteOrder",
    "LLVMPointerSize",
    "LLVMPointerSizeForAS",
    "LLVMIntPtrType",
    "LLVMIntPtrTypeForAS",
    "LLVMIntPtrTypeInContext",
    "LLVMIntPtrTypeForASInContext",
    "LLVMSizeOfTypeInBits",
    "LLVMStoreSizeOfType",
    "LLVMABISizeOfType",
    "LLVMABIAlignmentOfType",
    "LLVMCallFrameAlignmentOfType",
    "LLVMPreferredAlignmentOfType",
    "LLVMPreferredAlignmentOfGlobal",
    "LLVMElementAtOffset",
    "LLVMOffsetOfElement",
]