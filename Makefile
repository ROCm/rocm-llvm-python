# Use environment variable ROCM_PATH to point to your ROCm installation if it's not the default, `/opt/rocm`.
# FIXME replace this Makefile by a cmake approach.
SHELL=/usr/bin/bash

ROCM_PATH ?= /opt/rocm

C_HEADERS ?= $(shell find $(ROCM_PATH)/llvm/include/llvm-c/ -name "*.h")
STATIC_LIBS ?= $(shell find $(ROCM_PATH)/llvm/lib -name "libLLVM*.a") 

librocmllvm.so: $(STATIC_LIBS)
	gcc -shared -Wl,--whole-archive $^ -Wl,--no-whole-archive -o $@

llvm-c.h: $(C_HEADERS)
	printf "" > $@
	for f in $(C_HEADERS); do echo "#include \"$$f\"" >> $@; done

clean:
	rm -f librocmllvm.so llvm-c.h
