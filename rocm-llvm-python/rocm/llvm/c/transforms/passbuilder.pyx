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
    LLVMPassBuilderOptionsRef:
        alias of `~.LLVMOpaquePassBuilderOptions`

"""

import cython
import ctypes
import enum

from rocm.llvm.c.error import LLVMErrorRef
from rocm.llvm.c.error import LLVMGetErrorTypeId
from rocm.llvm.c.error import LLVMConsumeError
from rocm.llvm.c.error import LLVMGetErrorMessage
from rocm.llvm.c.error import LLVMDisposeErrorMessage
from rocm.llvm.c.error import LLVMGetStringErrorTypeId
from rocm.llvm.c.error import LLVMCreateStringError


from rocm.llvm.c.targetmachine import LLVMTargetMachineRef
from rocm.llvm.c.targetmachine import LLVMTargetRef
from rocm.llvm.c.targetmachine import LLVMCodeGenOptLevel
from rocm.llvm.c.targetmachine import LLVMRelocMode
from rocm.llvm.c.targetmachine import LLVMCodeModel
from rocm.llvm.c.targetmachine import LLVMCodeGenFileType
from rocm.llvm.c.targetmachine import LLVMGetFirstTarget
from rocm.llvm.c.targetmachine import LLVMGetNextTarget
from rocm.llvm.c.targetmachine import LLVMGetTargetFromName
from rocm.llvm.c.targetmachine import LLVMGetTargetFromTriple
from rocm.llvm.c.targetmachine import LLVMGetTargetName
from rocm.llvm.c.targetmachine import LLVMGetTargetDescription
from rocm.llvm.c.targetmachine import LLVMTargetHasJIT
from rocm.llvm.c.targetmachine import LLVMTargetHasTargetMachine
from rocm.llvm.c.targetmachine import LLVMTargetHasAsmBackend
from rocm.llvm.c.targetmachine import LLVMCreateTargetMachine
from rocm.llvm.c.targetmachine import LLVMDisposeTargetMachine
from rocm.llvm.c.targetmachine import LLVMGetTargetMachineTarget
from rocm.llvm.c.targetmachine import LLVMGetTargetMachineTriple
from rocm.llvm.c.targetmachine import LLVMGetTargetMachineCPU
from rocm.llvm.c.targetmachine import LLVMGetTargetMachineFeatureString
from rocm.llvm.c.targetmachine import LLVMCreateTargetDataLayout
from rocm.llvm.c.targetmachine import LLVMSetTargetMachineAsmVerbosity
from rocm.llvm.c.targetmachine import LLVMTargetMachineEmitToFile
from rocm.llvm.c.targetmachine import LLVMTargetMachineEmitToMemoryBuffer
from rocm.llvm.c.targetmachine import LLVMGetDefaultTargetTriple
from rocm.llvm.c.targetmachine import LLVMNormalizeTargetTriple
from rocm.llvm.c.targetmachine import LLVMGetHostCPUName
from rocm.llvm.c.targetmachine import LLVMGetHostCPUFeatures
from rocm.llvm.c.targetmachine import LLVMAddAnalysisPasses


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

cdef class LLVMOpaquePassBuilderOptions(rocm.llvm._util.types.Pointer):
    """Python wrapper for cdef class cpassbuilder.LLVMOpaquePassBuilderOptions.

    Python wrapper for cdef class cpassbuilder.LLVMOpaquePassBuilderOptions.

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

    cdef cpassbuilder.LLVMOpaquePassBuilderOptions* getElementPtr(self):
        return <cpassbuilder.LLVMOpaquePassBuilderOptions*>self._ptr

    @staticmethod
    cdef LLVMOpaquePassBuilderOptions fromPtr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMOpaquePassBuilderOptions`` objects from
        given ``cpassbuilder.LLVMOpaquePassBuilderOptions`` pointer.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMOpaquePassBuilderOptions wrapper = LLVMOpaquePassBuilderOptions.__new__(LLVMOpaquePassBuilderOptions)
        wrapper._ptr = ptr
        wrapper._is_ptr_owner = owner
        return wrapper

    @staticmethod
    def fromObj(pyobj):
        """Creates a LLVMOpaquePassBuilderOptions from a Python object.

        Derives a LLVMOpaquePassBuilderOptions from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpaquePassBuilderOptions`` reference, this method
        returns it directly. No new ``LLVMOpaquePassBuilderOptions`` is created in this case.
        """
        return LLVMOpaquePassBuilderOptions.fromPyobj(pyobj)

    @staticmethod
    cdef LLVMOpaquePassBuilderOptions fromPyobj(object pyobj):
        """Creates a LLVMOpaquePassBuilderOptions from a Python object.

        Derives a LLVMOpaquePassBuilderOptions from the given Python object ``pyobj``.
        In case ``pyobj`` is itself an ``LLVMOpaquePassBuilderOptions`` reference, this method
        returns it directly. No new ``LLVMOpaquePassBuilderOptions`` is created in this case.

        Args:
            pyobj (object): Must be either `None`; a `rocm.llvm._util.types.Pointer`; a simple, contiguous buffer according to the buffer protocol;
                            or of type `LLVMOpaquePassBuilderOptions`; `int`; or `ctypes.c_void_p`.

        Note:
            This routine does not perform a copy but returns the original ``pyobj``
            if ``pyobj`` is an instance of LLVMOpaquePassBuilderOptions!
        """
        cdef LLVMOpaquePassBuilderOptions wrapper

        if isinstance(pyobj,LLVMOpaquePassBuilderOptions):
            return pyobj
        else:
            wrapper = LLVMOpaquePassBuilderOptions.__new__(LLVMOpaquePassBuilderOptions)
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
        return f"<LLVMOpaquePassBuilderOptions object, ptr: {int(self)}>"

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


LLVMPassBuilderOptionsRef = LLVMOpaquePassBuilderOptions

@cython.embedsignature(True)
def LLVMRunPasses(object M, object Passes, object TM, object Options):
    r"""(No short description, might be part of a group.)

    Construct and run a set of passes over a module

    This function takes a string with the passes that should be used. The format
    of this string is the same as opt's -passes argument for the new pass
    manager. Individual passes may be specified, separated by commas. Full
    pipelines may also be invoked using `default<O3>` and friends. See opt for
    full reference of the Passes format.

    Args:
        M (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)

        Passes (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)

        TM (`~.LLVMOpaqueTargetMachine`/`~.object`):
            (undocumented)

        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)
    """
    _LLVMRunPasses__retval = LLVMOpaqueError.fromPtr(cpassbuilder.LLVMRunPasses(
        LLVMOpaqueModule.fromPyobj(M).getElementPtr(),
        <const char *>rocm.llvm._util.types.CStr.fromPyobj(Passes)._ptr,
        LLVMOpaqueTargetMachine.fromPyobj(TM).getElementPtr(),
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr()))
    return None if _LLVMRunPasses__retval._ptr == NULL else _LLVMRunPasses__retval


@cython.embedsignature(True)
def LLVMCreatePassBuilderOptions():
    r"""(No short description, might be part of a group.)

    Create a new set of options for a PassBuilder

    Ownership of the returned instance is given to the client, and they are
    responsible for it. The client should call LLVMDisposePassBuilderOptions
    to free the pass builder options.
    """
    _LLVMCreatePassBuilderOptions__retval = LLVMOpaquePassBuilderOptions.fromPtr(cpassbuilder.LLVMCreatePassBuilderOptions())
    return None if _LLVMCreatePassBuilderOptions__retval._ptr == NULL else _LLVMCreatePassBuilderOptions__retval


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetVerifyEach(object Options, int VerifyEach):
    r"""(No short description, might be part of a group.)

    Toggle adding the VerifierPass for the PassBuilder, ensuring all functions
    inside the module is valid.

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        VerifyEach (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetVerifyEach(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),VerifyEach)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetDebugLogging(object Options, int DebugLogging):
    r"""(No short description, might be part of a group.)

    Toggle debug logging when running the PassBuilder

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        DebugLogging (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetDebugLogging(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),DebugLogging)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetLoopInterleaving(object Options, int LoopInterleaving):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        LoopInterleaving (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetLoopInterleaving(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),LoopInterleaving)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetLoopVectorization(object Options, int LoopVectorization):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        LoopVectorization (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetLoopVectorization(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),LoopVectorization)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetSLPVectorization(object Options, int SLPVectorization):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        SLPVectorization (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetSLPVectorization(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),SLPVectorization)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetLoopUnrolling(object Options, int LoopUnrolling):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        LoopUnrolling (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetLoopUnrolling(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),LoopUnrolling)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll(object Options, int ForgetAllSCEVInLoopUnroll):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        ForgetAllSCEVInLoopUnroll (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),ForgetAllSCEVInLoopUnroll)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetLicmMssaOptCap(object Options, unsigned int LicmMssaOptCap):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        LicmMssaOptCap (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetLicmMssaOptCap(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),LicmMssaOptCap)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap(object Options, unsigned int LicmMssaNoAccForPromotionCap):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        LicmMssaNoAccForPromotionCap (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),LicmMssaNoAccForPromotionCap)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetCallGraphProfile(object Options, int CallGraphProfile):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        CallGraphProfile (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetCallGraphProfile(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),CallGraphProfile)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetMergeFunctions(object Options, int MergeFunctions):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        MergeFunctions (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetMergeFunctions(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),MergeFunctions)


@cython.embedsignature(True)
def LLVMPassBuilderOptionsSetInlinerThreshold(object Options, int Threshold):
    r"""(No short description, might be part of a group.)

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)

        Threshold (`~.int`):
            (undocumented)
    """
    cpassbuilder.LLVMPassBuilderOptionsSetInlinerThreshold(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr(),Threshold)


@cython.embedsignature(True)
def LLVMDisposePassBuilderOptions(object Options):
    r"""(No short description, might be part of a group.)

    Dispose of a heap-allocated PassBuilderOptions instance

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)
    """
    cpassbuilder.LLVMDisposePassBuilderOptions(
        LLVMOpaquePassBuilderOptions.fromPyobj(Options).getElementPtr())

__all__ = [
    "LLVMOpaquePassBuilderOptions",
    "LLVMPassBuilderOptionsRef",
    "LLVMRunPasses",
    "LLVMCreatePassBuilderOptions",
    "LLVMPassBuilderOptionsSetVerifyEach",
    "LLVMPassBuilderOptionsSetDebugLogging",
    "LLVMPassBuilderOptionsSetLoopInterleaving",
    "LLVMPassBuilderOptionsSetLoopVectorization",
    "LLVMPassBuilderOptionsSetSLPVectorization",
    "LLVMPassBuilderOptionsSetLoopUnrolling",
    "LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll",
    "LLVMPassBuilderOptionsSetLicmMssaOptCap",
    "LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap",
    "LLVMPassBuilderOptionsSetCallGraphProfile",
    "LLVMPassBuilderOptionsSetMergeFunctions",
    "LLVMPassBuilderOptionsSetInlinerThreshold",
    "LLVMDisposePassBuilderOptions",
]