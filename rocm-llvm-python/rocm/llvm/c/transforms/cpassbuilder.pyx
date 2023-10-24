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

cimport hip._util.posixloader as loader
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


cdef void* _LLVMRunPasses__funptr = NULL
# 
# Construct and run a set of passes over a module
# 
# This function takes a string with the passes that should be used. The format
# of this string is the same as opt's -passes argument for the new pass
# manager. Individual passes may be specified, separated by commas. Full
# pipelines may also be invoked using `default<O3>` and friends. See opt for
# full reference of the Passes format.
cdef LLVMErrorRef LLVMRunPasses(LLVMModuleRef M,const char * Passes,LLVMTargetMachineRef TM,LLVMPassBuilderOptionsRef Options) nogil:
    global _LLVMRunPasses__funptr
    __init_symbol(&_LLVMRunPasses__funptr,"LLVMRunPasses")
    return (<LLVMErrorRef (*)(LLVMModuleRef,const char *,LLVMTargetMachineRef,LLVMPassBuilderOptionsRef) nogil> _LLVMRunPasses__funptr)(M,Passes,TM,Options)


cdef void* _LLVMCreatePassBuilderOptions__funptr = NULL
# 
# Create a new set of options for a PassBuilder
# 
# Ownership of the returned instance is given to the client, and they are
# responsible for it. The client should call LLVMDisposePassBuilderOptions
# to free the pass builder options.
cdef LLVMPassBuilderOptionsRef LLVMCreatePassBuilderOptions() nogil:
    global _LLVMCreatePassBuilderOptions__funptr
    __init_symbol(&_LLVMCreatePassBuilderOptions__funptr,"LLVMCreatePassBuilderOptions")
    return (<LLVMPassBuilderOptionsRef (*)() nogil> _LLVMCreatePassBuilderOptions__funptr)()


cdef void* _LLVMPassBuilderOptionsSetVerifyEach__funptr = NULL
# 
# Toggle adding the VerifierPass for the PassBuilder, ensuring all functions
# inside the module is valid.
cdef void LLVMPassBuilderOptionsSetVerifyEach(LLVMPassBuilderOptionsRef Options,int VerifyEach) nogil:
    global _LLVMPassBuilderOptionsSetVerifyEach__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetVerifyEach__funptr,"LLVMPassBuilderOptionsSetVerifyEach")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetVerifyEach__funptr)(Options,VerifyEach)


cdef void* _LLVMPassBuilderOptionsSetDebugLogging__funptr = NULL
# 
# Toggle debug logging when running the PassBuilder
cdef void LLVMPassBuilderOptionsSetDebugLogging(LLVMPassBuilderOptionsRef Options,int DebugLogging) nogil:
    global _LLVMPassBuilderOptionsSetDebugLogging__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetDebugLogging__funptr,"LLVMPassBuilderOptionsSetDebugLogging")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetDebugLogging__funptr)(Options,DebugLogging)


cdef void* _LLVMPassBuilderOptionsSetLoopInterleaving__funptr = NULL
cdef void LLVMPassBuilderOptionsSetLoopInterleaving(LLVMPassBuilderOptionsRef Options,int LoopInterleaving) nogil:
    global _LLVMPassBuilderOptionsSetLoopInterleaving__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetLoopInterleaving__funptr,"LLVMPassBuilderOptionsSetLoopInterleaving")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetLoopInterleaving__funptr)(Options,LoopInterleaving)


cdef void* _LLVMPassBuilderOptionsSetLoopVectorization__funptr = NULL
cdef void LLVMPassBuilderOptionsSetLoopVectorization(LLVMPassBuilderOptionsRef Options,int LoopVectorization) nogil:
    global _LLVMPassBuilderOptionsSetLoopVectorization__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetLoopVectorization__funptr,"LLVMPassBuilderOptionsSetLoopVectorization")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetLoopVectorization__funptr)(Options,LoopVectorization)


cdef void* _LLVMPassBuilderOptionsSetSLPVectorization__funptr = NULL
cdef void LLVMPassBuilderOptionsSetSLPVectorization(LLVMPassBuilderOptionsRef Options,int SLPVectorization) nogil:
    global _LLVMPassBuilderOptionsSetSLPVectorization__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetSLPVectorization__funptr,"LLVMPassBuilderOptionsSetSLPVectorization")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetSLPVectorization__funptr)(Options,SLPVectorization)


cdef void* _LLVMPassBuilderOptionsSetLoopUnrolling__funptr = NULL
cdef void LLVMPassBuilderOptionsSetLoopUnrolling(LLVMPassBuilderOptionsRef Options,int LoopUnrolling) nogil:
    global _LLVMPassBuilderOptionsSetLoopUnrolling__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetLoopUnrolling__funptr,"LLVMPassBuilderOptionsSetLoopUnrolling")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetLoopUnrolling__funptr)(Options,LoopUnrolling)


cdef void* _LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll__funptr = NULL
cdef void LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll(LLVMPassBuilderOptionsRef Options,int ForgetAllSCEVInLoopUnroll) nogil:
    global _LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll__funptr,"LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll__funptr)(Options,ForgetAllSCEVInLoopUnroll)


cdef void* _LLVMPassBuilderOptionsSetLicmMssaOptCap__funptr = NULL
cdef void LLVMPassBuilderOptionsSetLicmMssaOptCap(LLVMPassBuilderOptionsRef Options,unsigned int LicmMssaOptCap) nogil:
    global _LLVMPassBuilderOptionsSetLicmMssaOptCap__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetLicmMssaOptCap__funptr,"LLVMPassBuilderOptionsSetLicmMssaOptCap")
    return (<void (*)(LLVMPassBuilderOptionsRef,unsigned int) nogil> _LLVMPassBuilderOptionsSetLicmMssaOptCap__funptr)(Options,LicmMssaOptCap)


cdef void* _LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap__funptr = NULL
cdef void LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap(LLVMPassBuilderOptionsRef Options,unsigned int LicmMssaNoAccForPromotionCap) nogil:
    global _LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap__funptr,"LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap")
    return (<void (*)(LLVMPassBuilderOptionsRef,unsigned int) nogil> _LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap__funptr)(Options,LicmMssaNoAccForPromotionCap)


cdef void* _LLVMPassBuilderOptionsSetCallGraphProfile__funptr = NULL
cdef void LLVMPassBuilderOptionsSetCallGraphProfile(LLVMPassBuilderOptionsRef Options,int CallGraphProfile) nogil:
    global _LLVMPassBuilderOptionsSetCallGraphProfile__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetCallGraphProfile__funptr,"LLVMPassBuilderOptionsSetCallGraphProfile")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetCallGraphProfile__funptr)(Options,CallGraphProfile)


cdef void* _LLVMPassBuilderOptionsSetMergeFunctions__funptr = NULL
cdef void LLVMPassBuilderOptionsSetMergeFunctions(LLVMPassBuilderOptionsRef Options,int MergeFunctions) nogil:
    global _LLVMPassBuilderOptionsSetMergeFunctions__funptr
    __init_symbol(&_LLVMPassBuilderOptionsSetMergeFunctions__funptr,"LLVMPassBuilderOptionsSetMergeFunctions")
    return (<void (*)(LLVMPassBuilderOptionsRef,int) nogil> _LLVMPassBuilderOptionsSetMergeFunctions__funptr)(Options,MergeFunctions)


cdef void* _LLVMDisposePassBuilderOptions__funptr = NULL
# 
# Dispose of a heap-allocated PassBuilderOptions instance
cdef void LLVMDisposePassBuilderOptions(LLVMPassBuilderOptionsRef Options) nogil:
    global _LLVMDisposePassBuilderOptions__funptr
    __init_symbol(&_LLVMDisposePassBuilderOptions__funptr,"LLVMDisposePassBuilderOptions")
    return (<void (*)(LLVMPassBuilderOptionsRef) nogil> _LLVMDisposePassBuilderOptions__funptr)(Options)
