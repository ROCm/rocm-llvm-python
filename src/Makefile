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
