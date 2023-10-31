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
from rocm.llvm.c.types import LLVMPassRegistryRef
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

    If this type is initialized via its `__init__` method, it allocates a member of the underlying C type and
    destroys it again if the wrapper type is deallocted.

    This type also serves as adapter when appearing as argument type in a function signature.
    In this case, the type can further be initialized from the following Python objects
    that you can pass as argument instead:
    
    * `None`:

      This will set the ``self._ptr`` attribute to ``NULL``.

    * `int`:
      
      Interprets the integer value as pointer address and writes it to ``self._ptr``.
      No ownership is transferred.
      
    * `ctypes.c_void_p`:
      
      Takes the pointer address ``pyobj.value`` and writes it to ``self._ptr``.
      No ownership is transferred.
    
    
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

    cdef cpassbuilder.LLVMOpaquePassBuilderOptions* get_element_ptr(self):
        return <cpassbuilder.LLVMOpaquePassBuilderOptions*>self._ptr
        
    @staticmethod
    cdef LLVMOpaquePassBuilderOptions from_ptr(void* ptr, bint owner=False):
        """Factory function to create ``LLVMOpaquePassBuilderOptions`` objects from
        given ``cpassbuilder.LLVMOpaquePassBuilderOptions`` pointer.
        """
        # Fast call to __new__() that bypasses the __init__() constructor.
        cdef LLVMOpaquePassBuilderOptions wrapper = LLVMOpaquePassBuilderOptions.__new__(LLVMOpaquePassBuilderOptions)
        wrapper._ptr = ptr
        wrapper.ptr_owner = owner
        return wrapper

    @staticmethod
    cdef LLVMOpaquePassBuilderOptions from_pyobj(object pyobj):
        """Derives a LLVMOpaquePassBuilderOptions from a Python object.

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
        cdef LLVMOpaquePassBuilderOptions wrapper = LLVMOpaquePassBuilderOptions.__new__(LLVMOpaquePassBuilderOptions)
        cdef dict cuda_array_interface = getattr(pyobj, "__cuda_array_interface__", None)

        if pyobj is None:
            wrapper._ptr = NULL
        elif isinstance(pyobj,LLVMOpaquePassBuilderOptions):
            return pyobj
        elif isinstance(pyobj,int):
            wrapper._ptr = cpython.long.PyLong_AsVoidPtr(pyobj)
        elif isinstance(pyobj,ctypes.c_void_p):
            wrapper._ptr = cpython.long.PyLong_AsVoidPtr(pyobj.value) if pyobj.value != None else NULL
        elif cpython.buffer.PyObject_CheckBuffer(pyobj):
            err = cpython.buffer.PyObject_GetBuffer( 
                pyobj,
                &wrapper._py_buffer, 
                cpython.buffer.PyBUF_SIMPLE | cpython.buffer.PyBUF_ANY_CONTIGUOUS
            )
            if err == -1:
                raise RuntimeError("failed to create simple, contiguous Py_buffer from Python object")
            wrapper._py_buffer_acquired = True
            wrapper._ptr = wrapper._py_buffer.buf
        elif isinstance(pyobj,rocm.llvm._util.types.Pointer):
            wrapper._ptr = cpython.long.PyLong_AsVoidPtr(int(pyobj))
        else:
            raise TypeError(f"unsupported input type: '{str(type(pyobj))}'")
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
        return f"<LLVMOpaquePassBuilderOptions object, self.ptr={int(self)}>"
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
    _LLVMRunPasses__retval = LLVMOpaqueError.from_ptr(cpassbuilder.LLVMRunPasses(
        LLVMOpaqueModule.from_pyobj(M).get_element_ptr(),
        <const char *>rocm.llvm._util.types.CStr.from_pyobj(Passes)._ptr,
        LLVMOpaqueTargetMachine.from_pyobj(TM).get_element_ptr(),
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr()))    # fully specified
    return _LLVMRunPasses__retval


@cython.embedsignature(True)
def LLVMCreatePassBuilderOptions():
    r"""(No short description, might be part of a group.)

    Create a new set of options for a PassBuilder

    Ownership of the returned instance is given to the client, and they are
    responsible for it. The client should call LLVMDisposePassBuilderOptions
    to free the pass builder options.
    """
    _LLVMCreatePassBuilderOptions__retval = LLVMOpaquePassBuilderOptions.from_ptr(cpassbuilder.LLVMCreatePassBuilderOptions())    # fully specified
    return _LLVMCreatePassBuilderOptions__retval


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),VerifyEach)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),DebugLogging)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),LoopInterleaving)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),LoopVectorization)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),SLPVectorization)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),LoopUnrolling)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),ForgetAllSCEVInLoopUnroll)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),LicmMssaOptCap)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),LicmMssaNoAccForPromotionCap)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),CallGraphProfile)    # fully specified


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
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr(),MergeFunctions)    # fully specified


@cython.embedsignature(True)
def LLVMDisposePassBuilderOptions(object Options):
    r"""(No short description, might be part of a group.)

    Dispose of a heap-allocated PassBuilderOptions instance

    Args:
        Options (`~.LLVMOpaquePassBuilderOptions`/`~.object`):
            (undocumented)
    """
    cpassbuilder.LLVMDisposePassBuilderOptions(
        LLVMOpaquePassBuilderOptions.from_pyobj(Options).get_element_ptr())    # fully specified

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
    "LLVMDisposePassBuilderOptions",
]