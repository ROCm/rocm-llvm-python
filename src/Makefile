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

# Use environment variable ROCM_PATH to point to your ROCm installation if it's not the default, `/opt/rocm`.
# FIXME replace this Makefile by a cmake approach.
SHELL=/usr/bin/bash

.PHONY: clean

ROCM_PATH ?= /opt/rocm

STATIC_LIBS ?= $(shell $(ROCM_PATH)/llvm/bin/llvm-config --libfiles)

LINKER = $(ROCM_PATH)/llvm/bin/clang++
LDFLAGS = $(shell $(ROCM_PATH)/llvm/bin/llvm-config --cxxflags --ldflags --system-libs --libs core)

Target.o: $(Target.cpp)
	#$(LINKER) $(LDFLAGS) --preprocess Target.cpp -o Target.prec.cpp
	$(LINKER) -c Target.cpp -o Target.o $(LDFLAGS)

librocmllvm.so: Target.o $(STATIC_LIBS)
	$(LINKER) -shared -Wl,--whole-archive $^ -Wl,--no-whole-archive $(LDFLAGS) -o $@

clean:
	rm -f librocmllvm.so Target.o llvm-c.h
