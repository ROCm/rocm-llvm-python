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

from rocm.llvm.c.disassemblertypes import LLVMDisasmContextRef

@cython.embedsignature(True)
def LLVMCreateDisasm(const char * TripleName, object DisInfo, int TagType, object GetOpInfo, object SymbolLookUp):
    r"""(No short description, might be part of a group.)

    Create a disassembler for the TripleName.  Symbolic disassembly is supported
    by passing a block of information in the DisInfo parameter and specifying the
    TagType and callback functions as described above.  These can all be passed
    as NULL.  If successful, this returns a disassembler context.  If not, it
    returns NULL. This function is equivalent to calling
    LLVMCreateDisasmCPUFeatures() with an empty CPU name and feature set.

    Args:
        TripleName (`~.bytes`):
            (undocumented)

        DisInfo (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        TagType (`~.int`):
            (undocumented)

        GetOpInfo (`~.LLVMOpInfoCallback`/`~.object`):
            (undocumented)

        SymbolLookUp (`~.LLVMSymbolLookupCallback`/`~.object`):
            (undocumented)
    """
    _LLVMCreateDisasm__retval = void *.from_value(cdisassembler.LLVMCreateDisasm(TripleName,
        <void *>rocm.llvm._util.Pointer.from_pyobj(DisInfo)._ptr,TagType,
        LLVMOpInfoCallback.from_pyobj(GetOpInfo)._ptr,
        LLVMSymbolLookupCallback.from_pyobj(SymbolLookUp)._ptr))    # fully specified
    return (_LLVMCreateDisasm__retval,)


@cython.embedsignature(True)
def LLVMCreateDisasmCPU(const char * Triple, const char * CPU, object DisInfo, int TagType, object GetOpInfo, object SymbolLookUp):
    r"""(No short description, might be part of a group.)

    Create a disassembler for the TripleName and a specific CPU.  Symbolic
    disassembly is supported by passing a block of information in the DisInfo
    parameter and specifying the TagType and callback functions as described
    above.  These can all be passed * as NULL.  If successful, this returns a
    disassembler context.  If not, it returns NULL. This function is equivalent
    to calling LLVMCreateDisasmCPUFeatures() with an empty feature set.

    Args:
        Triple (`~.bytes`):
            (undocumented)

        CPU (`~.bytes`):
            (undocumented)

        DisInfo (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        TagType (`~.int`):
            (undocumented)

        GetOpInfo (`~.LLVMOpInfoCallback`/`~.object`):
            (undocumented)

        SymbolLookUp (`~.LLVMSymbolLookupCallback`/`~.object`):
            (undocumented)
    """
    _LLVMCreateDisasmCPU__retval = void *.from_value(cdisassembler.LLVMCreateDisasmCPU(Triple,CPU,
        <void *>rocm.llvm._util.Pointer.from_pyobj(DisInfo)._ptr,TagType,
        LLVMOpInfoCallback.from_pyobj(GetOpInfo)._ptr,
        LLVMSymbolLookupCallback.from_pyobj(SymbolLookUp)._ptr))    # fully specified
    return (_LLVMCreateDisasmCPU__retval,)


@cython.embedsignature(True)
def LLVMCreateDisasmCPUFeatures(const char * Triple, const char * CPU, const char * Features, object DisInfo, int TagType, object GetOpInfo, object SymbolLookUp):
    r"""(No short description, might be part of a group.)

    Create a disassembler for the TripleName, a specific CPU and specific feature
    string.  Symbolic disassembly is supported by passing a block of information
    in the DisInfo parameter and specifying the TagType and callback functions as
    described above.  These can all be passed * as NULL.  If successful, this
    returns a disassembler context.  If not, it returns NULL.

    Args:
        Triple (`~.bytes`):
            (undocumented)

        CPU (`~.bytes`):
            (undocumented)

        Features (`~.bytes`):
            (undocumented)

        DisInfo (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        TagType (`~.int`):
            (undocumented)

        GetOpInfo (`~.LLVMOpInfoCallback`/`~.object`):
            (undocumented)

        SymbolLookUp (`~.LLVMSymbolLookupCallback`/`~.object`):
            (undocumented)
    """
    _LLVMCreateDisasmCPUFeatures__retval = void *.from_value(cdisassembler.LLVMCreateDisasmCPUFeatures(Triple,CPU,Features,
        <void *>rocm.llvm._util.Pointer.from_pyobj(DisInfo)._ptr,TagType,
        LLVMOpInfoCallback.from_pyobj(GetOpInfo)._ptr,
        LLVMSymbolLookupCallback.from_pyobj(SymbolLookUp)._ptr))    # fully specified
    return (_LLVMCreateDisasmCPUFeatures__retval,)


@cython.embedsignature(True)
def LLVMSetDisasmOptions(object DC, unsigned long Options):
    r"""(No short description, might be part of a group.)

    Set the disassembler's options.  Returns 1 if it can set the Options and 0
    otherwise.

    Args:
        DC (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        Options (`~.int`):
            (undocumented)

    Returns:
        A `~.tuple` of size 1 that contains (in that order):

        * `~.int`
    """
    cdef int _LLVMSetDisasmOptions__retval = cdisassembler.LLVMSetDisasmOptions(
        <void *>rocm.llvm._util.Pointer.from_pyobj(DC)._ptr,Options)    # fully specified
    return (_LLVMSetDisasmOptions__retval,)


@cython.embedsignature(True)
def LLVMDisasmDispose(object DC):
    r"""(No short description, might be part of a group.)

    Dispose of a disassembler context.

    Args:
        DC (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)
    """
    cdisassembler.LLVMDisasmDispose(
        <void *>rocm.llvm._util.Pointer.from_pyobj(DC)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMDisasmInstruction(object DC, object Bytes, unsigned long BytesSize, unsigned long PC, char * OutString, unsigned long OutStringSize):
    r"""(No short description, might be part of a group.)

    Disassemble a single instruction using the disassembler context specified in
    the parameter DC.  The bytes of the instruction are specified in the
    parameter Bytes, and contains at least BytesSize number of bytes.  The
    instruction is at the address specified by the PC parameter.  If a valid
    instruction can be disassembled, its string is returned indirectly in
    OutString whose size is specified in the parameter OutStringSize.  This
    function returns the number of bytes in the instruction or zero if there was
    no valid instruction.

    Args:
        DC (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        Bytes (`~.rocm.llvm._util.Pointer`/`~.object`):
            (undocumented)

        BytesSize (`~.int`):
            (undocumented)

        PC (`~.int`):
            (undocumented)

        OutString (`~.bytes`):
            (undocumented)

        OutStringSize (`~.int`):
            (undocumented)

    Returns:
        A `~.tuple` of size 1 that contains (in that order):

        * `~.int`
    """
    cdef unsigned long _LLVMDisasmInstruction__retval = cdisassembler.LLVMDisasmInstruction(
        <void *>rocm.llvm._util.Pointer.from_pyobj(DC)._ptr,
        <unsigned char *>rocm.llvm._util.Pointer.from_pyobj(Bytes)._ptr,BytesSize,PC,OutString,OutStringSize)    # fully specified
    return (_LLVMDisasmInstruction__retval,)

__all__ = [
    "LLVMCreateDisasm",
    "LLVMCreateDisasmCPU",
    "LLVMCreateDisasmCPUFeatures",
    "LLVMSetDisasmOptions",
    "LLVMDisasmDispose",
    "LLVMDisasmInstruction",
]