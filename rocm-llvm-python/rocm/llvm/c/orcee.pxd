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

from libc cimport stdlib
from libc cimport string
from libc.stdint cimport *
cimport cpython.long
cimport cpython.buffer
ctypedef bint _Bool # bool is not a reserved keyword in C, _Bool is
cimport rocm.llvm._util.types

from rocm.llvm.c.error cimport LLVMOpaqueError


from rocm.llvm.c.executionengine cimport LLVMOpaqueGenericValue
from rocm.llvm.c.executionengine cimport LLVMOpaqueExecutionEngine
from rocm.llvm.c.executionengine cimport LLVMOpaqueMCJITMemoryManager
from rocm.llvm.c.executionengine cimport LLVMMCJITCompilerOptions
from rocm.llvm.c.executionengine cimport LLVMMemoryManagerAllocateCodeSectionCallback
from rocm.llvm.c.executionengine cimport LLVMMemoryManagerAllocateDataSectionCallback
from rocm.llvm.c.executionengine cimport LLVMMemoryManagerFinalizeMemoryCallback
from rocm.llvm.c.executionengine cimport LLVMMemoryManagerDestroyCallback


from rocm.llvm.c.orc cimport LLVMJITSymbolFlags
from rocm.llvm.c.orc cimport LLVMJITEvaluatedSymbol
from rocm.llvm.c.orc cimport LLVMOrcOpaqueExecutionSession
from rocm.llvm.c.orc cimport LLVMOrcErrorReporterFunction
from rocm.llvm.c.orc cimport LLVMOrcOpaqueSymbolStringPool
from rocm.llvm.c.orc cimport LLVMOrcOpaqueSymbolStringPoolEntry
from rocm.llvm.c.orc cimport LLVMOrcCSymbolFlagsMapPair
from rocm.llvm.c.orc cimport LLVMOrcCSymbolMapPair
from rocm.llvm.c.orc cimport LLVMOrcCSymbolAliasMapEntry
from rocm.llvm.c.orc cimport LLVMOrcCSymbolAliasMapPair
from rocm.llvm.c.orc cimport LLVMOrcOpaqueJITDylib
from rocm.llvm.c.orc cimport LLVMOrcCSymbolsList
from rocm.llvm.c.orc cimport LLVMOrcCDependenceMapPair
from rocm.llvm.c.orc cimport LLVMOrcCJITDylibSearchOrderElement
from rocm.llvm.c.orc cimport LLVMOrcCLookupSetElement
from rocm.llvm.c.orc cimport LLVMOrcOpaqueMaterializationUnit
from rocm.llvm.c.orc cimport LLVMOrcOpaqueMaterializationResponsibility
from rocm.llvm.c.orc cimport LLVMOrcMaterializationUnitMaterializeFunction
from rocm.llvm.c.orc cimport LLVMOrcMaterializationUnitDiscardFunction
from rocm.llvm.c.orc cimport LLVMOrcMaterializationUnitDestroyFunction
from rocm.llvm.c.orc cimport LLVMOrcOpaqueResourceTracker
from rocm.llvm.c.orc cimport LLVMOrcOpaqueDefinitionGenerator
from rocm.llvm.c.orc cimport LLVMOrcOpaqueLookupState
from rocm.llvm.c.orc cimport LLVMOrcCAPIDefinitionGeneratorTryToGenerateFunction
from rocm.llvm.c.orc cimport LLVMOrcDisposeCAPIDefinitionGeneratorFunction
from rocm.llvm.c.orc cimport LLVMOrcSymbolPredicate
from rocm.llvm.c.orc cimport LLVMOrcOpaqueThreadSafeContext
from rocm.llvm.c.orc cimport LLVMOrcOpaqueThreadSafeModule
from rocm.llvm.c.orc cimport LLVMOrcGenericIRModuleOperationFunction
from rocm.llvm.c.orc cimport LLVMOrcOpaqueJITTargetMachineBuilder
from rocm.llvm.c.orc cimport LLVMOrcOpaqueObjectLayer
from rocm.llvm.c.orc cimport LLVMOrcOpaqueObjectLinkingLayer
from rocm.llvm.c.orc cimport LLVMOrcOpaqueIRTransformLayer
from rocm.llvm.c.orc cimport LLVMOrcIRTransformLayerTransformFunction
from rocm.llvm.c.orc cimport LLVMOrcOpaqueObjectTransformLayer
from rocm.llvm.c.orc cimport LLVMOrcObjectTransformLayerTransformFunction
from rocm.llvm.c.orc cimport LLVMOrcOpaqueIndirectStubsManager
from rocm.llvm.c.orc cimport LLVMOrcOpaqueLazyCallThroughManager
from rocm.llvm.c.orc cimport LLVMOrcOpaqueDumpObjects
from rocm.llvm.c.orc cimport LLVMOrcExecutionSessionLookupHandleResultFunction


from rocm.llvm.c.targetmachine cimport LLVMOpaqueTargetMachineOptions
from rocm.llvm.c.targetmachine cimport LLVMOpaqueTargetMachine
from rocm.llvm.c.targetmachine cimport LLVMTarget


from rocm.llvm.c.types cimport LLVMOpaqueMemoryBuffer
from rocm.llvm.c.types cimport LLVMOpaqueContext
from rocm.llvm.c.types cimport LLVMOpaqueModule
from rocm.llvm.c.types cimport LLVMOpaqueType
from rocm.llvm.c.types cimport LLVMOpaqueValue
from rocm.llvm.c.types cimport LLVMOpaqueBasicBlock
from rocm.llvm.c.types cimport LLVMOpaqueMetadata
from rocm.llvm.c.types cimport LLVMOpaqueNamedMDNode
from rocm.llvm.c.types cimport LLVMOpaqueValueMetadataEntry
from rocm.llvm.c.types cimport LLVMOpaqueBuilder
from rocm.llvm.c.types cimport LLVMOpaqueDIBuilder
from rocm.llvm.c.types cimport LLVMOpaqueModuleProvider
from rocm.llvm.c.types cimport LLVMOpaquePassManager
from rocm.llvm.c.types cimport LLVMOpaqueUse
from rocm.llvm.c.types cimport LLVMOpaqueOperandBundle
from rocm.llvm.c.types cimport LLVMOpaqueAttributeRef
from rocm.llvm.c.types cimport LLVMOpaqueDiagnosticInfo
from rocm.llvm.c.types cimport LLVMComdat
from rocm.llvm.c.types cimport LLVMOpaqueModuleFlagEntry
from rocm.llvm.c.types cimport LLVMOpaqueJITEventListener
from rocm.llvm.c.types cimport LLVMOpaqueBinary


cimport rocm.llvm._util.types
from rocm.llvm.c cimport corcee

cdef class LLVMMemoryManagerCreateContextCallback(rocm.llvm._util.types.Pointer):
    cdef bint _is_ptr_owner

    cdef corcee.LLVMMemoryManagerCreateContextCallback getElementPtr(self)

    @staticmethod
    cdef LLVMMemoryManagerCreateContextCallback fromPtr(void* ptr, bint owner=*)
    @staticmethod
    cdef LLVMMemoryManagerCreateContextCallback fromPyobj(object pyobj)


cdef class LLVMMemoryManagerNotifyTerminatingCallback(rocm.llvm._util.types.Pointer):
    cdef bint _is_ptr_owner

    cdef corcee.LLVMMemoryManagerNotifyTerminatingCallback getElementPtr(self)

    @staticmethod
    cdef LLVMMemoryManagerNotifyTerminatingCallback fromPtr(void* ptr, bint owner=*)
    @staticmethod
    cdef LLVMMemoryManagerNotifyTerminatingCallback fromPyobj(object pyobj)
