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

cimport rocm.llvm._util.posixloader as loader
cdef void* _lib_handle = NULL

DLL = b"librocmllvm.so"

cdef int __init() except 1 nogil:
    global DLL
    global _lib_handle
    cdef char* dll = NULL
    if _lib_handle == NULL:
        with gil:
            dll = DLL
        return loader.open_library(&_lib_handle,dll)
    return 0

cdef int __init_symbol(void** result, const char* name) except 1 nogil:
    global _lib_handle
    cdef int init_result = 0
    if _lib_handle == NULL:
        init_result = __init()
        if init_result > 0:
            return init_result
    if result[0] == NULL:
        return loader.load_symbol(result,_lib_handle, name)
    return 0


cdef void* _LLVMOrcCreateLLJITBuilder__funptr = NULL
# 
# Create an LLVMOrcLLJITBuilder.
# 
# The client owns the resulting LLJITBuilder and should dispose of it using
# LLVMOrcDisposeLLJITBuilder once they are done with it.
cdef LLVMOrcLLJITBuilderRef LLVMOrcCreateLLJITBuilder():
    global _LLVMOrcCreateLLJITBuilder__funptr
    if __init_symbol(&_LLVMOrcCreateLLJITBuilder__funptr,"LLVMOrcCreateLLJITBuilder") > 0:
        pass
    return (<LLVMOrcLLJITBuilderRef (*)() noexcept nogil> _LLVMOrcCreateLLJITBuilder__funptr)()


cdef void* _LLVMOrcDisposeLLJITBuilder__funptr = NULL
# 
# Dispose of an LLVMOrcLLJITBuilderRef. This should only be called if ownership
# has not been passed to LLVMOrcCreateLLJIT (e.g. because some error prevented
# that function from being called).
cdef void LLVMOrcDisposeLLJITBuilder(LLVMOrcLLJITBuilderRef Builder):
    global _LLVMOrcDisposeLLJITBuilder__funptr
    if __init_symbol(&_LLVMOrcDisposeLLJITBuilder__funptr,"LLVMOrcDisposeLLJITBuilder") > 0:
        pass
    (<void (*)(LLVMOrcLLJITBuilderRef) noexcept nogil> _LLVMOrcDisposeLLJITBuilder__funptr)(Builder)


cdef void* _LLVMOrcLLJITBuilderSetJITTargetMachineBuilder__funptr = NULL
# 
# Set the JITTargetMachineBuilder to be used when constructing the LLJIT
# instance. Calling this function is optional: if it is not called then the
# LLJITBuilder will use JITTargeTMachineBuilder::detectHost to construct a
# JITTargetMachineBuilder.
# 
# This function takes ownership of the JTMB argument: clients should not
# dispose of the JITTargetMachineBuilder after calling this function.
cdef void LLVMOrcLLJITBuilderSetJITTargetMachineBuilder(LLVMOrcLLJITBuilderRef Builder,LLVMOrcJITTargetMachineBuilderRef JTMB):
    global _LLVMOrcLLJITBuilderSetJITTargetMachineBuilder__funptr
    if __init_symbol(&_LLVMOrcLLJITBuilderSetJITTargetMachineBuilder__funptr,"LLVMOrcLLJITBuilderSetJITTargetMachineBuilder") > 0:
        pass
    (<void (*)(LLVMOrcLLJITBuilderRef,LLVMOrcJITTargetMachineBuilderRef) noexcept nogil> _LLVMOrcLLJITBuilderSetJITTargetMachineBuilder__funptr)(Builder,JTMB)


cdef void* _LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator__funptr = NULL
# 
# Set an ObjectLinkingLayer creator function for this LLJIT instance.
cdef void LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator(LLVMOrcLLJITBuilderRef Builder,LLVMOrcLLJITBuilderObjectLinkingLayerCreatorFunction F,void * Ctx):
    global _LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator__funptr
    if __init_symbol(&_LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator__funptr,"LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator") > 0:
        pass
    (<void (*)(LLVMOrcLLJITBuilderRef,LLVMOrcLLJITBuilderObjectLinkingLayerCreatorFunction,void *) noexcept nogil> _LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator__funptr)(Builder,F,Ctx)


cdef void* _LLVMOrcCreateLLJIT__funptr = NULL
# 
# Create an LLJIT instance from an LLJITBuilder.
# 
# This operation takes ownership of the Builder argument: clients should not
# dispose of the builder after calling this function (even if the function
# returns an error). If a null Builder argument is provided then a
# default-constructed LLJITBuilder will be used.
# 
# On success the resulting LLJIT instance is uniquely owned by the client and
# automatically manages the memory of all JIT'd code and all modules that are
# transferred to it (e.g. via LLVMOrcLLJITAddLLVMIRModule). Disposing of the
# LLJIT instance will free all memory managed by the JIT, including JIT'd code
# and not-yet compiled modules.
cdef LLVMErrorRef LLVMOrcCreateLLJIT(LLVMOrcLLJITRef* Result,LLVMOrcLLJITBuilderRef Builder):
    global _LLVMOrcCreateLLJIT__funptr
    if __init_symbol(&_LLVMOrcCreateLLJIT__funptr,"LLVMOrcCreateLLJIT") > 0:
        pass
    return (<LLVMErrorRef (*)(LLVMOrcLLJITRef*,LLVMOrcLLJITBuilderRef) noexcept nogil> _LLVMOrcCreateLLJIT__funptr)(Result,Builder)


cdef void* _LLVMOrcDisposeLLJIT__funptr = NULL
# 
# Dispose of an LLJIT instance.
cdef LLVMErrorRef LLVMOrcDisposeLLJIT(LLVMOrcLLJITRef J):
    global _LLVMOrcDisposeLLJIT__funptr
    if __init_symbol(&_LLVMOrcDisposeLLJIT__funptr,"LLVMOrcDisposeLLJIT") > 0:
        pass
    return (<LLVMErrorRef (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcDisposeLLJIT__funptr)(J)


cdef void* _LLVMOrcLLJITGetExecutionSession__funptr = NULL
# 
# Get a reference to the ExecutionSession for this LLJIT instance.
# 
# The ExecutionSession is owned by the LLJIT instance. The client is not
# responsible for managing its memory.
cdef LLVMOrcExecutionSessionRef LLVMOrcLLJITGetExecutionSession(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITGetExecutionSession__funptr
    if __init_symbol(&_LLVMOrcLLJITGetExecutionSession__funptr,"LLVMOrcLLJITGetExecutionSession") > 0:
        pass
    return (<LLVMOrcExecutionSessionRef (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITGetExecutionSession__funptr)(J)


cdef void* _LLVMOrcLLJITGetMainJITDylib__funptr = NULL
# 
# Return a reference to the Main JITDylib.
# 
# The JITDylib is owned by the LLJIT instance. The client is not responsible
# for managing its memory.
cdef LLVMOrcJITDylibRef LLVMOrcLLJITGetMainJITDylib(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITGetMainJITDylib__funptr
    if __init_symbol(&_LLVMOrcLLJITGetMainJITDylib__funptr,"LLVMOrcLLJITGetMainJITDylib") > 0:
        pass
    return (<LLVMOrcJITDylibRef (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITGetMainJITDylib__funptr)(J)


cdef void* _LLVMOrcLLJITGetTripleString__funptr = NULL
# 
# Return the target triple for this LLJIT instance. This string is owned by
# the LLJIT instance and should not be freed by the client.
cdef const char * LLVMOrcLLJITGetTripleString(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITGetTripleString__funptr
    if __init_symbol(&_LLVMOrcLLJITGetTripleString__funptr,"LLVMOrcLLJITGetTripleString") > 0:
        pass
    return (<const char * (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITGetTripleString__funptr)(J)


cdef void* _LLVMOrcLLJITGetGlobalPrefix__funptr = NULL
# 
# Returns the global prefix character according to the LLJIT's DataLayout.
cdef char LLVMOrcLLJITGetGlobalPrefix(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITGetGlobalPrefix__funptr
    if __init_symbol(&_LLVMOrcLLJITGetGlobalPrefix__funptr,"LLVMOrcLLJITGetGlobalPrefix") > 0:
        pass
    return (<char (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITGetGlobalPrefix__funptr)(J)


cdef void* _LLVMOrcLLJITMangleAndIntern__funptr = NULL
# 
# Mangles the given string according to the LLJIT instance's DataLayout, then
# interns the result in the SymbolStringPool and returns a reference to the
# pool entry. Clients should call LLVMOrcReleaseSymbolStringPoolEntry to
# decrement the ref-count on the pool entry once they are finished with this
# value.
cdef LLVMOrcSymbolStringPoolEntryRef LLVMOrcLLJITMangleAndIntern(LLVMOrcLLJITRef J,const char * UnmangledName):
    global _LLVMOrcLLJITMangleAndIntern__funptr
    if __init_symbol(&_LLVMOrcLLJITMangleAndIntern__funptr,"LLVMOrcLLJITMangleAndIntern") > 0:
        pass
    return (<LLVMOrcSymbolStringPoolEntryRef (*)(LLVMOrcLLJITRef,const char *) noexcept nogil> _LLVMOrcLLJITMangleAndIntern__funptr)(J,UnmangledName)


cdef void* _LLVMOrcLLJITAddObjectFile__funptr = NULL
# 
# Add a buffer representing an object file to the given JITDylib in the given
# LLJIT instance. This operation transfers ownership of the buffer to the
# LLJIT instance. The buffer should not be disposed of or referenced once this
# function returns.
# 
# Resources associated with the given object will be tracked by the given
# JITDylib's default resource tracker.
cdef LLVMErrorRef LLVMOrcLLJITAddObjectFile(LLVMOrcLLJITRef J,LLVMOrcJITDylibRef JD,LLVMMemoryBufferRef ObjBuffer):
    global _LLVMOrcLLJITAddObjectFile__funptr
    if __init_symbol(&_LLVMOrcLLJITAddObjectFile__funptr,"LLVMOrcLLJITAddObjectFile") > 0:
        pass
    return (<LLVMErrorRef (*)(LLVMOrcLLJITRef,LLVMOrcJITDylibRef,LLVMMemoryBufferRef) noexcept nogil> _LLVMOrcLLJITAddObjectFile__funptr)(J,JD,ObjBuffer)


cdef void* _LLVMOrcLLJITAddObjectFileWithRT__funptr = NULL
# 
# Add a buffer representing an object file to the given ResourceTracker's
# JITDylib in the given LLJIT instance. This operation transfers ownership of
# the buffer to the LLJIT instance. The buffer should not be disposed of or
# referenced once this function returns.
# 
# Resources associated with the given object will be tracked by ResourceTracker
# RT.
cdef LLVMErrorRef LLVMOrcLLJITAddObjectFileWithRT(LLVMOrcLLJITRef J,LLVMOrcResourceTrackerRef RT,LLVMMemoryBufferRef ObjBuffer):
    global _LLVMOrcLLJITAddObjectFileWithRT__funptr
    if __init_symbol(&_LLVMOrcLLJITAddObjectFileWithRT__funptr,"LLVMOrcLLJITAddObjectFileWithRT") > 0:
        pass
    return (<LLVMErrorRef (*)(LLVMOrcLLJITRef,LLVMOrcResourceTrackerRef,LLVMMemoryBufferRef) noexcept nogil> _LLVMOrcLLJITAddObjectFileWithRT__funptr)(J,RT,ObjBuffer)


cdef void* _LLVMOrcLLJITAddLLVMIRModule__funptr = NULL
# 
# Add an IR module to the given JITDylib in the given LLJIT instance. This
# operation transfers ownership of the TSM argument to the LLJIT instance.
# The TSM argument should not be disposed of or referenced once this
# function returns.
# 
# Resources associated with the given Module will be tracked by the given
# JITDylib's default resource tracker.
cdef LLVMErrorRef LLVMOrcLLJITAddLLVMIRModule(LLVMOrcLLJITRef J,LLVMOrcJITDylibRef JD,LLVMOrcThreadSafeModuleRef TSM):
    global _LLVMOrcLLJITAddLLVMIRModule__funptr
    if __init_symbol(&_LLVMOrcLLJITAddLLVMIRModule__funptr,"LLVMOrcLLJITAddLLVMIRModule") > 0:
        pass
    return (<LLVMErrorRef (*)(LLVMOrcLLJITRef,LLVMOrcJITDylibRef,LLVMOrcThreadSafeModuleRef) noexcept nogil> _LLVMOrcLLJITAddLLVMIRModule__funptr)(J,JD,TSM)


cdef void* _LLVMOrcLLJITAddLLVMIRModuleWithRT__funptr = NULL
# 
# Add an IR module to the given ResourceTracker's JITDylib in the given LLJIT
# instance. This operation transfers ownership of the TSM argument to the LLJIT
# instance. The TSM argument should not be disposed of or referenced once this
# function returns.
# 
# Resources associated with the given Module will be tracked by ResourceTracker
# RT.
cdef LLVMErrorRef LLVMOrcLLJITAddLLVMIRModuleWithRT(LLVMOrcLLJITRef J,LLVMOrcResourceTrackerRef JD,LLVMOrcThreadSafeModuleRef TSM):
    global _LLVMOrcLLJITAddLLVMIRModuleWithRT__funptr
    if __init_symbol(&_LLVMOrcLLJITAddLLVMIRModuleWithRT__funptr,"LLVMOrcLLJITAddLLVMIRModuleWithRT") > 0:
        pass
    return (<LLVMErrorRef (*)(LLVMOrcLLJITRef,LLVMOrcResourceTrackerRef,LLVMOrcThreadSafeModuleRef) noexcept nogil> _LLVMOrcLLJITAddLLVMIRModuleWithRT__funptr)(J,JD,TSM)


cdef void* _LLVMOrcLLJITLookup__funptr = NULL
# 
# Look up the given symbol in the main JITDylib of the given LLJIT instance.
# 
# This operation does not take ownership of the Name argument.
cdef LLVMErrorRef LLVMOrcLLJITLookup(LLVMOrcLLJITRef J,unsigned long * Result,const char * Name):
    global _LLVMOrcLLJITLookup__funptr
    if __init_symbol(&_LLVMOrcLLJITLookup__funptr,"LLVMOrcLLJITLookup") > 0:
        pass
    return (<LLVMErrorRef (*)(LLVMOrcLLJITRef,unsigned long *,const char *) noexcept nogil> _LLVMOrcLLJITLookup__funptr)(J,Result,Name)


cdef void* _LLVMOrcLLJITGetObjLinkingLayer__funptr = NULL
# 
# Returns a non-owning reference to the LLJIT instance's object linking layer.
cdef LLVMOrcObjectLayerRef LLVMOrcLLJITGetObjLinkingLayer(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITGetObjLinkingLayer__funptr
    if __init_symbol(&_LLVMOrcLLJITGetObjLinkingLayer__funptr,"LLVMOrcLLJITGetObjLinkingLayer") > 0:
        pass
    return (<LLVMOrcObjectLayerRef (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITGetObjLinkingLayer__funptr)(J)


cdef void* _LLVMOrcLLJITGetObjTransformLayer__funptr = NULL
# 
# Returns a non-owning reference to the LLJIT instance's object linking layer.
cdef LLVMOrcObjectTransformLayerRef LLVMOrcLLJITGetObjTransformLayer(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITGetObjTransformLayer__funptr
    if __init_symbol(&_LLVMOrcLLJITGetObjTransformLayer__funptr,"LLVMOrcLLJITGetObjTransformLayer") > 0:
        pass
    return (<LLVMOrcObjectTransformLayerRef (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITGetObjTransformLayer__funptr)(J)


cdef void* _LLVMOrcLLJITGetIRTransformLayer__funptr = NULL
# 
# Returns a non-owning reference to the LLJIT instance's IR transform layer.
cdef LLVMOrcIRTransformLayerRef LLVMOrcLLJITGetIRTransformLayer(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITGetIRTransformLayer__funptr
    if __init_symbol(&_LLVMOrcLLJITGetIRTransformLayer__funptr,"LLVMOrcLLJITGetIRTransformLayer") > 0:
        pass
    return (<LLVMOrcIRTransformLayerRef (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITGetIRTransformLayer__funptr)(J)


cdef void* _LLVMOrcLLJITGetDataLayoutStr__funptr = NULL
# 
# Get the LLJIT instance's default data layout string.
# 
# This string is owned by the LLJIT instance and does not need to be freed
# by the caller.
cdef const char * LLVMOrcLLJITGetDataLayoutStr(LLVMOrcLLJITRef J):
    global _LLVMOrcLLJITGetDataLayoutStr__funptr
    if __init_symbol(&_LLVMOrcLLJITGetDataLayoutStr__funptr,"LLVMOrcLLJITGetDataLayoutStr") > 0:
        pass
    return (<const char * (*)(LLVMOrcLLJITRef) noexcept nogil> _LLVMOrcLLJITGetDataLayoutStr__funptr)(J)
