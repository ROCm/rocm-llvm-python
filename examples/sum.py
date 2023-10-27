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

# This is derivative work based on https://github.com/paulsmith/getting-started-llvm-c-api/blob/master/sum.c ,
# which was placed into the public domain (https://github.com/paulsmith/getting-started-llvm-c-api/blob/master/COPYING).

#!/usr/bin/env python3

# LLVM equivalent of:
# int sum(int a, int b) {
#     return a + b
# }

import sys

from rocm.llvm.c.core import *
from rocm.llvm.c.executionengine import *
from rocm.llvm.c.target import *
from rocm.llvm.c.targetmachine import *
from rocm.llvm.c.analysis import *
from rocm.llvm.c.bitwriter import *
from rocm.llvm._util.types import Pointer

mod = LLVMModuleCreateWithName(b"my_module")

param_types = [ LLVMInt32Type(), LLVMInt32Type() ]
ret_type = LLVMFunctionType(LLVMInt32Type(), param_types, 2, 0)
sum = LLVMAddFunction(mod, b"sum", ret_type)

entry = LLVMAppendBasicBlock(sum, b"entry")

builder = LLVMCreateBuilder()
LLVMPositionBuilderAtEnd(builder, entry)
tmp = LLVMBuildAdd(builder, LLVMGetParam(sum, 0), LLVMGetParam(sum, 1), b"tmp")
LLVMBuildRet(builder, tmp)


error = Pointer(None)
LLVMVerifyModule(mod, LLVMVerifierFailureAction.LLVMAbortProcessAction,error) # `error` carries address of char* -> char**
#LLVMDisposeMessage(error) # FIXME error is assumed as bytes

LLVMLinkInMCJIT()
# LLVMInitializeNativeTarget() # TODO undefined because of static inline in header
# LLVMInitializeAllTargets()   # TODO undefined because of static inline in header
(status, engine) = LLVMCreateExecutionEngineForModule(mod,error)
if status != 0: # FIXME memory leak bc of error mesage
    print("failed to create execution engine",file=sys.stderr)
    sys.abort()
# if error:# FIXME error is semicolon, what does that mean?
#     print(f"error: {error}",file=sys.stderr)
#     LLVMDisposeMessage(error) # FIXME error is assumed as bytes
#     # sys.exit(1)

x =  11
y = 111

args = [
    LLVMCreateGenericValueOfInt(LLVMInt32Type(), x, 0),
    LLVMCreateGenericValueOfInt(LLVMInt32Type(), y, 0),
]
res = LLVMRunFunction(engine, sum, 2, args) # FIXME make list of pointer
print(f"{LLVMGenericValueToInt(res, 0)}")
# 
# out to file
if LLVMWriteBitcodeToFile(mod, b"sum.bc") != 0:
    print(f"error while writing file 'sum.bc', skipping",file=sys.stderr)

LLVMDisposeBuilder(builder)
LLVMDisposeExecutionEngine(engine)
