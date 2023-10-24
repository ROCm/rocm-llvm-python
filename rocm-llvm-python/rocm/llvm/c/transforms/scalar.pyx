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

from rocm.llvm.c.types import LLVMBool
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
def LLVMAddAggressiveDCEPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createAggressiveDCEPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddAggressiveDCEPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddDCEPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createDeadCodeEliminationPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddDCEPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddBitTrackingDCEPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createBitTrackingDCEPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddBitTrackingDCEPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddAlignmentFromAssumptionsPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createAlignmentFromAssumptionsPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddAlignmentFromAssumptionsPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddCFGSimplificationPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createCFGSimplificationPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddCFGSimplificationPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddDeadStoreEliminationPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createDeadStoreEliminationPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddDeadStoreEliminationPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddScalarizerPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createScalarizerPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddScalarizerPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddMergedLoadStoreMotionPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createMergedLoadStoreMotionPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddMergedLoadStoreMotionPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddGVNPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createGVNPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddGVNPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddNewGVNPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createGVNPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddNewGVNPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddIndVarSimplifyPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createIndVarSimplifyPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddIndVarSimplifyPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddInstructionCombiningPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createInstructionCombiningPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddInstructionCombiningPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddInstructionSimplifyPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createInstSimplifyLegacyPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddInstructionSimplifyPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddJumpThreadingPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createJumpThreadingPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddJumpThreadingPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLICMPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLICMPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLICMPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLoopDeletionPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLoopDeletionPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLoopDeletionPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLoopIdiomPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLoopIdiomPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLoopIdiomPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLoopRotatePass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLoopRotatePass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLoopRotatePass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLoopRerollPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLoopRerollPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLoopRerollPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLoopUnrollPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLoopUnrollPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLoopUnrollPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLoopUnrollAndJamPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLoopUnrollAndJamPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLoopUnrollAndJamPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLowerAtomicPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLowerAtomicPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLowerAtomicPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddMemCpyOptPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createMemCpyOptPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddMemCpyOptPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddPartiallyInlineLibCallsPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createPartiallyInlineLibCallsPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddPartiallyInlineLibCallsPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddReassociatePass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createReassociatePass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddReassociatePass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddSCCPPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createSCCPPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddSCCPPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddScalarReplAggregatesPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createSROAPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddScalarReplAggregatesPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddScalarReplAggregatesPassSSA(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createSROAPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddScalarReplAggregatesPassSSA(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddScalarReplAggregatesPassWithThreshold(object PM, int Threshold):
    r"""(No short description, might be part of a group.)

    See llvm`~.createSROAPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)

        Threshold (`~.int`):
            (undocumented)
    """
    cscalar.LLVMAddScalarReplAggregatesPassWithThreshold(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr,Threshold)    # fully specified


@cython.embedsignature(True)
def LLVMAddSimplifyLibCallsPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createSimplifyLibCallsPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddSimplifyLibCallsPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddTailCallEliminationPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createTailCallEliminationPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddTailCallEliminationPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddDemoteMemoryToRegisterPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.demotePromoteMemoryToRegisterPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddDemoteMemoryToRegisterPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddVerifierPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createVerifierPass` function. */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddVerifierPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddCorrelatedValuePropagationPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createCorrelatedValuePropagationPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddCorrelatedValuePropagationPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddEarlyCSEPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createEarlyCSEPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddEarlyCSEPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddEarlyCSEMemSSAPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createEarlyCSEPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddEarlyCSEMemSSAPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLowerExpectIntrinsicPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLowerExpectIntrinsicPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLowerExpectIntrinsicPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddLowerConstantIntrinsicsPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createLowerConstantIntrinsicsPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddLowerConstantIntrinsicsPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddTypeBasedAliasAnalysisPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createTypeBasedAliasAnalysisPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddTypeBasedAliasAnalysisPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddScopedNoAliasAAPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createScopedNoAliasAAPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddScopedNoAliasAAPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddBasicAliasAnalysisPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createBasicAliasAnalysisPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddBasicAliasAnalysisPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified


@cython.embedsignature(True)
def LLVMAddUnifyFunctionExitNodesPass(object PM):
    r"""(No short description, might be part of a group.)

    See llvm`~.createUnifyFunctionExitNodesPass` function */

    Args:
        PM (`~.LLVMOpaquePassManager`/`~.object`):
            (undocumented)
    """
    cscalar.LLVMAddUnifyFunctionExitNodesPass(
        LLVMOpaquePassManager.from_pyobj(PM)._ptr)    # fully specified

__all__ = [
    "LLVMAddAggressiveDCEPass",
    "LLVMAddDCEPass",
    "LLVMAddBitTrackingDCEPass",
    "LLVMAddAlignmentFromAssumptionsPass",
    "LLVMAddCFGSimplificationPass",
    "LLVMAddDeadStoreEliminationPass",
    "LLVMAddScalarizerPass",
    "LLVMAddMergedLoadStoreMotionPass",
    "LLVMAddGVNPass",
    "LLVMAddNewGVNPass",
    "LLVMAddIndVarSimplifyPass",
    "LLVMAddInstructionCombiningPass",
    "LLVMAddInstructionSimplifyPass",
    "LLVMAddJumpThreadingPass",
    "LLVMAddLICMPass",
    "LLVMAddLoopDeletionPass",
    "LLVMAddLoopIdiomPass",
    "LLVMAddLoopRotatePass",
    "LLVMAddLoopRerollPass",
    "LLVMAddLoopUnrollPass",
    "LLVMAddLoopUnrollAndJamPass",
    "LLVMAddLowerAtomicPass",
    "LLVMAddMemCpyOptPass",
    "LLVMAddPartiallyInlineLibCallsPass",
    "LLVMAddReassociatePass",
    "LLVMAddSCCPPass",
    "LLVMAddScalarReplAggregatesPass",
    "LLVMAddScalarReplAggregatesPassSSA",
    "LLVMAddScalarReplAggregatesPassWithThreshold",
    "LLVMAddSimplifyLibCallsPass",
    "LLVMAddTailCallEliminationPass",
    "LLVMAddDemoteMemoryToRegisterPass",
    "LLVMAddVerifierPass",
    "LLVMAddCorrelatedValuePropagationPass",
    "LLVMAddEarlyCSEPass",
    "LLVMAddEarlyCSEMemSSAPass",
    "LLVMAddLowerExpectIntrinsicPass",
    "LLVMAddLowerConstantIntrinsicsPass",
    "LLVMAddTypeBasedAliasAnalysisPass",
    "LLVMAddScopedNoAliasAAPass",
    "LLVMAddBasicAliasAnalysisPass",
    "LLVMAddUnifyFunctionExitNodesPass",
]