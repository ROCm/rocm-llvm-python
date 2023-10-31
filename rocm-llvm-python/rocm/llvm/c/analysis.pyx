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

class _LLVMVerifierFailureAction__Base(enum.IntEnum):
    """Empty enum base class that allows subclassing.
    """
    pass
class LLVMVerifierFailureAction(_LLVMVerifierFailureAction__Base):
    """@{

    Attributes:
        LLVMAbortProcessAction:
            (undocumented)
        LLVMPrintMessageAction:
            (undocumented)
        LLVMReturnStatusAction:
            (undocumented)
    """
    LLVMAbortProcessAction = canalysis.LLVMAbortProcessAction
    LLVMPrintMessageAction = canalysis.LLVMPrintMessageAction
    LLVMReturnStatusAction = canalysis.LLVMReturnStatusAction
    @staticmethod
    def ctypes_type():
        """The type of the enum constants as ctypes type."""
        return ctypes.c_uint 


@cython.embedsignature(True)
def LLVMVerifyModule(object M, object Action):
    r"""(No short description, might be part of a group.)

    Args:
        M (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)

        Action (`~.LLVMVerifierFailureAction`):
            (undocumented)

    Returns:
        A `~.tuple` of size 2 that contains (in that order):

        * `~.int`
        * OutMessage (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)
    """
    if not isinstance(Action,_LLVMVerifierFailureAction__Base):
        raise TypeError("argument 'Action' must be of type '_LLVMVerifierFailureAction__Base'")                    
    OutMessage = rocm.llvm._util.types.CStr.from_ptr(NULL)
    cdef int _LLVMVerifyModule__retval = canalysis.LLVMVerifyModule(
        LLVMOpaqueModule.from_pyobj(M).get_element_ptr(),Action.value,
        <char **>&OutMessage._ptr)    # fully specified
    return (_LLVMVerifyModule__retval,None if OutMessage._ptr == NULL else OutMessage)


@cython.embedsignature(True)
def LLVMVerifyFunction(object Fn, object Action):
    r"""(No short description, might be part of a group.)

    Args:
        Fn (`~.LLVMOpaqueValue`/`~.object`):
            (undocumented)

        Action (`~.LLVMVerifierFailureAction`):
            (undocumented)

    Returns:
        `~.int`
    """
    if not isinstance(Action,_LLVMVerifierFailureAction__Base):
        raise TypeError("argument 'Action' must be of type '_LLVMVerifierFailureAction__Base'")
    cdef int _LLVMVerifyFunction__retval = canalysis.LLVMVerifyFunction(
        LLVMOpaqueValue.from_pyobj(Fn).get_element_ptr(),Action.value)    # fully specified
    return _LLVMVerifyFunction__retval


@cython.embedsignature(True)
def LLVMViewFunctionCFG(object Fn):
    r"""(No short description, might be part of a group.)

    Args:
        Fn (`~.LLVMOpaqueValue`/`~.object`):
            (undocumented)
    """
    canalysis.LLVMViewFunctionCFG(
        LLVMOpaqueValue.from_pyobj(Fn).get_element_ptr())    # fully specified


@cython.embedsignature(True)
def LLVMViewFunctionCFGOnly(object Fn):
    r"""(No short description, might be part of a group.)

    Args:
        Fn (`~.LLVMOpaqueValue`/`~.object`):
            (undocumented)
    """
    canalysis.LLVMViewFunctionCFGOnly(
        LLVMOpaqueValue.from_pyobj(Fn).get_element_ptr())    # fully specified

__all__ = [
    "_LLVMVerifierFailureAction__Base",
    "LLVMVerifierFailureAction",
    "LLVMVerifyModule",
    "LLVMVerifyFunction",
    "LLVMViewFunctionCFG",
    "LLVMViewFunctionCFGOnly",
]