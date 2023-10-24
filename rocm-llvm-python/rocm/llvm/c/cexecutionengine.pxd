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

from libc.stdint cimport *
ctypedef bint _Bool # bool is not a reserved keyword in C, _Bool is
from rocm.llvm.c.ctarget cimport *
from rocm.llvm.c.ctargetmachine cimport *
from rocm.llvm.c.ctypes cimport *
# 
# @defgroup LLVMCExecutionEngine Execution Engine
# @ingroup LLVMC
# 
# @{
cdef void LLVMLinkInMCJIT() nogil



cdef void LLVMLinkInInterpreter() nogil


cdef extern from "llvm-c/ExecutionEngine.h":

    cdef struct LLVMOpaqueGenericValue:
        pass

    ctypedef LLVMOpaqueGenericValue * LLVMGenericValueRef

    cdef struct LLVMOpaqueExecutionEngine:
        pass

    ctypedef LLVMOpaqueExecutionEngine * LLVMExecutionEngineRef

    cdef struct LLVMOpaqueMCJITMemoryManager:
        pass

    ctypedef LLVMOpaqueMCJITMemoryManager * LLVMMCJITMemoryManagerRef

    cdef struct LLVMMCJITCompilerOptions:
        unsigned int OptLevel
        LLVMCodeModel CodeModel
        int NoFramePointerElim
        int EnableFastISel
        LLVMMCJITMemoryManagerRef MCJMM


cdef LLVMGenericValueRef LLVMCreateGenericValueOfInt(LLVMTypeRef Ty,unsigned long long N,int IsSigned) nogil



cdef LLVMGenericValueRef LLVMCreateGenericValueOfPointer(void * P) nogil



cdef LLVMGenericValueRef LLVMCreateGenericValueOfFloat(LLVMTypeRef Ty,double N) nogil



cdef unsigned int LLVMGenericValueIntWidth(LLVMGenericValueRef GenValRef) nogil



cdef unsigned long long LLVMGenericValueToInt(LLVMGenericValueRef GenVal,int IsSigned) nogil



cdef void * LLVMGenericValueToPointer(LLVMGenericValueRef GenVal) nogil



cdef double LLVMGenericValueToFloat(LLVMTypeRef TyRef,LLVMGenericValueRef GenVal) nogil



cdef void LLVMDisposeGenericValue(LLVMGenericValueRef GenVal) nogil



cdef int LLVMCreateExecutionEngineForModule(LLVMExecutionEngineRef* OutEE,LLVMModuleRef M,char ** OutError) nogil



cdef int LLVMCreateInterpreterForModule(LLVMExecutionEngineRef* OutInterp,LLVMModuleRef M,char ** OutError) nogil



cdef int LLVMCreateJITCompilerForModule(LLVMExecutionEngineRef* OutJIT,LLVMModuleRef M,unsigned int OptLevel,char ** OutError) nogil



cdef void LLVMInitializeMCJITCompilerOptions(LLVMMCJITCompilerOptions * Options,unsigned long SizeOfOptions) nogil


# 
# Create an MCJIT execution engine for a module, with the given options. It is
# the responsibility of the caller to ensure that all fields in Options up to
# the given SizeOfOptions are initialized. It is correct to pass a smaller
# value of SizeOfOptions that omits some fields. The canonical way of using
# this is:
# 
# LLVMMCJITCompilerOptions options;
# LLVMInitializeMCJITCompilerOptions(&options, sizeof(options));
# ... fill in those options you care about
# LLVMCreateMCJITCompilerForModule(&jit, mod, &options, sizeof(options),
#                                  &error);
# 
# Note that this is also correct, though possibly suboptimal:
# 
# LLVMCreateMCJITCompilerForModule(&jit, mod, 0, 0, &error);
cdef int LLVMCreateMCJITCompilerForModule(LLVMExecutionEngineRef* OutJIT,LLVMModuleRef M,LLVMMCJITCompilerOptions * Options,unsigned long SizeOfOptions,char ** OutError) nogil



cdef void LLVMDisposeExecutionEngine(LLVMExecutionEngineRef EE) nogil



cdef void LLVMRunStaticConstructors(LLVMExecutionEngineRef EE) nogil



cdef void LLVMRunStaticDestructors(LLVMExecutionEngineRef EE) nogil



cdef int LLVMRunFunctionAsMain(LLVMExecutionEngineRef EE,LLVMValueRef F,unsigned int ArgC,const char *const * ArgV,const char *const * EnvP) nogil



cdef LLVMGenericValueRef LLVMRunFunction(LLVMExecutionEngineRef EE,LLVMValueRef F,unsigned int NumArgs,LLVMGenericValueRef* Args) nogil



cdef void LLVMFreeMachineCodeForFunction(LLVMExecutionEngineRef EE,LLVMValueRef F) nogil



cdef void LLVMAddModule(LLVMExecutionEngineRef EE,LLVMModuleRef M) nogil



cdef int LLVMRemoveModule(LLVMExecutionEngineRef EE,LLVMModuleRef M,LLVMModuleRef* OutMod,char ** OutError) nogil



cdef int LLVMFindFunction(LLVMExecutionEngineRef EE,const char * Name,LLVMValueRef* OutFn) nogil



cdef void * LLVMRecompileAndRelinkFunction(LLVMExecutionEngineRef EE,LLVMValueRef Fn) nogil



cdef LLVMTargetDataRef LLVMGetExecutionEngineTargetData(LLVMExecutionEngineRef EE) nogil



cdef LLVMTargetMachineRef LLVMGetExecutionEngineTargetMachine(LLVMExecutionEngineRef EE) nogil



cdef void LLVMAddGlobalMapping(LLVMExecutionEngineRef EE,LLVMValueRef Global,void * Addr) nogil



cdef void * LLVMGetPointerToGlobal(LLVMExecutionEngineRef EE,LLVMValueRef Global) nogil



cdef unsigned long LLVMGetGlobalValueAddress(LLVMExecutionEngineRef EE,const char * Name) nogil



cdef unsigned long LLVMGetFunctionAddress(LLVMExecutionEngineRef EE,const char * Name) nogil


# Returns true on error, false on success. If true is returned then the error
# message is copied to OutStr and cleared in the ExecutionEngine instance.
cdef int LLVMExecutionEngineGetErrMsg(LLVMExecutionEngineRef EE,char ** OutError) nogil


cdef extern from "llvm-c/ExecutionEngine.h":

    ctypedef unsigned char * (*LLVMMemoryManagerAllocateCodeSectionCallback) (void *,unsigned long,unsigned int,unsigned int,const char *)

    ctypedef unsigned char * (*LLVMMemoryManagerAllocateDataSectionCallback) (void *,unsigned long,unsigned int,unsigned int,const char *,int)

    ctypedef LLVMBool (*LLVMMemoryManagerFinalizeMemoryCallback) (void *,char **)

    ctypedef void (*LLVMMemoryManagerDestroyCallback) (void *)

# 
# Create a simple custom MCJIT memory manager. This memory manager can
# intercept allocations in a module-oblivious way. This will return NULL
# if any of the passed functions are NULL.
# 
# @param Opaque An opaque client object to pass back to the callbacks.
# @param AllocateCodeSection Allocate a block of memory for executable code.
# @param AllocateDataSection Allocate a block of memory for data.
# @param FinalizeMemory Set page permissions and flush cache. Return 0 on
#   success, 1 on error.
cdef LLVMMCJITMemoryManagerRef LLVMCreateSimpleMCJITMemoryManager(void * Opaque,LLVMMemoryManagerAllocateCodeSectionCallback AllocateCodeSection,LLVMMemoryManagerAllocateDataSectionCallback AllocateDataSection,LLVMMemoryManagerFinalizeMemoryCallback FinalizeMemory,LLVMMemoryManagerDestroyCallback Destroy)



cdef void LLVMDisposeMCJITMemoryManager(LLVMMCJITMemoryManagerRef MM) nogil



cdef LLVMJITEventListenerRef LLVMCreateGDBRegistrationListener() nogil



cdef LLVMJITEventListenerRef LLVMCreateIntelJITEventListener() nogil



cdef LLVMJITEventListenerRef LLVMCreateOProfileJITEventListener() nogil



cdef LLVMJITEventListenerRef LLVMCreatePerfJITEventListener() nogil
