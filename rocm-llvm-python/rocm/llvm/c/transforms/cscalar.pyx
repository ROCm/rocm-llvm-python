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

cimport rocm.llvm._util.posixloader as loader
cdef void* _lib_handle = NULL

cdef void __init() nogil:
    global _lib_handle
    if _lib_handle == NULL:
        with gil:
            _lib_handle = loader.open_library("librocmllvm.so")

cdef void __init_symbol(void** result, const char* name) nogil:
    global _lib_handle
    if _lib_handle == NULL:
        __init()
    if result[0] == NULL:
        with gil:
            result[0] = loader.load_symbol(_lib_handle, name) 


cdef void* _LLVMAddAggressiveDCEPass__funptr = NULL
# See llvm::createAggressiveDCEPass function. */
cdef void LLVMAddAggressiveDCEPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddAggressiveDCEPass__funptr
    __init_symbol(&_LLVMAddAggressiveDCEPass__funptr,"LLVMAddAggressiveDCEPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddAggressiveDCEPass__funptr)(PM)


cdef void* _LLVMAddDCEPass__funptr = NULL
# See llvm::createDeadCodeEliminationPass function. */
cdef void LLVMAddDCEPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddDCEPass__funptr
    __init_symbol(&_LLVMAddDCEPass__funptr,"LLVMAddDCEPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddDCEPass__funptr)(PM)


cdef void* _LLVMAddBitTrackingDCEPass__funptr = NULL
# See llvm::createBitTrackingDCEPass function. */
cdef void LLVMAddBitTrackingDCEPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddBitTrackingDCEPass__funptr
    __init_symbol(&_LLVMAddBitTrackingDCEPass__funptr,"LLVMAddBitTrackingDCEPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddBitTrackingDCEPass__funptr)(PM)


cdef void* _LLVMAddAlignmentFromAssumptionsPass__funptr = NULL
# See llvm::createAlignmentFromAssumptionsPass function. */
cdef void LLVMAddAlignmentFromAssumptionsPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddAlignmentFromAssumptionsPass__funptr
    __init_symbol(&_LLVMAddAlignmentFromAssumptionsPass__funptr,"LLVMAddAlignmentFromAssumptionsPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddAlignmentFromAssumptionsPass__funptr)(PM)


cdef void* _LLVMAddCFGSimplificationPass__funptr = NULL
# See llvm::createCFGSimplificationPass function. */
cdef void LLVMAddCFGSimplificationPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddCFGSimplificationPass__funptr
    __init_symbol(&_LLVMAddCFGSimplificationPass__funptr,"LLVMAddCFGSimplificationPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddCFGSimplificationPass__funptr)(PM)


cdef void* _LLVMAddDeadStoreEliminationPass__funptr = NULL
# See llvm::createDeadStoreEliminationPass function. */
cdef void LLVMAddDeadStoreEliminationPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddDeadStoreEliminationPass__funptr
    __init_symbol(&_LLVMAddDeadStoreEliminationPass__funptr,"LLVMAddDeadStoreEliminationPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddDeadStoreEliminationPass__funptr)(PM)


cdef void* _LLVMAddScalarizerPass__funptr = NULL
# See llvm::createScalarizerPass function. */
cdef void LLVMAddScalarizerPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddScalarizerPass__funptr
    __init_symbol(&_LLVMAddScalarizerPass__funptr,"LLVMAddScalarizerPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddScalarizerPass__funptr)(PM)


cdef void* _LLVMAddMergedLoadStoreMotionPass__funptr = NULL
# See llvm::createMergedLoadStoreMotionPass function. */
cdef void LLVMAddMergedLoadStoreMotionPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddMergedLoadStoreMotionPass__funptr
    __init_symbol(&_LLVMAddMergedLoadStoreMotionPass__funptr,"LLVMAddMergedLoadStoreMotionPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddMergedLoadStoreMotionPass__funptr)(PM)


cdef void* _LLVMAddGVNPass__funptr = NULL
# See llvm::createGVNPass function. */
cdef void LLVMAddGVNPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddGVNPass__funptr
    __init_symbol(&_LLVMAddGVNPass__funptr,"LLVMAddGVNPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddGVNPass__funptr)(PM)


cdef void* _LLVMAddNewGVNPass__funptr = NULL
# See llvm::createGVNPass function. */
cdef void LLVMAddNewGVNPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddNewGVNPass__funptr
    __init_symbol(&_LLVMAddNewGVNPass__funptr,"LLVMAddNewGVNPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddNewGVNPass__funptr)(PM)


cdef void* _LLVMAddIndVarSimplifyPass__funptr = NULL
# See llvm::createIndVarSimplifyPass function. */
cdef void LLVMAddIndVarSimplifyPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddIndVarSimplifyPass__funptr
    __init_symbol(&_LLVMAddIndVarSimplifyPass__funptr,"LLVMAddIndVarSimplifyPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddIndVarSimplifyPass__funptr)(PM)


cdef void* _LLVMAddInstructionCombiningPass__funptr = NULL
# See llvm::createInstructionCombiningPass function. */
cdef void LLVMAddInstructionCombiningPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddInstructionCombiningPass__funptr
    __init_symbol(&_LLVMAddInstructionCombiningPass__funptr,"LLVMAddInstructionCombiningPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddInstructionCombiningPass__funptr)(PM)


cdef void* _LLVMAddInstructionSimplifyPass__funptr = NULL
# See llvm::createInstSimplifyLegacyPass function. */
cdef void LLVMAddInstructionSimplifyPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddInstructionSimplifyPass__funptr
    __init_symbol(&_LLVMAddInstructionSimplifyPass__funptr,"LLVMAddInstructionSimplifyPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddInstructionSimplifyPass__funptr)(PM)


cdef void* _LLVMAddJumpThreadingPass__funptr = NULL
# See llvm::createJumpThreadingPass function. */
cdef void LLVMAddJumpThreadingPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddJumpThreadingPass__funptr
    __init_symbol(&_LLVMAddJumpThreadingPass__funptr,"LLVMAddJumpThreadingPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddJumpThreadingPass__funptr)(PM)


cdef void* _LLVMAddLICMPass__funptr = NULL
# See llvm::createLICMPass function. */
cdef void LLVMAddLICMPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLICMPass__funptr
    __init_symbol(&_LLVMAddLICMPass__funptr,"LLVMAddLICMPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLICMPass__funptr)(PM)


cdef void* _LLVMAddLoopDeletionPass__funptr = NULL
# See llvm::createLoopDeletionPass function. */
cdef void LLVMAddLoopDeletionPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLoopDeletionPass__funptr
    __init_symbol(&_LLVMAddLoopDeletionPass__funptr,"LLVMAddLoopDeletionPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLoopDeletionPass__funptr)(PM)


cdef void* _LLVMAddLoopIdiomPass__funptr = NULL
# See llvm::createLoopIdiomPass function */
cdef void LLVMAddLoopIdiomPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLoopIdiomPass__funptr
    __init_symbol(&_LLVMAddLoopIdiomPass__funptr,"LLVMAddLoopIdiomPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLoopIdiomPass__funptr)(PM)


cdef void* _LLVMAddLoopRotatePass__funptr = NULL
# See llvm::createLoopRotatePass function. */
cdef void LLVMAddLoopRotatePass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLoopRotatePass__funptr
    __init_symbol(&_LLVMAddLoopRotatePass__funptr,"LLVMAddLoopRotatePass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLoopRotatePass__funptr)(PM)


cdef void* _LLVMAddLoopRerollPass__funptr = NULL
# See llvm::createLoopRerollPass function. */
cdef void LLVMAddLoopRerollPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLoopRerollPass__funptr
    __init_symbol(&_LLVMAddLoopRerollPass__funptr,"LLVMAddLoopRerollPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLoopRerollPass__funptr)(PM)


cdef void* _LLVMAddLoopUnrollPass__funptr = NULL
# See llvm::createLoopUnrollPass function. */
cdef void LLVMAddLoopUnrollPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLoopUnrollPass__funptr
    __init_symbol(&_LLVMAddLoopUnrollPass__funptr,"LLVMAddLoopUnrollPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLoopUnrollPass__funptr)(PM)


cdef void* _LLVMAddLoopUnrollAndJamPass__funptr = NULL
# See llvm::createLoopUnrollAndJamPass function. */
cdef void LLVMAddLoopUnrollAndJamPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLoopUnrollAndJamPass__funptr
    __init_symbol(&_LLVMAddLoopUnrollAndJamPass__funptr,"LLVMAddLoopUnrollAndJamPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLoopUnrollAndJamPass__funptr)(PM)


cdef void* _LLVMAddLowerAtomicPass__funptr = NULL
# See llvm::createLowerAtomicPass function. */
cdef void LLVMAddLowerAtomicPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLowerAtomicPass__funptr
    __init_symbol(&_LLVMAddLowerAtomicPass__funptr,"LLVMAddLowerAtomicPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLowerAtomicPass__funptr)(PM)


cdef void* _LLVMAddMemCpyOptPass__funptr = NULL
# See llvm::createMemCpyOptPass function. */
cdef void LLVMAddMemCpyOptPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddMemCpyOptPass__funptr
    __init_symbol(&_LLVMAddMemCpyOptPass__funptr,"LLVMAddMemCpyOptPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddMemCpyOptPass__funptr)(PM)


cdef void* _LLVMAddPartiallyInlineLibCallsPass__funptr = NULL
# See llvm::createPartiallyInlineLibCallsPass function. */
cdef void LLVMAddPartiallyInlineLibCallsPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddPartiallyInlineLibCallsPass__funptr
    __init_symbol(&_LLVMAddPartiallyInlineLibCallsPass__funptr,"LLVMAddPartiallyInlineLibCallsPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddPartiallyInlineLibCallsPass__funptr)(PM)


cdef void* _LLVMAddReassociatePass__funptr = NULL
# See llvm::createReassociatePass function. */
cdef void LLVMAddReassociatePass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddReassociatePass__funptr
    __init_symbol(&_LLVMAddReassociatePass__funptr,"LLVMAddReassociatePass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddReassociatePass__funptr)(PM)


cdef void* _LLVMAddSCCPPass__funptr = NULL
# See llvm::createSCCPPass function. */
cdef void LLVMAddSCCPPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddSCCPPass__funptr
    __init_symbol(&_LLVMAddSCCPPass__funptr,"LLVMAddSCCPPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddSCCPPass__funptr)(PM)


cdef void* _LLVMAddScalarReplAggregatesPass__funptr = NULL
# See llvm::createSROAPass function. */
cdef void LLVMAddScalarReplAggregatesPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddScalarReplAggregatesPass__funptr
    __init_symbol(&_LLVMAddScalarReplAggregatesPass__funptr,"LLVMAddScalarReplAggregatesPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddScalarReplAggregatesPass__funptr)(PM)


cdef void* _LLVMAddScalarReplAggregatesPassSSA__funptr = NULL
# See llvm::createSROAPass function. */
cdef void LLVMAddScalarReplAggregatesPassSSA(LLVMPassManagerRef PM) nogil:
    global _LLVMAddScalarReplAggregatesPassSSA__funptr
    __init_symbol(&_LLVMAddScalarReplAggregatesPassSSA__funptr,"LLVMAddScalarReplAggregatesPassSSA")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddScalarReplAggregatesPassSSA__funptr)(PM)


cdef void* _LLVMAddScalarReplAggregatesPassWithThreshold__funptr = NULL
# See llvm::createSROAPass function. */
cdef void LLVMAddScalarReplAggregatesPassWithThreshold(LLVMPassManagerRef PM,int Threshold) nogil:
    global _LLVMAddScalarReplAggregatesPassWithThreshold__funptr
    __init_symbol(&_LLVMAddScalarReplAggregatesPassWithThreshold__funptr,"LLVMAddScalarReplAggregatesPassWithThreshold")
    (<void (*)(LLVMPassManagerRef,int) nogil> _LLVMAddScalarReplAggregatesPassWithThreshold__funptr)(PM,Threshold)


cdef void* _LLVMAddSimplifyLibCallsPass__funptr = NULL
# See llvm::createSimplifyLibCallsPass function. */
cdef void LLVMAddSimplifyLibCallsPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddSimplifyLibCallsPass__funptr
    __init_symbol(&_LLVMAddSimplifyLibCallsPass__funptr,"LLVMAddSimplifyLibCallsPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddSimplifyLibCallsPass__funptr)(PM)


cdef void* _LLVMAddTailCallEliminationPass__funptr = NULL
# See llvm::createTailCallEliminationPass function. */
cdef void LLVMAddTailCallEliminationPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddTailCallEliminationPass__funptr
    __init_symbol(&_LLVMAddTailCallEliminationPass__funptr,"LLVMAddTailCallEliminationPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddTailCallEliminationPass__funptr)(PM)


cdef void* _LLVMAddDemoteMemoryToRegisterPass__funptr = NULL
# See llvm::demotePromoteMemoryToRegisterPass function. */
cdef void LLVMAddDemoteMemoryToRegisterPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddDemoteMemoryToRegisterPass__funptr
    __init_symbol(&_LLVMAddDemoteMemoryToRegisterPass__funptr,"LLVMAddDemoteMemoryToRegisterPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddDemoteMemoryToRegisterPass__funptr)(PM)


cdef void* _LLVMAddVerifierPass__funptr = NULL
# See llvm::createVerifierPass function. */
cdef void LLVMAddVerifierPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddVerifierPass__funptr
    __init_symbol(&_LLVMAddVerifierPass__funptr,"LLVMAddVerifierPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddVerifierPass__funptr)(PM)


cdef void* _LLVMAddCorrelatedValuePropagationPass__funptr = NULL
# See llvm::createCorrelatedValuePropagationPass function */
cdef void LLVMAddCorrelatedValuePropagationPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddCorrelatedValuePropagationPass__funptr
    __init_symbol(&_LLVMAddCorrelatedValuePropagationPass__funptr,"LLVMAddCorrelatedValuePropagationPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddCorrelatedValuePropagationPass__funptr)(PM)


cdef void* _LLVMAddEarlyCSEPass__funptr = NULL
# See llvm::createEarlyCSEPass function */
cdef void LLVMAddEarlyCSEPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddEarlyCSEPass__funptr
    __init_symbol(&_LLVMAddEarlyCSEPass__funptr,"LLVMAddEarlyCSEPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddEarlyCSEPass__funptr)(PM)


cdef void* _LLVMAddEarlyCSEMemSSAPass__funptr = NULL
# See llvm::createEarlyCSEPass function */
cdef void LLVMAddEarlyCSEMemSSAPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddEarlyCSEMemSSAPass__funptr
    __init_symbol(&_LLVMAddEarlyCSEMemSSAPass__funptr,"LLVMAddEarlyCSEMemSSAPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddEarlyCSEMemSSAPass__funptr)(PM)


cdef void* _LLVMAddLowerExpectIntrinsicPass__funptr = NULL
# See llvm::createLowerExpectIntrinsicPass function */
cdef void LLVMAddLowerExpectIntrinsicPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLowerExpectIntrinsicPass__funptr
    __init_symbol(&_LLVMAddLowerExpectIntrinsicPass__funptr,"LLVMAddLowerExpectIntrinsicPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLowerExpectIntrinsicPass__funptr)(PM)


cdef void* _LLVMAddLowerConstantIntrinsicsPass__funptr = NULL
# See llvm::createLowerConstantIntrinsicsPass function */
cdef void LLVMAddLowerConstantIntrinsicsPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddLowerConstantIntrinsicsPass__funptr
    __init_symbol(&_LLVMAddLowerConstantIntrinsicsPass__funptr,"LLVMAddLowerConstantIntrinsicsPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddLowerConstantIntrinsicsPass__funptr)(PM)


cdef void* _LLVMAddTypeBasedAliasAnalysisPass__funptr = NULL
# See llvm::createTypeBasedAliasAnalysisPass function */
cdef void LLVMAddTypeBasedAliasAnalysisPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddTypeBasedAliasAnalysisPass__funptr
    __init_symbol(&_LLVMAddTypeBasedAliasAnalysisPass__funptr,"LLVMAddTypeBasedAliasAnalysisPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddTypeBasedAliasAnalysisPass__funptr)(PM)


cdef void* _LLVMAddScopedNoAliasAAPass__funptr = NULL
# See llvm::createScopedNoAliasAAPass function */
cdef void LLVMAddScopedNoAliasAAPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddScopedNoAliasAAPass__funptr
    __init_symbol(&_LLVMAddScopedNoAliasAAPass__funptr,"LLVMAddScopedNoAliasAAPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddScopedNoAliasAAPass__funptr)(PM)


cdef void* _LLVMAddBasicAliasAnalysisPass__funptr = NULL
# See llvm::createBasicAliasAnalysisPass function */
cdef void LLVMAddBasicAliasAnalysisPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddBasicAliasAnalysisPass__funptr
    __init_symbol(&_LLVMAddBasicAliasAnalysisPass__funptr,"LLVMAddBasicAliasAnalysisPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddBasicAliasAnalysisPass__funptr)(PM)


cdef void* _LLVMAddUnifyFunctionExitNodesPass__funptr = NULL
# See llvm::createUnifyFunctionExitNodesPass function */
cdef void LLVMAddUnifyFunctionExitNodesPass(LLVMPassManagerRef PM) nogil:
    global _LLVMAddUnifyFunctionExitNodesPass__funptr
    __init_symbol(&_LLVMAddUnifyFunctionExitNodesPass__funptr,"LLVMAddUnifyFunctionExitNodesPass")
    (<void (*)(LLVMPassManagerRef) nogil> _LLVMAddUnifyFunctionExitNodesPass__funptr)(PM)
