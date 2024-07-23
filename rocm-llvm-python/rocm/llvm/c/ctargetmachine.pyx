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


cdef void* _LLVMGetFirstTarget__funptr = NULL
# Returns the first llvm::Target in the registered targets list. */
cdef LLVMTargetRef LLVMGetFirstTarget():
    global _LLVMGetFirstTarget__funptr
    if __init_symbol(&_LLVMGetFirstTarget__funptr,"LLVMGetFirstTarget") > 0:
        pass
    return (<LLVMTargetRef (*)() noexcept nogil> _LLVMGetFirstTarget__funptr)()


cdef void* _LLVMGetNextTarget__funptr = NULL
# Returns the next llvm::Target given a previous one (or null if there's none) */
cdef LLVMTargetRef LLVMGetNextTarget(LLVMTargetRef T):
    global _LLVMGetNextTarget__funptr
    if __init_symbol(&_LLVMGetNextTarget__funptr,"LLVMGetNextTarget") > 0:
        pass
    return (<LLVMTargetRef (*)(LLVMTargetRef) noexcept nogil> _LLVMGetNextTarget__funptr)(T)


cdef void* _LLVMGetTargetFromName__funptr = NULL
#   Finds the target corresponding to the given name and stores it in \p T.
# Returns 0 on success.
cdef LLVMTargetRef LLVMGetTargetFromName(const char * Name):
    global _LLVMGetTargetFromName__funptr
    if __init_symbol(&_LLVMGetTargetFromName__funptr,"LLVMGetTargetFromName") > 0:
        pass
    return (<LLVMTargetRef (*)(const char *) noexcept nogil> _LLVMGetTargetFromName__funptr)(Name)


cdef void* _LLVMGetTargetFromTriple__funptr = NULL
#   Finds the target corresponding to the given triple and stores it in \p T.
# Returns 0 on success. Optionally returns any error in ErrorMessage.
# Use LLVMDisposeMessage to dispose the message.
cdef int LLVMGetTargetFromTriple(const char * Triple,LLVMTargetRef* T,char ** ErrorMessage):
    global _LLVMGetTargetFromTriple__funptr
    if __init_symbol(&_LLVMGetTargetFromTriple__funptr,"LLVMGetTargetFromTriple") > 0:
        pass
    return (<int (*)(const char *,LLVMTargetRef*,char **) noexcept nogil> _LLVMGetTargetFromTriple__funptr)(Triple,T,ErrorMessage)


cdef void* _LLVMGetTargetName__funptr = NULL
# Returns the name of a target. See llvm::Target::getName */
cdef const char * LLVMGetTargetName(LLVMTargetRef T):
    global _LLVMGetTargetName__funptr
    if __init_symbol(&_LLVMGetTargetName__funptr,"LLVMGetTargetName") > 0:
        pass
    return (<const char * (*)(LLVMTargetRef) noexcept nogil> _LLVMGetTargetName__funptr)(T)


cdef void* _LLVMGetTargetDescription__funptr = NULL
# Returns the description  of a target. See llvm::Target::getDescription */
cdef const char * LLVMGetTargetDescription(LLVMTargetRef T):
    global _LLVMGetTargetDescription__funptr
    if __init_symbol(&_LLVMGetTargetDescription__funptr,"LLVMGetTargetDescription") > 0:
        pass
    return (<const char * (*)(LLVMTargetRef) noexcept nogil> _LLVMGetTargetDescription__funptr)(T)


cdef void* _LLVMTargetHasJIT__funptr = NULL
# Returns if the target has a JIT */
cdef int LLVMTargetHasJIT(LLVMTargetRef T):
    global _LLVMTargetHasJIT__funptr
    if __init_symbol(&_LLVMTargetHasJIT__funptr,"LLVMTargetHasJIT") > 0:
        pass
    return (<int (*)(LLVMTargetRef) noexcept nogil> _LLVMTargetHasJIT__funptr)(T)


cdef void* _LLVMTargetHasTargetMachine__funptr = NULL
# Returns if the target has a TargetMachine associated */
cdef int LLVMTargetHasTargetMachine(LLVMTargetRef T):
    global _LLVMTargetHasTargetMachine__funptr
    if __init_symbol(&_LLVMTargetHasTargetMachine__funptr,"LLVMTargetHasTargetMachine") > 0:
        pass
    return (<int (*)(LLVMTargetRef) noexcept nogil> _LLVMTargetHasTargetMachine__funptr)(T)


cdef void* _LLVMTargetHasAsmBackend__funptr = NULL
# Returns if the target as an ASM backend (required for emitting output) */
cdef int LLVMTargetHasAsmBackend(LLVMTargetRef T):
    global _LLVMTargetHasAsmBackend__funptr
    if __init_symbol(&_LLVMTargetHasAsmBackend__funptr,"LLVMTargetHasAsmBackend") > 0:
        pass
    return (<int (*)(LLVMTargetRef) noexcept nogil> _LLVMTargetHasAsmBackend__funptr)(T)


cdef void* _LLVMCreateTargetMachine__funptr = NULL
# Creates a new llvm::TargetMachine. See llvm::Target::createTargetMachine */
cdef LLVMTargetMachineRef LLVMCreateTargetMachine(LLVMTargetRef T,const char * Triple,const char * CPU,const char * Features,LLVMCodeGenOptLevel Level,LLVMRelocMode Reloc,LLVMCodeModel CodeModel):
    global _LLVMCreateTargetMachine__funptr
    if __init_symbol(&_LLVMCreateTargetMachine__funptr,"LLVMCreateTargetMachine") > 0:
        pass
    return (<LLVMTargetMachineRef (*)(LLVMTargetRef,const char *,const char *,const char *,LLVMCodeGenOptLevel,LLVMRelocMode,LLVMCodeModel) noexcept nogil> _LLVMCreateTargetMachine__funptr)(T,Triple,CPU,Features,Level,Reloc,CodeModel)


cdef void* _LLVMDisposeTargetMachine__funptr = NULL
#   Dispose the LLVMTargetMachineRef instance generated by
# LLVMCreateTargetMachine.
cdef void LLVMDisposeTargetMachine(LLVMTargetMachineRef T):
    global _LLVMDisposeTargetMachine__funptr
    if __init_symbol(&_LLVMDisposeTargetMachine__funptr,"LLVMDisposeTargetMachine") > 0:
        pass
    (<void (*)(LLVMTargetMachineRef) noexcept nogil> _LLVMDisposeTargetMachine__funptr)(T)


cdef void* _LLVMGetTargetMachineTarget__funptr = NULL
# Returns the Target used in a TargetMachine */
cdef LLVMTargetRef LLVMGetTargetMachineTarget(LLVMTargetMachineRef T):
    global _LLVMGetTargetMachineTarget__funptr
    if __init_symbol(&_LLVMGetTargetMachineTarget__funptr,"LLVMGetTargetMachineTarget") > 0:
        pass
    return (<LLVMTargetRef (*)(LLVMTargetMachineRef) noexcept nogil> _LLVMGetTargetMachineTarget__funptr)(T)


cdef void* _LLVMGetTargetMachineTriple__funptr = NULL
#   Returns the triple used creating this target machine. See
# llvm::TargetMachine::getTriple. The result needs to be disposed with
# LLVMDisposeMessage.
cdef char * LLVMGetTargetMachineTriple(LLVMTargetMachineRef T):
    global _LLVMGetTargetMachineTriple__funptr
    if __init_symbol(&_LLVMGetTargetMachineTriple__funptr,"LLVMGetTargetMachineTriple") > 0:
        pass
    return (<char * (*)(LLVMTargetMachineRef) noexcept nogil> _LLVMGetTargetMachineTriple__funptr)(T)


cdef void* _LLVMGetTargetMachineCPU__funptr = NULL
#   Returns the cpu used creating this target machine. See
# llvm::TargetMachine::getCPU. The result needs to be disposed with
# LLVMDisposeMessage.
cdef char * LLVMGetTargetMachineCPU(LLVMTargetMachineRef T):
    global _LLVMGetTargetMachineCPU__funptr
    if __init_symbol(&_LLVMGetTargetMachineCPU__funptr,"LLVMGetTargetMachineCPU") > 0:
        pass
    return (<char * (*)(LLVMTargetMachineRef) noexcept nogil> _LLVMGetTargetMachineCPU__funptr)(T)


cdef void* _LLVMGetTargetMachineFeatureString__funptr = NULL
#   Returns the feature string used creating this target machine. See
# llvm::TargetMachine::getFeatureString. The result needs to be disposed with
# LLVMDisposeMessage.
cdef char * LLVMGetTargetMachineFeatureString(LLVMTargetMachineRef T):
    global _LLVMGetTargetMachineFeatureString__funptr
    if __init_symbol(&_LLVMGetTargetMachineFeatureString__funptr,"LLVMGetTargetMachineFeatureString") > 0:
        pass
    return (<char * (*)(LLVMTargetMachineRef) noexcept nogil> _LLVMGetTargetMachineFeatureString__funptr)(T)


cdef void* _LLVMCreateTargetDataLayout__funptr = NULL
# Create a DataLayout based on the targetMachine. */
cdef LLVMTargetDataRef LLVMCreateTargetDataLayout(LLVMTargetMachineRef T):
    global _LLVMCreateTargetDataLayout__funptr
    if __init_symbol(&_LLVMCreateTargetDataLayout__funptr,"LLVMCreateTargetDataLayout") > 0:
        pass
    return (<LLVMTargetDataRef (*)(LLVMTargetMachineRef) noexcept nogil> _LLVMCreateTargetDataLayout__funptr)(T)


cdef void* _LLVMSetTargetMachineAsmVerbosity__funptr = NULL
# Set the target machine's ASM verbosity. */
cdef void LLVMSetTargetMachineAsmVerbosity(LLVMTargetMachineRef T,int VerboseAsm):
    global _LLVMSetTargetMachineAsmVerbosity__funptr
    if __init_symbol(&_LLVMSetTargetMachineAsmVerbosity__funptr,"LLVMSetTargetMachineAsmVerbosity") > 0:
        pass
    (<void (*)(LLVMTargetMachineRef,int) noexcept nogil> _LLVMSetTargetMachineAsmVerbosity__funptr)(T,VerboseAsm)


cdef void* _LLVMTargetMachineEmitToFile__funptr = NULL
#   Emits an asm or object file for the given module to the filename. This
# wraps several c++ only classes (among them a file stream). Returns any
# error in ErrorMessage. Use LLVMDisposeMessage to dispose the message.
cdef int LLVMTargetMachineEmitToFile(LLVMTargetMachineRef T,LLVMModuleRef M,const char * Filename,LLVMCodeGenFileType codegen,char ** ErrorMessage):
    global _LLVMTargetMachineEmitToFile__funptr
    if __init_symbol(&_LLVMTargetMachineEmitToFile__funptr,"LLVMTargetMachineEmitToFile") > 0:
        pass
    return (<int (*)(LLVMTargetMachineRef,LLVMModuleRef,const char *,LLVMCodeGenFileType,char **) noexcept nogil> _LLVMTargetMachineEmitToFile__funptr)(T,M,Filename,codegen,ErrorMessage)


cdef void* _LLVMTargetMachineEmitToMemoryBuffer__funptr = NULL
# Compile the LLVM IR stored in \p M and store the result in \p OutMemBuf. */
cdef int LLVMTargetMachineEmitToMemoryBuffer(LLVMTargetMachineRef T,LLVMModuleRef M,LLVMCodeGenFileType codegen,char ** ErrorMessage,LLVMMemoryBufferRef* OutMemBuf):
    global _LLVMTargetMachineEmitToMemoryBuffer__funptr
    if __init_symbol(&_LLVMTargetMachineEmitToMemoryBuffer__funptr,"LLVMTargetMachineEmitToMemoryBuffer") > 0:
        pass
    return (<int (*)(LLVMTargetMachineRef,LLVMModuleRef,LLVMCodeGenFileType,char **,LLVMMemoryBufferRef*) noexcept nogil> _LLVMTargetMachineEmitToMemoryBuffer__funptr)(T,M,codegen,ErrorMessage,OutMemBuf)


cdef void* _LLVMGetDefaultTargetTriple__funptr = NULL
#   Get a triple for the host machine as a string. The result needs to be
# disposed with LLVMDisposeMessage.
cdef char * LLVMGetDefaultTargetTriple():
    global _LLVMGetDefaultTargetTriple__funptr
    if __init_symbol(&_LLVMGetDefaultTargetTriple__funptr,"LLVMGetDefaultTargetTriple") > 0:
        pass
    return (<char * (*)() noexcept nogil> _LLVMGetDefaultTargetTriple__funptr)()


cdef void* _LLVMNormalizeTargetTriple__funptr = NULL
#   Normalize a target triple. The result needs to be disposed with
# LLVMDisposeMessage.
cdef char * LLVMNormalizeTargetTriple(const char * triple):
    global _LLVMNormalizeTargetTriple__funptr
    if __init_symbol(&_LLVMNormalizeTargetTriple__funptr,"LLVMNormalizeTargetTriple") > 0:
        pass
    return (<char * (*)(const char *) noexcept nogil> _LLVMNormalizeTargetTriple__funptr)(triple)


cdef void* _LLVMGetHostCPUName__funptr = NULL
#   Get the host CPU as a string. The result needs to be disposed with
# LLVMDisposeMessage.
cdef char * LLVMGetHostCPUName():
    global _LLVMGetHostCPUName__funptr
    if __init_symbol(&_LLVMGetHostCPUName__funptr,"LLVMGetHostCPUName") > 0:
        pass
    return (<char * (*)() noexcept nogil> _LLVMGetHostCPUName__funptr)()


cdef void* _LLVMGetHostCPUFeatures__funptr = NULL
#   Get the host CPU's features as a string. The result needs to be disposed
# with LLVMDisposeMessage.
cdef char * LLVMGetHostCPUFeatures():
    global _LLVMGetHostCPUFeatures__funptr
    if __init_symbol(&_LLVMGetHostCPUFeatures__funptr,"LLVMGetHostCPUFeatures") > 0:
        pass
    return (<char * (*)() noexcept nogil> _LLVMGetHostCPUFeatures__funptr)()


cdef void* _LLVMAddAnalysisPasses__funptr = NULL
# Adds the target-specific analysis passes to the pass manager. */
cdef void LLVMAddAnalysisPasses(LLVMTargetMachineRef T,LLVMPassManagerRef PM):
    global _LLVMAddAnalysisPasses__funptr
    if __init_symbol(&_LLVMAddAnalysisPasses__funptr,"LLVMAddAnalysisPasses") > 0:
        pass
    (<void (*)(LLVMTargetMachineRef,LLVMPassManagerRef) noexcept nogil> _LLVMAddAnalysisPasses__funptr)(T,PM)
