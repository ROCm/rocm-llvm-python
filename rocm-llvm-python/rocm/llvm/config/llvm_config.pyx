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


"""
(No short description)

Attributes:
    LLVM_DEFAULT_TARGET_TRIPLE (`~.bytes`):
        Macro constant.

    LLVM_ENABLE_THREADS (`~.bool`):
        Macro constant.

    LLVM_HAS_ATOMICS (`~.bool`):
        Macro constant.

    LLVM_HOST_TRIPLE (`~.bytes`):
        Macro constant.

    LLVM_ON_UNIX (`~.bool`):
        Macro constant.

    LLVM_USE_INTEL_JITEVENTS (`~.bool`):
        Macro constant.

    LLVM_USE_OPROFILE (`~.bool`):
        Macro constant.

    LLVM_USE_PERF (`~.bool`):
        Macro constant.

    LLVM_VERSION_MAJOR (`~.int`):
        Macro constant.

    LLVM_VERSION_MINOR (`~.int`):
        Macro constant.

    LLVM_VERSION_PATCH (`~.int`):
        Macro constant.

    LLVM_VERSION_STRING (`~.bytes`):
        Macro constant.

    LLVM_FORCE_ENABLE_STATS (`~.bool`):
        Macro constant.

    LLVM_ENABLE_ZLIB (`~.bool`):
        Macro constant.

    LLVM_ENABLE_ZSTD (`~.bool`):
        Macro constant.

    HAVE_SYSEXITS_H (`~.bool`):
        Macro constant.

    LLVM_UNREACHABLE_OPTIMIZE (`~.bool`):
        Macro constant.

    LLVM_ENABLE_DIA_SDK (`~.bool`):
        Macro constant.

    LLVM_ENABLE_PLUGINS (`~.bool`):
        Macro constant.

"""

import cython
import ctypes
import enum
LLVM_DEFAULT_TARGET_TRIPLE = cllvm_config.LLVM_DEFAULT_TARGET_TRIPLE

LLVM_ENABLE_THREADS = cllvm_config.LLVM_ENABLE_THREADS

LLVM_HAS_ATOMICS = cllvm_config.LLVM_HAS_ATOMICS

LLVM_HOST_TRIPLE = cllvm_config.LLVM_HOST_TRIPLE

LLVM_ON_UNIX = cllvm_config.LLVM_ON_UNIX

LLVM_USE_INTEL_JITEVENTS = cllvm_config.LLVM_USE_INTEL_JITEVENTS

LLVM_USE_OPROFILE = cllvm_config.LLVM_USE_OPROFILE

LLVM_USE_PERF = cllvm_config.LLVM_USE_PERF

LLVM_VERSION_MAJOR = cllvm_config.LLVM_VERSION_MAJOR

LLVM_VERSION_MINOR = cllvm_config.LLVM_VERSION_MINOR

LLVM_VERSION_PATCH = cllvm_config.LLVM_VERSION_PATCH

LLVM_VERSION_STRING = cllvm_config.LLVM_VERSION_STRING

LLVM_FORCE_ENABLE_STATS = cllvm_config.LLVM_FORCE_ENABLE_STATS

LLVM_ENABLE_ZLIB = cllvm_config.LLVM_ENABLE_ZLIB

LLVM_ENABLE_ZSTD = cllvm_config.LLVM_ENABLE_ZSTD

HAVE_SYSEXITS_H = cllvm_config.HAVE_SYSEXITS_H

LLVM_UNREACHABLE_OPTIMIZE = cllvm_config.LLVM_UNREACHABLE_OPTIMIZE

LLVM_ENABLE_DIA_SDK = cllvm_config.LLVM_ENABLE_DIA_SDK

LLVM_ENABLE_PLUGINS = cllvm_config.LLVM_ENABLE_PLUGINS

__all__ = [
    "LLVM_DEFAULT_TARGET_TRIPLE",
    "LLVM_ENABLE_THREADS",
    "LLVM_HAS_ATOMICS",
    "LLVM_HOST_TRIPLE",
    "LLVM_ON_UNIX",
    "LLVM_USE_INTEL_JITEVENTS",
    "LLVM_USE_OPROFILE",
    "LLVM_USE_PERF",
    "LLVM_VERSION_MAJOR",
    "LLVM_VERSION_MINOR",
    "LLVM_VERSION_PATCH",
    "LLVM_VERSION_STRING",
    "LLVM_FORCE_ENABLE_STATS",
    "LLVM_ENABLE_ZLIB",
    "LLVM_ENABLE_ZSTD",
    "HAVE_SYSEXITS_H",
    "LLVM_UNREACHABLE_OPTIMIZE",
    "LLVM_ENABLE_DIA_SDK",
    "LLVM_ENABLE_PLUGINS",
]