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

@cython.embedsignature(True)
def LLVMWriteBitcodeToFile(object M, object Path):
    r"""(No short description, might be part of a group.)

    Writes a module to the specified path. Returns 0 on success. */

    Args:
        M (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)

        Path (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)

    Returns:
        `~.int`
    """
    cdef int _LLVMWriteBitcodeToFile__retval = cbitwriter.LLVMWriteBitcodeToFile(
        LLVMOpaqueModule.from_pyobj(M).get_element_ptr(),
        <const char *>rocm.llvm._util.types.CStr.from_pyobj(Path)._ptr)    # fully specified
    return _LLVMWriteBitcodeToFile__retval


@cython.embedsignature(True)
def LLVMWriteBitcodeToFD(object M, int FD, int ShouldClose, int Unbuffered):
    r"""(No short description, might be part of a group.)

    Writes a module to an open file descriptor. Returns 0 on success. */

    Args:
        M (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)

        FD (`~.int`):
            (undocumented)

        ShouldClose (`~.int`):
            (undocumented)

        Unbuffered (`~.int`):
            (undocumented)

    Returns:
        `~.int`
    """
    cdef int _LLVMWriteBitcodeToFD__retval = cbitwriter.LLVMWriteBitcodeToFD(
        LLVMOpaqueModule.from_pyobj(M).get_element_ptr(),FD,ShouldClose,Unbuffered)    # fully specified
    return _LLVMWriteBitcodeToFD__retval


@cython.embedsignature(True)
def LLVMWriteBitcodeToFileHandle(object M, int Handle):
    r"""(No short description, might be part of a group.)

    Deprecated for LLVMWriteBitcodeToFD. Writes a module to an open file
    descriptor. Returns 0 on success. Closes the Handle.

    Args:
        M (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)

        Handle (`~.int`):
            (undocumented)

    Returns:
        `~.int`
    """
    cdef int _LLVMWriteBitcodeToFileHandle__retval = cbitwriter.LLVMWriteBitcodeToFileHandle(
        LLVMOpaqueModule.from_pyobj(M).get_element_ptr(),Handle)    # fully specified
    return _LLVMWriteBitcodeToFileHandle__retval


@cython.embedsignature(True)
def LLVMWriteBitcodeToMemoryBuffer(object M):
    r"""(No short description, might be part of a group.)

    Writes a module to a new memory buffer and returns it. */

    Args:
        M (`~.LLVMOpaqueModule`/`~.object`):
            (undocumented)
    """
    _LLVMWriteBitcodeToMemoryBuffer__retval = LLVMOpaqueMemoryBuffer.from_ptr(cbitwriter.LLVMWriteBitcodeToMemoryBuffer(
        LLVMOpaqueModule.from_pyobj(M).get_element_ptr()))    # fully specified
    return _LLVMWriteBitcodeToMemoryBuffer__retval

__all__ = [
    "LLVMWriteBitcodeToFile",
    "LLVMWriteBitcodeToFD",
    "LLVMWriteBitcodeToFileHandle",
    "LLVMWriteBitcodeToMemoryBuffer",
]