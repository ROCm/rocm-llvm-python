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
from rocm.llvm.c.types import LLVMOperandBundleRef
from rocm.llvm.c.types import LLVMAttributeRef
from rocm.llvm.c.types import LLVMDiagnosticInfoRef
from rocm.llvm.c.types import LLVMComdatRef
from rocm.llvm.c.types import LLVMModuleFlagEntry
from rocm.llvm.c.types import LLVMJITEventListenerRef
from rocm.llvm.c.types import LLVMBinaryRef

class _LLVMLinkerMode__Base(enum.IntEnum):
    """Empty enum base class that allows subclassing.
    """
    pass
class LLVMLinkerMode(_LLVMLinkerMode__Base):
    """@{

    Attributes:
        LLVMLinkerDestroySource:
            (undocumented)
        LLVMLinkerPreserveSource_Removed:
            (undocumented)
    """
    LLVMLinkerDestroySource = clinker.LLVMLinkerDestroySource
    LLVMLinkerPreserveSource_Removed = clinker.LLVMLinkerPreserveSource_Removed
    @staticmethod
    def ctypes_type():
        """The type of the enum constants as ctypes type."""
        return ctypes.c_uint


@cython.embedsignature(True)
def LLVMLinkModules2(object Dest, object Src):
    r"""(No short description, might be part of a group.)

    Args:
        Dest (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)

        Src (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)
    """
    cdef int _LLVMLinkModules2__retval = clinker.LLVMLinkModules2(
        LLVMOpaqueModule.fromPyobj(Dest).getElementPtr(),
        LLVMOpaqueModule.fromPyobj(Src).getElementPtr())
    return _LLVMLinkModules2__retval

__all__ = [
    "_LLVMLinkerMode__Base",
    "LLVMLinkerMode",
    "LLVMLinkModules2",
]