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
import argparse

from rocm.llvm.c.core import *
from rocm.llvm.c.executionengine import *
from rocm.llvm.c.target import *
from rocm.llvm.c.targetmachine import *
from rocm.llvm.c.analysis import *
from rocm.llvm.c.bitwriter import *
from rocm.llvm._util.types import Pointer

parser = argparse.ArgumentParser(description="Computes `x + y` via the LLVM interpreter")
parser.add_argument("x",type=int)
parser.add_argument("y",type=int)
args = parser.parse_args()

# Build the code
builder = LLVMCreateBuilder()

# Note that the LLVM C APIs will typically not copy 
# bytes/strings. Hence the Python objects that you pass
# to them should not go out of scope during the lifetime
# of the respective LLVM C object.

mod = LLVMModuleCreateWithName(b"my_module") 

param_types = [ LLVMInt32Type(), LLVMInt32Type() ]
ret_type = LLVMFunctionType(LLVMInt32Type(), param_types, 2, 0)
sumfn = LLVMAddFunction(mod, b"sum", ret_type)

entry = LLVMAppendBasicBlock(sumfn, b"entry")

LLVMPositionBuilderAtEnd(builder, entry)
tmp = LLVMBuildAdd(builder, LLVMGetParam(sumfn, 0), LLVMGetParam(sumfn, 1), b"tmp")
LLVMBuildRet(builder, tmp)

# Verify
_, error = LLVMVerifyModule(mod, LLVMVerifierFailureAction.LLVMAbortProcessAction)
if error:
    print(f"error: {error}",file=sys.stderr)
    LLVMDisposeMessage(error)

# Interpret the code with arguments from CLI
LLVMLinkInInterpreter()
# LLVMInitializeNativeTarget() # TODO symbol undefined because of static inline in header
# LLVMInitializeAllTargets()   # TODO symbol undefined because of static inline in header
status, engine, error = LLVMCreateExecutionEngineForModule(mod)
if status != 0:
    print("failed to create execution engine",file=sys.stderr)
    if error:
        print(f"error: {error}",file=sys.stderr)
        LLVMDisposeMessage(error)
        sys.abort()

sumfn = LLVMGetNamedFunction(mod, b"sum")
parms = [
    LLVMCreateGenericValueOfInt(LLVMInt32Type(), args.x, 0),
    LLVMCreateGenericValueOfInt(LLVMInt32Type(), args.y, 0),
]
res = LLVMRunFunction(engine, sumfn, 2, parms)
print(f"{LLVMGenericValueToInt(res, 0)}")
        
# Out to file
if LLVMWriteBitcodeToFile(mod, b"sum.bc") != 0:
    print(f"error while writing file 'sum.bc', skipping",file=sys.stderr)

# shutdown
LLVMDisposeExecutionEngine(engine)
# LLVMDisposeModule(mod) # TODO you can either call this or the above.
                         # Otherwise you get a segfualt, investigate further.
LLVMDisposeBuilder(builder)
