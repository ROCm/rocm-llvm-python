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

from libc.stdint cimport *
ctypedef bint _Bool # bool is not a reserved keyword in C, _Bool is
from rocm.llvm.c.cdatatypes cimport *
from rocm.llvm.c.ctypes cimport *
# 
# This function permanently loads the dynamic library at the given path.
# It is safe to call this function multiple times for the same library.
# 
# @see sys::DynamicLibrary::LoadLibraryPermanently()
cdef int LLVMLoadLibraryPermanently(const char * Filename)


# 
# This function parses the given arguments using the LLVM command line parser.
# Note that the only stable thing about this function is its signature; you
# cannot rely on any particular set of command line arguments being interpreted
# the same way across LLVM versions.
# 
# @see llvm::cl::ParseCommandLineOptions()
cdef void LLVMParseCommandLineOptions(int argc,const char *const * argv,const char * Overview)


# 
# This function will search through all previously loaded dynamic
# libraries for the symbol \p symbolName. If it is found, the address of
# that symbol is returned. If not, null is returned.
# 
# @see sys::DynamicLibrary::SearchForAddressOfSymbol()
cdef void * LLVMSearchForAddressOfSymbol(const char * symbolName)


# 
# This functions permanently adds the symbol \p symbolName with the
# value \p symbolValue.  These symbols are searched before any
# libraries.
# 
# @see sys::DynamicLibrary::AddSymbol()
cdef void LLVMAddSymbol(const char * symbolName,void * symbolValue)