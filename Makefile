# Use environment variable ROCM_PATH to point to your ROCm installation if it's not the default, `/opt/rocm`.
# FIXME replace this Makefile by a cmake approach.
SHELL=/usr/bin/bash

.PHONY: clean

ROCM_PATH ?= /opt/rocm

C_HEADERS ?= $(shell find $(ROCM_PATH)/llvm/include/llvm-c/ -name "*.h")
STATIC_LIBS ?= $(shell $(ROCM_PATH)/llvm/bin/llvm-config --libfiles) 

LINKER = $(ROCM_PATH)/llvm/bin/clang++
LDFLAGS = $(shell $(ROCM_PATH)/llvm/bin/llvm-config --cxxflags --ldflags --system-libs --libs core) 

librocmllvm.so: $(STATIC_LIBS)
	$(LINKER) -shared -Wl,--whole-archive $^ -Wl,--no-whole-archive $(LDFLAGS) -o $@

llvm-c.h: $(C_HEADERS)
	printf "" > $@
	for f in $(C_HEADERS); do echo "#include \"$$f\"" >> $@; done

clean:
	rm -f librocmllvm.so llvm-c.h
