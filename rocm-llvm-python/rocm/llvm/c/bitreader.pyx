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

@cython.embedsignature(True)
def LLVMParseBitcode(object MemBuf):
    r"""(No short description, might be part of a group.)

    @{

    Args:
        MemBuf (`~.LLVMOpaqueMemoryBuffer`/`~.object`):
            (undocumented)

    Returns:
        A `~.tuple` of size 2 that contains (in that order):

        * OutModule (`~.LLVMOpaqueModule`):
            (undocumented)
        * OutMessage (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)
    """
    OutModule = LLVMOpaqueModule.fromPtr(NULL)
    OutMessage = rocm.llvm._util.types.CStr.fromPtr(NULL)
    cdef int _LLVMParseBitcode__retval = cbitreader.LLVMParseBitcode(
        LLVMOpaqueMemoryBuffer.fromPyobj(MemBuf).getElementPtr(),<cbitreader.LLVMOpaqueModule**>&OutModule._ptr,
        <char **>&OutMessage._ptr)
    return (_LLVMParseBitcode__retval,None if OutModule._ptr == NULL else OutModule,None if OutMessage._ptr == NULL else OutMessage)


@cython.embedsignature(True)
def LLVMParseBitcode2(object MemBuf):
    r"""(No short description, might be part of a group.)

    Args:
        MemBuf (`~.LLVMOpaqueMemoryBuffer`/`~.object`):
            (undocumented)

    Returns:
        OutModule (`~.LLVMOpaqueModule`):
            (undocumented)
    """
    OutModule = LLVMOpaqueModule.fromPtr(NULL)
    cdef int _LLVMParseBitcode2__retval = cbitreader.LLVMParseBitcode2(
        LLVMOpaqueMemoryBuffer.fromPyobj(MemBuf).getElementPtr(),<cbitreader.LLVMOpaqueModule**>&OutModule._ptr)
    return (_LLVMParseBitcode2__retval,None if OutModule._ptr == NULL else OutModule)


@cython.embedsignature(True)
def LLVMParseBitcodeInContext(object ContextRef, object MemBuf):
    r"""(No short description, might be part of a group.)

    Args:
        ContextRef (`~.LLVMOpaqueContext`/`~.object`):
            (undocumented)

        MemBuf (`~.LLVMOpaqueMemoryBuffer`/`~.object`):
            (undocumented)

    Returns:
        A `~.tuple` of size 2 that contains (in that order):

        * OutModule (`~.LLVMOpaqueModule`):
            (undocumented)
        * OutMessage (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)
    """
    OutModule = LLVMOpaqueModule.fromPtr(NULL)
    OutMessage = rocm.llvm._util.types.CStr.fromPtr(NULL)
    cdef int _LLVMParseBitcodeInContext__retval = cbitreader.LLVMParseBitcodeInContext(
        LLVMOpaqueContext.fromPyobj(ContextRef).getElementPtr(),
        LLVMOpaqueMemoryBuffer.fromPyobj(MemBuf).getElementPtr(),<cbitreader.LLVMOpaqueModule**>&OutModule._ptr,
        <char **>&OutMessage._ptr)
    return (_LLVMParseBitcodeInContext__retval,None if OutModule._ptr == NULL else OutModule,None if OutMessage._ptr == NULL else OutMessage)


@cython.embedsignature(True)
def LLVMParseBitcodeInContext2(object ContextRef, object MemBuf):
    r"""(No short description, might be part of a group.)

    Args:
        ContextRef (`~.LLVMOpaqueContext`/`~.object`):
            (undocumented)

        MemBuf (`~.LLVMOpaqueMemoryBuffer`/`~.object`):
            (undocumented)

    Returns:
        OutModule (`~.LLVMOpaqueModule`):
            (undocumented)
    """
    OutModule = LLVMOpaqueModule.fromPtr(NULL)
    cdef int _LLVMParseBitcodeInContext2__retval = cbitreader.LLVMParseBitcodeInContext2(
        LLVMOpaqueContext.fromPyobj(ContextRef).getElementPtr(),
        LLVMOpaqueMemoryBuffer.fromPyobj(MemBuf).getElementPtr(),<cbitreader.LLVMOpaqueModule**>&OutModule._ptr)
    return (_LLVMParseBitcodeInContext2__retval,None if OutModule._ptr == NULL else OutModule)


@cython.embedsignature(True)
def LLVMGetBitcodeModuleInContext(object ContextRef, object MemBuf):
    r"""(No short description, might be part of a group.)

    Reads a module from the specified path, returning via the OutMP parameter
    a module provider which performs lazy deserialization. Returns 0 on success.
    Optionally returns a human-readable error message via OutMessage.
    This is deprecated. Use LLVMGetBitcodeModuleInContext2.

    Args:
        ContextRef (`~.LLVMOpaqueContext`/`~.object`):
            (undocumented)

        MemBuf (`~.LLVMOpaqueMemoryBuffer`/`~.object`):
            (undocumented)

    Returns:
        A `~.tuple` of size 2 that contains (in that order):

        * OutM (`~.LLVMOpaqueModule`):
            (undocumented)
        * OutMessage (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)
    """
    OutM = LLVMOpaqueModule.fromPtr(NULL)
    OutMessage = rocm.llvm._util.types.CStr.fromPtr(NULL)
    cdef int _LLVMGetBitcodeModuleInContext__retval = cbitreader.LLVMGetBitcodeModuleInContext(
        LLVMOpaqueContext.fromPyobj(ContextRef).getElementPtr(),
        LLVMOpaqueMemoryBuffer.fromPyobj(MemBuf).getElementPtr(),<cbitreader.LLVMOpaqueModule**>&OutM._ptr,
        <char **>&OutMessage._ptr)
    return (_LLVMGetBitcodeModuleInContext__retval,None if OutM._ptr == NULL else OutM,None if OutMessage._ptr == NULL else OutMessage)


@cython.embedsignature(True)
def LLVMGetBitcodeModuleInContext2(object ContextRef, object MemBuf):
    r"""(No short description, might be part of a group.)

    Reads a module from the given memory buffer, returning via the OutMP
    parameter a module provider which performs lazy deserialization.

    Returns 0 on success.

    Takes ownership of ``MemBuf`` if (and only if) the module was read
    successfully.

    Args:
        ContextRef (`~.LLVMOpaqueContext`/`~.object`):
            (undocumented)

        MemBuf (`~.LLVMOpaqueMemoryBuffer`/`~.object`):
            (undocumented)

    Returns:
        OutM (`~.LLVMOpaqueModule`):
            (undocumented)
    """
    OutM = LLVMOpaqueModule.fromPtr(NULL)
    cdef int _LLVMGetBitcodeModuleInContext2__retval = cbitreader.LLVMGetBitcodeModuleInContext2(
        LLVMOpaqueContext.fromPyobj(ContextRef).getElementPtr(),
        LLVMOpaqueMemoryBuffer.fromPyobj(MemBuf).getElementPtr(),<cbitreader.LLVMOpaqueModule**>&OutM._ptr)
    return (_LLVMGetBitcodeModuleInContext2__retval,None if OutM._ptr == NULL else OutM)


@cython.embedsignature(True)
def LLVMGetBitcodeModule(object MemBuf):
    r"""(No short description, might be part of a group.)

    Args:
        MemBuf (`~.LLVMOpaqueMemoryBuffer`/`~.object`):
            (undocumented)

    Returns:
        A `~.tuple` of size 2 that contains (in that order):

        * OutM (`~.LLVMOpaqueModule`):
            (undocumented)
        * OutMessage (`~.rocm.llvm._util.types.CStr`/`~.object`):
            (undocumented)
    """
    OutM = LLVMOpaqueModule.fromPtr(NULL)
    OutMessage = rocm.llvm._util.types.CStr.fromPtr(NULL)
    cdef int _LLVMGetBitcodeModule__retval = cbitreader.LLVMGetBitcodeModule(
        LLVMOpaqueMemoryBuffer.fromPyobj(MemBuf).getElementPtr(),<cbitreader.LLVMOpaqueModule**>&OutM._ptr,
        <char **>&OutMessage._ptr)
    return (_LLVMGetBitcodeModule__retval,None if OutM._ptr == NULL else OutM,None if OutMessage._ptr == NULL else OutMessage)


@cython.embedsignature(True)
def LLVMGetBitcodeModule2(object MemBuf):
    r"""(No short description, might be part of a group.)

    Args:
        MemBuf (`~.LLVMOpaqueMemoryBuffer`/`~.object`):
            (undocumented)

    Returns:
        OutM (`~.LLVMOpaqueModule`):
            (undocumented)
    """
    OutM = LLVMOpaqueModule.fromPtr(NULL)
    cdef int _LLVMGetBitcodeModule2__retval = cbitreader.LLVMGetBitcodeModule2(
        LLVMOpaqueMemoryBuffer.fromPyobj(MemBuf).getElementPtr(),<cbitreader.LLVMOpaqueModule**>&OutM._ptr)
    return (_LLVMGetBitcodeModule2__retval,None if OutM._ptr == NULL else OutM)

__all__ = [
    "LLVMParseBitcode",
    "LLVMParseBitcode2",
    "LLVMParseBitcodeInContext",
    "LLVMParseBitcodeInContext2",
    "LLVMGetBitcodeModuleInContext",
    "LLVMGetBitcodeModuleInContext2",
    "LLVMGetBitcodeModule",
    "LLVMGetBitcodeModule2",
]