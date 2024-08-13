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

from libc.stdint cimport *
ctypedef bint _Bool # bool is not a reserved keyword in C, _Bool is
from rocm.llvm.c.cerror cimport *
from rocm.llvm.c.ctargetmachine cimport *
from rocm.llvm.c.ctypes cimport *
cdef extern from "llvm-c/Orc.h":

    ctypedef unsigned long LLVMOrcJITTargetAddress

    ctypedef unsigned long LLVMOrcExecutorAddress

    ctypedef enum LLVMJITSymbolGenericFlags:
        LLVMJITSymbolGenericFlagsNone
        LLVMJITSymbolGenericFlagsExported
        LLVMJITSymbolGenericFlagsWeak
        LLVMJITSymbolGenericFlagsCallable
        LLVMJITSymbolGenericFlagsMaterializationSideEffectsOnly

    ctypedef unsigned char LLVMJITSymbolTargetFlags

    ctypedef struct LLVMJITSymbolFlags:
        unsigned char GenericFlags
        unsigned char TargetFlags

    ctypedef struct LLVMJITEvaluatedSymbol:
        unsigned long Address
        LLVMJITSymbolFlags Flags

    cdef struct LLVMOrcOpaqueExecutionSession:
        pass

    ctypedef LLVMOrcOpaqueExecutionSession * LLVMOrcExecutionSessionRef

    ctypedef void (*LLVMOrcErrorReporterFunction) (void *,LLVMErrorRef)

    cdef struct LLVMOrcOpaqueSymbolStringPool:
        pass

    ctypedef LLVMOrcOpaqueSymbolStringPool * LLVMOrcSymbolStringPoolRef

    cdef struct LLVMOrcOpaqueSymbolStringPoolEntry:
        pass

    ctypedef LLVMOrcOpaqueSymbolStringPoolEntry * LLVMOrcSymbolStringPoolEntryRef

    ctypedef struct LLVMOrcCSymbolFlagsMapPair:
        LLVMOrcSymbolStringPoolEntryRef Name
        LLVMJITSymbolFlags Flags

    ctypedef LLVMOrcCSymbolFlagsMapPair * LLVMOrcCSymbolFlagsMapPairs

    ctypedef struct LLVMOrcCSymbolMapPair:
        LLVMOrcSymbolStringPoolEntryRef Name
        LLVMJITEvaluatedSymbol Sym

    ctypedef LLVMOrcCSymbolMapPair * LLVMOrcCSymbolMapPairs

    ctypedef struct LLVMOrcCSymbolAliasMapEntry:
        LLVMOrcSymbolStringPoolEntryRef Name
        LLVMJITSymbolFlags Flags

    ctypedef struct LLVMOrcCSymbolAliasMapPair:
        LLVMOrcSymbolStringPoolEntryRef Name
        LLVMOrcCSymbolAliasMapEntry Entry

    ctypedef LLVMOrcCSymbolAliasMapPair * LLVMOrcCSymbolAliasMapPairs

    cdef struct LLVMOrcOpaqueJITDylib:
        pass

    ctypedef LLVMOrcOpaqueJITDylib * LLVMOrcJITDylibRef

    ctypedef struct LLVMOrcCSymbolsList:
        LLVMOrcSymbolStringPoolEntryRef* Symbols
        unsigned long Length

    ctypedef struct LLVMOrcCDependenceMapPair:
        LLVMOrcJITDylibRef JD
        LLVMOrcCSymbolsList Names

    ctypedef LLVMOrcCDependenceMapPair * LLVMOrcCDependenceMapPairs

    ctypedef enum LLVMOrcLookupKind:
        LLVMOrcLookupKindStatic
        LLVMOrcLookupKindDLSym

    ctypedef enum LLVMOrcJITDylibLookupFlags:
        LLVMOrcJITDylibLookupFlagsMatchExportedSymbolsOnly
        LLVMOrcJITDylibLookupFlagsMatchAllSymbols

    ctypedef struct LLVMOrcCJITDylibSearchOrderElement:
        LLVMOrcJITDylibRef JD
        LLVMOrcJITDylibLookupFlags JDLookupFlags

    ctypedef LLVMOrcCJITDylibSearchOrderElement * LLVMOrcCJITDylibSearchOrder

    ctypedef enum LLVMOrcSymbolLookupFlags:
        LLVMOrcSymbolLookupFlagsRequiredSymbol
        LLVMOrcSymbolLookupFlagsWeaklyReferencedSymbol

    ctypedef struct LLVMOrcCLookupSetElement:
        LLVMOrcSymbolStringPoolEntryRef Name
        LLVMOrcSymbolLookupFlags LookupFlags

    ctypedef LLVMOrcCLookupSetElement * LLVMOrcCLookupSet

    cdef struct LLVMOrcOpaqueMaterializationUnit:
        pass

    ctypedef LLVMOrcOpaqueMaterializationUnit * LLVMOrcMaterializationUnitRef

    cdef struct LLVMOrcOpaqueMaterializationResponsibility:
        pass

    ctypedef LLVMOrcOpaqueMaterializationResponsibility * LLVMOrcMaterializationResponsibilityRef

    ctypedef void (*LLVMOrcMaterializationUnitMaterializeFunction) (void *,LLVMOrcMaterializationResponsibilityRef)

    ctypedef void (*LLVMOrcMaterializationUnitDiscardFunction) (void *,LLVMOrcJITDylibRef,LLVMOrcSymbolStringPoolEntryRef)

    ctypedef void (*LLVMOrcMaterializationUnitDestroyFunction) (void *)

    cdef struct LLVMOrcOpaqueResourceTracker:
        pass

    ctypedef LLVMOrcOpaqueResourceTracker * LLVMOrcResourceTrackerRef

    cdef struct LLVMOrcOpaqueDefinitionGenerator:
        pass

    ctypedef LLVMOrcOpaqueDefinitionGenerator * LLVMOrcDefinitionGeneratorRef

    cdef struct LLVMOrcOpaqueLookupState:
        pass

    ctypedef LLVMOrcOpaqueLookupState * LLVMOrcLookupStateRef

    ctypedef LLVMErrorRef (*LLVMOrcCAPIDefinitionGeneratorTryToGenerateFunction) (LLVMOrcDefinitionGeneratorRef,void *,LLVMOrcLookupStateRef*,LLVMOrcLookupKind,LLVMOrcJITDylibRef,LLVMOrcJITDylibLookupFlags,LLVMOrcCLookupSet,unsigned long)

    ctypedef void (*LLVMOrcDisposeCAPIDefinitionGeneratorFunction) (void *)

    ctypedef int (*LLVMOrcSymbolPredicate) (void *,LLVMOrcSymbolStringPoolEntryRef)

    cdef struct LLVMOrcOpaqueThreadSafeContext:
        pass

    ctypedef LLVMOrcOpaqueThreadSafeContext * LLVMOrcThreadSafeContextRef

    cdef struct LLVMOrcOpaqueThreadSafeModule:
        pass

    ctypedef LLVMOrcOpaqueThreadSafeModule * LLVMOrcThreadSafeModuleRef

    ctypedef LLVMErrorRef (*LLVMOrcGenericIRModuleOperationFunction) (void *,LLVMModuleRef)

    cdef struct LLVMOrcOpaqueJITTargetMachineBuilder:
        pass

    ctypedef LLVMOrcOpaqueJITTargetMachineBuilder * LLVMOrcJITTargetMachineBuilderRef

    cdef struct LLVMOrcOpaqueObjectLayer:
        pass

    ctypedef LLVMOrcOpaqueObjectLayer * LLVMOrcObjectLayerRef

    cdef struct LLVMOrcOpaqueObjectLinkingLayer:
        pass

    ctypedef LLVMOrcOpaqueObjectLinkingLayer * LLVMOrcObjectLinkingLayerRef

    cdef struct LLVMOrcOpaqueIRTransformLayer:
        pass

    ctypedef LLVMOrcOpaqueIRTransformLayer * LLVMOrcIRTransformLayerRef

    ctypedef LLVMErrorRef (*LLVMOrcIRTransformLayerTransformFunction) (void *,LLVMOrcThreadSafeModuleRef*,LLVMOrcMaterializationResponsibilityRef)

    cdef struct LLVMOrcOpaqueObjectTransformLayer:
        pass

    ctypedef LLVMOrcOpaqueObjectTransformLayer * LLVMOrcObjectTransformLayerRef

    ctypedef LLVMErrorRef (*LLVMOrcObjectTransformLayerTransformFunction) (void *,LLVMMemoryBufferRef*)

    cdef struct LLVMOrcOpaqueIndirectStubsManager:
        pass

    ctypedef LLVMOrcOpaqueIndirectStubsManager * LLVMOrcIndirectStubsManagerRef

    cdef struct LLVMOrcOpaqueLazyCallThroughManager:
        pass

    ctypedef LLVMOrcOpaqueLazyCallThroughManager * LLVMOrcLazyCallThroughManagerRef

    cdef struct LLVMOrcOpaqueDumpObjects:
        pass

    ctypedef LLVMOrcOpaqueDumpObjects * LLVMOrcDumpObjectsRef

# 
# Attach a custom error reporter function to the ExecutionSession.
# 
# The error reporter will be called to deliver failure notices that can not be
# directly reported to a caller. For example, failure to resolve symbols in
# the JIT linker is typically reported via the error reporter (callers
# requesting definitions from the JIT will typically be delivered a
# FailureToMaterialize error instead).
cdef void LLVMOrcExecutionSessionSetErrorReporter(LLVMOrcExecutionSessionRef ES,LLVMOrcErrorReporterFunction ReportError,void * Ctx)


# 
# Return a reference to the SymbolStringPool for an ExecutionSession.
# 
# Ownership of the pool remains with the ExecutionSession: The caller is
# not required to free the pool.
cdef LLVMOrcSymbolStringPoolRef LLVMOrcExecutionSessionGetSymbolStringPool(LLVMOrcExecutionSessionRef ES)


# 
# Clear all unreferenced symbol string pool entries.
# 
# This can be called at any time to release unused entries in the
# ExecutionSession's string pool. Since it locks the pool (preventing
# interning of any new strings) it is recommended that it only be called
# infrequently, ideally when the caller has reason to believe that some
# entries will have become unreferenced, e.g. after removing a module or
# closing a JITDylib.
cdef void LLVMOrcSymbolStringPoolClearDeadEntries(LLVMOrcSymbolStringPoolRef SSP)


# 
# Intern a string in the ExecutionSession's SymbolStringPool and return a
# reference to it. This increments the ref-count of the pool entry, and the
# returned value should be released once the client is done with it by
# calling LLVMOrcReleaseSymbolStringPoolEntry.
# 
# Since strings are uniqued within the SymbolStringPool
# LLVMOrcSymbolStringPoolEntryRefs can be compared by value to test string
# equality.
# 
# Note that this function does not perform linker-mangling on the string.
cdef LLVMOrcSymbolStringPoolEntryRef LLVMOrcExecutionSessionIntern(LLVMOrcExecutionSessionRef ES,const char * Name)


cdef extern from "llvm-c/Orc.h":

    ctypedef void (*LLVMOrcExecutionSessionLookupHandleResultFunction) (LLVMErrorRef,LLVMOrcCSymbolMapPairs,unsigned long,void *)

# 
# Look up symbols in an execution session.
# 
# This is a wrapper around the general ExecutionSession::lookup function.
# 
# The SearchOrder argument contains a list of (JITDylibs, JITDylibSearchFlags)
# pairs that describe the search order. The JITDylibs will be searched in the
# given order to try to find the symbols in the Symbols argument.
# 
# The Symbols argument should contain a null-terminated array of
# (SymbolStringPtr, SymbolLookupFlags) pairs describing the symbols to be
# searched for. This function takes ownership of the elements of the Symbols
# array. The Name fields of the Symbols elements are taken to have been
# retained by the client for this function. The client should *not* release the
# Name fields, but are still responsible for destroying the array itself.
# 
# The HandleResult function will be called once all searched for symbols have
# been found, or an error occurs. The HandleResult function will be passed an
# LLVMErrorRef indicating success or failure, and (on success) a
# null-terminated LLVMOrcCSymbolMapPairs array containing the function result,
# and the Ctx value passed to the lookup function.
# 
# The client is fully responsible for managing the lifetime of the Ctx object.
# A common idiom is to allocate the context prior to the lookup and deallocate
# it in the handler.
# 
# THIS API IS EXPERIMENTAL AND LIKELY TO CHANGE IN THE NEAR FUTURE!
cdef void LLVMOrcExecutionSessionLookup(LLVMOrcExecutionSessionRef ES,LLVMOrcLookupKind K,LLVMOrcCJITDylibSearchOrder SearchOrder,unsigned long SearchOrderSize,LLVMOrcCLookupSet Symbols,unsigned long SymbolsSize,LLVMOrcExecutionSessionLookupHandleResultFunction HandleResult,void * Ctx)


# 
# Increments the ref-count for a SymbolStringPool entry.
cdef void LLVMOrcRetainSymbolStringPoolEntry(LLVMOrcSymbolStringPoolEntryRef S)


# 
# Reduces the ref-count for of a SymbolStringPool entry.
cdef void LLVMOrcReleaseSymbolStringPoolEntry(LLVMOrcSymbolStringPoolEntryRef S)


# 
# Return the c-string for the given symbol. This string will remain valid until
# the entry is freed (once all LLVMOrcSymbolStringPoolEntryRefs have been
# released).
cdef const char * LLVMOrcSymbolStringPoolEntryStr(LLVMOrcSymbolStringPoolEntryRef S)


# 
# Reduces the ref-count of a ResourceTracker.
cdef void LLVMOrcReleaseResourceTracker(LLVMOrcResourceTrackerRef RT)


# 
# Transfers tracking of all resources associated with resource tracker SrcRT
# to resource tracker DstRT.
cdef void LLVMOrcResourceTrackerTransferTo(LLVMOrcResourceTrackerRef SrcRT,LLVMOrcResourceTrackerRef DstRT)


# 
# Remove all resources associated with the given tracker. See
# ResourceTracker::remove().
cdef LLVMErrorRef LLVMOrcResourceTrackerRemove(LLVMOrcResourceTrackerRef RT)


# 
# Dispose of a JITDylib::DefinitionGenerator. This should only be called if
# ownership has not been passed to a JITDylib (e.g. because some error
# prevented the client from calling LLVMOrcJITDylibAddGenerator).
cdef void LLVMOrcDisposeDefinitionGenerator(LLVMOrcDefinitionGeneratorRef DG)


# 
# Dispose of a MaterializationUnit.
cdef void LLVMOrcDisposeMaterializationUnit(LLVMOrcMaterializationUnitRef MU)


# 
# Create a custom MaterializationUnit.
# 
# Name is a name for this MaterializationUnit to be used for identification
# and logging purposes (e.g. if this MaterializationUnit produces an
# object buffer then the name of that buffer will be derived from this name).
# 
# The Syms list contains the names and linkages of the symbols provided by this
# unit. This function takes ownership of the elements of the Syms array. The
# Name fields of the array elements are taken to have been retained for this
# function. The client should *not* release the elements of the array, but is
# still responsible for destroying the array itself.
# 
# The InitSym argument indicates whether or not this MaterializationUnit
# contains static initializers. If three are no static initializers (the common
# case) then this argument should be null. If there are static initializers
# then InitSym should be set to a unique name that also appears in the Syms
# list with the LLVMJITSymbolGenericFlagsMaterializationSideEffectsOnly flag
# set. This function takes ownership of the InitSym, which should have been
# retained twice on behalf of this function: once for the Syms entry and once
# for InitSym. If clients wish to use the InitSym value after this function
# returns they must retain it once more for themselves.
# 
# If any of the symbols in the Syms list is looked up then the Materialize
# function will be called.
# 
# If any of the symbols in the Syms list is overridden then the Discard
# function will be called.
# 
# The caller owns the underling MaterializationUnit and is responsible for
# either passing it to a JITDylib (via LLVMOrcJITDylibDefine) or disposing
# of it by calling LLVMOrcDisposeMaterializationUnit.
cdef LLVMOrcMaterializationUnitRef LLVMOrcCreateCustomMaterializationUnit(const char * Name,void * Ctx,LLVMOrcCSymbolFlagsMapPairs Syms,unsigned long NumSyms,LLVMOrcSymbolStringPoolEntryRef InitSym,LLVMOrcMaterializationUnitMaterializeFunction Materialize,LLVMOrcMaterializationUnitDiscardFunction Discard,LLVMOrcMaterializationUnitDestroyFunction Destroy)


# 
# Create a MaterializationUnit to define the given symbols as pointing to
# the corresponding raw addresses.
# 
# This function takes ownership of the elements of the Syms array. The Name
# fields of the array elements are taken to have been retained for this
# function. This allows the following pattern...
# 
#   size_t NumPairs;
#   LLVMOrcCSymbolMapPairs Sym;
#   -- Build Syms array --
#   LLVMOrcMaterializationUnitRef MU =
#       LLVMOrcAbsoluteSymbols(Syms, NumPairs);
# 
# ... without requiring cleanup of the elements of the Sym array afterwards.
# 
# The client is still responsible for deleting the Sym array itself.
# 
# If a client wishes to reuse elements of the Sym array after this call they
# must explicitly retain each of the elements for themselves.
cdef LLVMOrcMaterializationUnitRef LLVMOrcAbsoluteSymbols(LLVMOrcCSymbolMapPairs Syms,unsigned long NumPairs)


# 
# Create a MaterializationUnit to define lazy re-expots. These are callable
# entry points that call through to the given symbols.
# 
# This function takes ownership of the CallableAliases array. The Name
# fields of the array elements are taken to have been retained for this
# function. This allows the following pattern...
# 
#   size_t NumPairs;
#   LLVMOrcCSymbolAliasMapPairs CallableAliases;
#   -- Build CallableAliases array --
#   LLVMOrcMaterializationUnitRef MU =
#      LLVMOrcLazyReexports(LCTM, ISM, JD, CallableAliases, NumPairs);
# 
# ... without requiring cleanup of the elements of the CallableAliases array afterwards.
# 
# The client is still responsible for deleting the CallableAliases array itself.
# 
# If a client wishes to reuse elements of the CallableAliases array after this call they
# must explicitly retain each of the elements for themselves.
cdef LLVMOrcMaterializationUnitRef LLVMOrcLazyReexports(LLVMOrcLazyCallThroughManagerRef LCTM,LLVMOrcIndirectStubsManagerRef ISM,LLVMOrcJITDylibRef SourceRef,LLVMOrcCSymbolAliasMapPairs CallableAliases,unsigned long NumPairs)


# 
# Disposes of the passed MaterializationResponsibility object.
# 
# This should only be done after the symbols covered by the object have either
# been resolved and emitted (via
# LLVMOrcMaterializationResponsibilityNotifyResolved and
# LLVMOrcMaterializationResponsibilityNotifyEmitted) or failed (via
# LLVMOrcMaterializationResponsibilityFailMaterialization).
cdef void LLVMOrcDisposeMaterializationResponsibility(LLVMOrcMaterializationResponsibilityRef MR)


# 
# Returns the target JITDylib that these symbols are being materialized into.
cdef LLVMOrcJITDylibRef LLVMOrcMaterializationResponsibilityGetTargetDylib(LLVMOrcMaterializationResponsibilityRef MR)


# 
# Returns the ExecutionSession for this MaterializationResponsibility.
cdef LLVMOrcExecutionSessionRef LLVMOrcMaterializationResponsibilityGetExecutionSession(LLVMOrcMaterializationResponsibilityRef MR)


# 
# Returns the symbol flags map for this responsibility instance.
# 
# The length of the array is returned in NumPairs and the caller is responsible
# for the returned memory and needs to call LLVMOrcDisposeCSymbolFlagsMap.
# 
# To use the returned symbols beyond the livetime of the
# MaterializationResponsibility requires the caller to retain the symbols
# explicitly.
cdef LLVMOrcCSymbolFlagsMapPairs LLVMOrcMaterializationResponsibilityGetSymbols(LLVMOrcMaterializationResponsibilityRef MR,unsigned long * NumPairs)


# 
# Disposes of the passed LLVMOrcCSymbolFlagsMap.
# 
# Does not release the entries themselves.
cdef void LLVMOrcDisposeCSymbolFlagsMap(LLVMOrcCSymbolFlagsMapPairs Pairs)


# 
# Returns the initialization pseudo-symbol, if any. This symbol will also
# be present in the SymbolFlagsMap for this MaterializationResponsibility
# object.
# 
# The returned symbol is not retained over any mutating operation of the
# MaterializationResponsbility or beyond the lifetime thereof.
cdef LLVMOrcSymbolStringPoolEntryRef LLVMOrcMaterializationResponsibilityGetInitializerSymbol(LLVMOrcMaterializationResponsibilityRef MR)


# 
# Returns the names of any symbols covered by this
# MaterializationResponsibility object that have queries pending. This
# information can be used to return responsibility for unrequested symbols
# back to the JITDylib via the delegate method.
cdef LLVMOrcSymbolStringPoolEntryRef* LLVMOrcMaterializationResponsibilityGetRequestedSymbols(LLVMOrcMaterializationResponsibilityRef MR,unsigned long * NumSymbols)


# 
# Disposes of the passed LLVMOrcSymbolStringPoolEntryRef* .
# 
# Does not release the symbols themselves.
cdef void LLVMOrcDisposeSymbols(LLVMOrcSymbolStringPoolEntryRef* Symbols)


# 
# Notifies the target JITDylib that the given symbols have been resolved.
# This will update the given symbols' addresses in the JITDylib, and notify
# any pending queries on the given symbols of their resolution. The given
# symbols must be ones covered by this MaterializationResponsibility
# instance. Individual calls to this method may resolve a subset of the
# symbols, but all symbols must have been resolved prior to calling emit.
# 
# This method will return an error if any symbols being resolved have been
# moved to the error state due to the failure of a dependency. If this
# method returns an error then clients should log it and call
# LLVMOrcMaterializationResponsibilityFailMaterialization. If no dependencies
# have been registered for the symbols covered by this
# MaterializationResponsibility then this method is guaranteed to return
# LLVMErrorSuccess.
cdef LLVMErrorRef LLVMOrcMaterializationResponsibilityNotifyResolved(LLVMOrcMaterializationResponsibilityRef MR,LLVMOrcCSymbolMapPairs Symbols,unsigned long NumPairs)


# 
# Notifies the target JITDylib (and any pending queries on that JITDylib)
# that all symbols covered by this MaterializationResponsibility instance
# have been emitted.
# 
# This method will return an error if any symbols being resolved have been
# moved to the error state due to the failure of a dependency. If this
# method returns an error then clients should log it and call
# LLVMOrcMaterializationResponsibilityFailMaterialization.
# If no dependencies have been registered for the symbols covered by this
# MaterializationResponsibility then this method is guaranteed to return
# LLVMErrorSuccess.
cdef LLVMErrorRef LLVMOrcMaterializationResponsibilityNotifyEmitted(LLVMOrcMaterializationResponsibilityRef MR)


# 
# Attempt to claim responsibility for new definitions. This method can be
# used to claim responsibility for symbols that are added to a
# materialization unit during the compilation process (e.g. literal pool
# symbols). Symbol linkage rules are the same as for symbols that are
# defined up front: duplicate strong definitions will result in errors.
# Duplicate weak definitions will be discarded (in which case they will
# not be added to this responsibility instance).
# 
# This method can be used by materialization units that want to add
# additional symbols at materialization time (e.g. stubs, compile
# callbacks, metadata)
cdef LLVMErrorRef LLVMOrcMaterializationResponsibilityDefineMaterializing(LLVMOrcMaterializationResponsibilityRef MR,LLVMOrcCSymbolFlagsMapPairs Pairs,unsigned long NumPairs)


# 
# Notify all not-yet-emitted covered by this MaterializationResponsibility
# instance that an error has occurred.
# This will remove all symbols covered by this MaterializationResponsibility
# from the target JITDylib, and send an error to any queries waiting on
# these symbols.
cdef void LLVMOrcMaterializationResponsibilityFailMaterialization(LLVMOrcMaterializationResponsibilityRef MR)


# 
# Transfers responsibility to the given MaterializationUnit for all
# symbols defined by that MaterializationUnit. This allows
# materializers to break up work based on run-time information (e.g.
# by introspecting which symbols have actually been looked up and
# materializing only those).
cdef LLVMErrorRef LLVMOrcMaterializationResponsibilityReplace(LLVMOrcMaterializationResponsibilityRef MR,LLVMOrcMaterializationUnitRef MU)


# 
# Delegates responsibility for the given symbols to the returned
# materialization responsibility. Useful for breaking up work between
# threads, or different kinds of materialization processes.
# 
# The caller retains responsibility of the the passed
# MaterializationResponsibility.
cdef LLVMErrorRef LLVMOrcMaterializationResponsibilityDelegate(LLVMOrcMaterializationResponsibilityRef MR,LLVMOrcSymbolStringPoolEntryRef* Symbols,unsigned long NumSymbols,LLVMOrcMaterializationResponsibilityRef* Result)


# 
# Adds dependencies to a symbol that the MaterializationResponsibility is
# responsible for.
# 
# This function takes ownership of Dependencies struct. The Names
# array have been retained for this function. This allows the following
# pattern...
# 
#   LLVMOrcSymbolStringPoolEntryRef Names[] = {...};
#   LLVMOrcCDependenceMapPair Dependence = {JD, {Names, sizeof(Names)}}
#   LLVMOrcMaterializationResponsibilityAddDependencies(JD, Name, &Dependence,
# 1);
# 
# ... without requiring cleanup of the elements of the Names array afterwards.
# 
# The client is still responsible for deleting the Dependencies.Names array
# itself.
cdef void LLVMOrcMaterializationResponsibilityAddDependencies(LLVMOrcMaterializationResponsibilityRef MR,LLVMOrcSymbolStringPoolEntryRef Name,LLVMOrcCDependenceMapPairs Dependencies,unsigned long NumPairs)


# 
# Adds dependencies to all symbols that the MaterializationResponsibility is
# responsible for. See LLVMOrcMaterializationResponsibilityAddDependencies for
# notes about memory responsibility.
cdef void LLVMOrcMaterializationResponsibilityAddDependenciesForAll(LLVMOrcMaterializationResponsibilityRef MR,LLVMOrcCDependenceMapPairs Dependencies,unsigned long NumPairs)


# 
# Create a "bare" JITDylib.
# 
# The client is responsible for ensuring that the JITDylib's name is unique,
# e.g. by calling LLVMOrcExecutionSessionGetJTIDylibByName first.
# 
# This call does not install any library code or symbols into the newly
# created JITDylib. The client is responsible for all configuration.
cdef LLVMOrcJITDylibRef LLVMOrcExecutionSessionCreateBareJITDylib(LLVMOrcExecutionSessionRef ES,const char * Name)


# 
# Create a JITDylib.
# 
# The client is responsible for ensuring that the JITDylib's name is unique,
# e.g. by calling LLVMOrcExecutionSessionGetJTIDylibByName first.
# 
# If a Platform is attached to the ExecutionSession then
# Platform::setupJITDylib will be called to install standard platform symbols
# (e.g. standard library interposes). If no Platform is installed then this
# call is equivalent to LLVMExecutionSessionRefCreateBareJITDylib and will
# always return success.
cdef LLVMErrorRef LLVMOrcExecutionSessionCreateJITDylib(LLVMOrcExecutionSessionRef ES,LLVMOrcJITDylibRef* Result,const char * Name)


# 
# Returns the JITDylib with the given name, or NULL if no such JITDylib
# exists.
cdef LLVMOrcJITDylibRef LLVMOrcExecutionSessionGetJITDylibByName(LLVMOrcExecutionSessionRef ES,const char * Name)


# 
# Return a reference to a newly created resource tracker associated with JD.
# The tracker is returned with an initial ref-count of 1, and must be released
# with LLVMOrcReleaseResourceTracker when no longer needed.
cdef LLVMOrcResourceTrackerRef LLVMOrcJITDylibCreateResourceTracker(LLVMOrcJITDylibRef JD)


# 
# Return a reference to the default resource tracker for the given JITDylib.
# This operation will increase the retain count of the tracker: Clients should
# call LLVMOrcReleaseResourceTracker when the result is no longer needed.
cdef LLVMOrcResourceTrackerRef LLVMOrcJITDylibGetDefaultResourceTracker(LLVMOrcJITDylibRef JD)


# 
# Add the given MaterializationUnit to the given JITDylib.
# 
# If this operation succeeds then JITDylib JD will take ownership of MU.
# If the operation fails then ownership remains with the caller who should
# call LLVMOrcDisposeMaterializationUnit to destroy it.
cdef LLVMErrorRef LLVMOrcJITDylibDefine(LLVMOrcJITDylibRef JD,LLVMOrcMaterializationUnitRef MU)


# 
# Calls remove on all trackers associated with this JITDylib, see
# JITDylib::clear().
cdef LLVMErrorRef LLVMOrcJITDylibClear(LLVMOrcJITDylibRef JD)


# 
# Add a DefinitionGenerator to the given JITDylib.
# 
# The JITDylib will take ownership of the given generator: The client is no
# longer responsible for managing its memory.
cdef void LLVMOrcJITDylibAddGenerator(LLVMOrcJITDylibRef JD,LLVMOrcDefinitionGeneratorRef DG)


# 
# Create a custom generator.
# 
# The F argument will be used to implement the DefinitionGenerator's
# tryToGenerate method (see
# LLVMOrcCAPIDefinitionGeneratorTryToGenerateFunction).
# 
# Ctx is a context object that will be passed to F. This argument is
# permitted to be null.
# 
# Dispose is the disposal function for Ctx. This argument is permitted to be
# null (in which case the client is responsible for the lifetime of Ctx).
cdef LLVMOrcDefinitionGeneratorRef LLVMOrcCreateCustomCAPIDefinitionGenerator(LLVMOrcCAPIDefinitionGeneratorTryToGenerateFunction F,void * Ctx,LLVMOrcDisposeCAPIDefinitionGeneratorFunction Dispose)


# 
# Continue a lookup that was suspended in a generator (see
# LLVMOrcCAPIDefinitionGeneratorTryToGenerateFunction).
cdef void LLVMOrcLookupStateContinueLookup(LLVMOrcLookupStateRef S,LLVMErrorRef Err)


# 
# Get a DynamicLibrarySearchGenerator that will reflect process symbols into
# the JITDylib. On success the resulting generator is owned by the client.
# Ownership is typically transferred by adding the instance to a JITDylib
# using LLVMOrcJITDylibAddGenerator,
# 
# The GlobalPrefix argument specifies the character that appears on the front
# of linker-mangled symbols for the target platform (e.g. '_' on MachO).
# If non-null, this character will be stripped from the start of all symbol
# strings before passing the remaining substring to dlsym.
# 
# The optional Filter and Ctx arguments can be used to supply a symbol name
# filter: Only symbols for which the filter returns true will be visible to
# JIT'd code. If the Filter argument is null then all process symbols will
# be visible to JIT'd code. Note that the symbol name passed to the Filter
# function is the full mangled symbol: The client is responsible for stripping
# the global prefix if present.
cdef LLVMErrorRef LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess(LLVMOrcDefinitionGeneratorRef* Result,char GlobalPrefx,LLVMOrcSymbolPredicate Filter,void * FilterCtx)


# 
# Get a LLVMOrcCreateDynamicLibararySearchGeneratorForPath that will reflect
# library symbols into the JITDylib. On success the resulting generator is
# owned by the client. Ownership is typically transferred by adding the
# instance to a JITDylib using LLVMOrcJITDylibAddGenerator,
# 
# The GlobalPrefix argument specifies the character that appears on the front
# of linker-mangled symbols for the target platform (e.g. '_' on MachO).
# If non-null, this character will be stripped from the start of all symbol
# strings before passing the remaining substring to dlsym.
# 
# The optional Filter and Ctx arguments can be used to supply a symbol name
# filter: Only symbols for which the filter returns true will be visible to
# JIT'd code. If the Filter argument is null then all library symbols will
# be visible to JIT'd code. Note that the symbol name passed to the Filter
# function is the full mangled symbol: The client is responsible for stripping
# the global prefix if present.
# 
# THIS API IS EXPERIMENTAL AND LIKELY TO CHANGE IN THE NEAR FUTURE!
#
cdef LLVMErrorRef LLVMOrcCreateDynamicLibrarySearchGeneratorForPath(LLVMOrcDefinitionGeneratorRef* Result,const char * FileName,char GlobalPrefix,LLVMOrcSymbolPredicate Filter,void * FilterCtx)


# 
# Get a LLVMOrcCreateStaticLibrarySearchGeneratorForPath that will reflect
# static library symbols into the JITDylib. On success the resulting
# generator is owned by the client. Ownership is typically transferred by
# adding the instance to a JITDylib using LLVMOrcJITDylibAddGenerator,
# 
# Call with the optional TargetTriple argument will succeed if the file at
# the given path is a static library or a MachO universal binary containing a
# static library that is compatible with the given triple. Otherwise it will
# return an error.
# 
# THIS API IS EXPERIMENTAL AND LIKELY TO CHANGE IN THE NEAR FUTURE!
#
cdef LLVMErrorRef LLVMOrcCreateStaticLibrarySearchGeneratorForPath(LLVMOrcDefinitionGeneratorRef* Result,LLVMOrcObjectLayerRef ObjLayer,const char * FileName,const char * TargetTriple)


# 
# Create a ThreadSafeContext containing a new LLVMContext.
# 
# Ownership of the underlying ThreadSafeContext data is shared: Clients
# can and should dispose of their ThreadSafeContext as soon as they no longer
# need to refer to it directly. Other references (e.g. from ThreadSafeModules)
# will keep the data alive as long as it is needed.
cdef LLVMOrcThreadSafeContextRef LLVMOrcCreateNewThreadSafeContext()


# 
# Get a reference to the wrapped LLVMContext.
cdef LLVMContextRef LLVMOrcThreadSafeContextGetContext(LLVMOrcThreadSafeContextRef TSCtx)


# 
# Dispose of a ThreadSafeContext.
cdef void LLVMOrcDisposeThreadSafeContext(LLVMOrcThreadSafeContextRef TSCtx)


# 
# Create a ThreadSafeModule wrapper around the given LLVM module. This takes
# ownership of the M argument which should not be disposed of or referenced
# after this function returns.
# 
# Ownership of the ThreadSafeModule is unique: If it is transferred to the JIT
# (e.g. by LLVMOrcLLJITAddLLVMIRModule) then the client is no longer
# responsible for it. If it is not transferred to the JIT then the client
# should call LLVMOrcDisposeThreadSafeModule to dispose of it.
cdef LLVMOrcThreadSafeModuleRef LLVMOrcCreateNewThreadSafeModule(LLVMModuleRef M,LLVMOrcThreadSafeContextRef TSCtx)


# 
# Dispose of a ThreadSafeModule. This should only be called if ownership has
# not been passed to LLJIT (e.g. because some error prevented the client from
# adding this to the JIT).
cdef void LLVMOrcDisposeThreadSafeModule(LLVMOrcThreadSafeModuleRef TSM)


# 
# Apply the given function to the module contained in this ThreadSafeModule.
cdef LLVMErrorRef LLVMOrcThreadSafeModuleWithModuleDo(LLVMOrcThreadSafeModuleRef TSM,LLVMOrcGenericIRModuleOperationFunction F,void * Ctx)


# 
# Create a JITTargetMachineBuilder by detecting the host.
# 
# On success the client owns the resulting JITTargetMachineBuilder. It must be
# passed to a consuming operation (e.g.
# LLVMOrcLLJITBuilderSetJITTargetMachineBuilder) or disposed of by calling
# LLVMOrcDisposeJITTargetMachineBuilder.
cdef LLVMErrorRef LLVMOrcJITTargetMachineBuilderDetectHost(LLVMOrcJITTargetMachineBuilderRef* Result)


# 
# Create a JITTargetMachineBuilder from the given TargetMachine template.
# 
# This operation takes ownership of the given TargetMachine and destroys it
# before returing. The resulting JITTargetMachineBuilder is owned by the client
# and must be passed to a consuming operation (e.g.
# LLVMOrcLLJITBuilderSetJITTargetMachineBuilder) or disposed of by calling
# LLVMOrcDisposeJITTargetMachineBuilder.
cdef LLVMOrcJITTargetMachineBuilderRef LLVMOrcJITTargetMachineBuilderCreateFromTargetMachine(LLVMTargetMachineRef TM)


# 
# Dispose of a JITTargetMachineBuilder.
cdef void LLVMOrcDisposeJITTargetMachineBuilder(LLVMOrcJITTargetMachineBuilderRef JTMB)


# 
# Returns the target triple for the given JITTargetMachineBuilder as a string.
# 
# The caller owns the resulting string as must dispose of it by calling
# LLVMDisposeMessage
cdef char * LLVMOrcJITTargetMachineBuilderGetTargetTriple(LLVMOrcJITTargetMachineBuilderRef JTMB)


# 
# Sets the target triple for the given JITTargetMachineBuilder to the given
# string.
cdef void LLVMOrcJITTargetMachineBuilderSetTargetTriple(LLVMOrcJITTargetMachineBuilderRef JTMB,const char * TargetTriple)


# 
# Add an object to an ObjectLayer to the given JITDylib.
# 
# Adds a buffer representing an object file to the given JITDylib using the
# given ObjectLayer instance. This operation transfers ownership of the buffer
# to the ObjectLayer instance. The buffer should not be disposed of or
# referenced once this function returns.
# 
# Resources associated with the given object will be tracked by the given
# JITDylib's default ResourceTracker.
cdef LLVMErrorRef LLVMOrcObjectLayerAddObjectFile(LLVMOrcObjectLayerRef ObjLayer,LLVMOrcJITDylibRef JD,LLVMMemoryBufferRef ObjBuffer)


# 
# Add an object to an ObjectLayer using the given ResourceTracker.
# 
# Adds a buffer representing an object file to the given ResourceTracker's
# JITDylib using the given ObjectLayer instance. This operation transfers
# ownership of the buffer to the ObjectLayer instance. The buffer should not
# be disposed of or referenced once this function returns.
# 
# Resources associated with the given object will be tracked by
# ResourceTracker RT.
cdef LLVMErrorRef LLVMOrcObjectLayerAddObjectFileWithRT(LLVMOrcObjectLayerRef ObjLayer,LLVMOrcResourceTrackerRef RT,LLVMMemoryBufferRef ObjBuffer)


# 
# Emit an object buffer to an ObjectLayer.
# 
# Ownership of the responsibility object and object buffer pass to this
# function. The client is not responsible for cleanup.
cdef void LLVMOrcObjectLayerEmit(LLVMOrcObjectLayerRef ObjLayer,LLVMOrcMaterializationResponsibilityRef R,LLVMMemoryBufferRef ObjBuffer)


# 
# Dispose of an ObjectLayer.
cdef void LLVMOrcDisposeObjectLayer(LLVMOrcObjectLayerRef ObjLayer)



cdef void LLVMOrcIRTransformLayerEmit(LLVMOrcIRTransformLayerRef IRTransformLayer,LLVMOrcMaterializationResponsibilityRef MR,LLVMOrcThreadSafeModuleRef TSM)


# 
# Set the transform function of the provided transform layer, passing through a
# pointer to user provided context.
cdef void LLVMOrcIRTransformLayerSetTransform(LLVMOrcIRTransformLayerRef IRTransformLayer,LLVMOrcIRTransformLayerTransformFunction TransformFunction,void * Ctx)


# 
# Set the transform function on an LLVMOrcObjectTransformLayer.
cdef void LLVMOrcObjectTransformLayerSetTransform(LLVMOrcObjectTransformLayerRef ObjTransformLayer,LLVMOrcObjectTransformLayerTransformFunction TransformFunction,void * Ctx)


# 
# Create a LocalIndirectStubsManager from the given target triple.
# 
# The resulting IndirectStubsManager is owned by the client
# and must be disposed of by calling LLVMOrcDisposeDisposeIndirectStubsManager.
cdef LLVMOrcIndirectStubsManagerRef LLVMOrcCreateLocalIndirectStubsManager(const char * TargetTriple)


# 
# Dispose of an IndirectStubsManager.
cdef void LLVMOrcDisposeIndirectStubsManager(LLVMOrcIndirectStubsManagerRef ISM)



cdef LLVMErrorRef LLVMOrcCreateLocalLazyCallThroughManager(const char * TargetTriple,LLVMOrcExecutionSessionRef ES,unsigned long ErrorHandlerAddr,LLVMOrcLazyCallThroughManagerRef* LCTM)


# 
# Dispose of an LazyCallThroughManager.
cdef void LLVMOrcDisposeLazyCallThroughManager(LLVMOrcLazyCallThroughManagerRef LCTM)


# 
# Create a DumpObjects instance.
# 
# DumpDir specifies the path to write dumped objects to. DumpDir may be empty
# in which case files will be dumped to the working directory.
# 
# IdentifierOverride specifies a file name stem to use when dumping objects.
# If empty then each MemoryBuffer's identifier will be used (with a .o suffix
# added if not already present). If an identifier override is supplied it will
# be used instead, along with an incrementing counter (since all buffers will
# use the same identifier, the resulting files will be named <ident>.o,
# <ident>.2.o, <ident>.3.o, and so on). IdentifierOverride should not contain
# an extension, as a .o suffix will be added by DumpObjects.
cdef LLVMOrcDumpObjectsRef LLVMOrcCreateDumpObjects(const char * DumpDir,const char * IdentifierOverride)


# 
# Dispose of a DumpObjects instance.
cdef void LLVMOrcDisposeDumpObjects(LLVMOrcDumpObjectsRef DumpObjects)


# 
# Dump the contents of the given MemoryBuffer.
cdef LLVMErrorRef LLVMOrcDumpObjects_CallOperator(LLVMOrcDumpObjectsRef DumpObjects,LLVMMemoryBufferRef* ObjBuffer)
