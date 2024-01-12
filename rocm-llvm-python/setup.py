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

"""This is the package's setup script.

It cythonizes and compiles the Cython
files in the `rocm/llvm` and `rocm/amd_comgr` subfolders.
"""

__author__ = "Advanced Micro Devices, Inc. <hip-python.maintainer@amd.com>"

import os

from setuptools import setup, Extension
from Cython.Build import cythonize


def parse_options():
    global ROCM_LLVM_INC
    global ROCM_LLVM_LIB
    global EXTRA_COMPILE_ARGS
    global ROCM_LLVM_PYTHON_LIBS
    global ROCM_LLVM_PYTHON_RUNTIME_LINKING

    def get_bool_environ_var(env_var, default):
        yes_vals = ("true", "1", "t", "y", "yes")
        no_vals = ("false", "0", "f", "n", "no")
        value = os.environ.get(env_var, default).lower()
        if value in yes_vals:
            return True
        elif value in no_vals:
            return False
        else:
            allowed_vals = ", ".join(
                [f"'{a}'" for a in (list(yes_vals) + list(no_vals))]
            )
            raise RuntimeError(
                f"value of '{env_var}' must be one of (case-insensitive): {allowed_vals}"
            )

    rocm_path = os.environ.get("ROCM_PATH", os.environ.get("ROCM_HOME", None))
    ROCM_LLVM_PYTHON_LIBS = os.environ.get("ROCM_LLVM_PYTHON_LIBS", "*")
    ROCM_LLVM_PYTHON_RUNTIME_LINKING = get_bool_environ_var(
        "ROCM_LLVM_PYTHON_RUNTIME_LINKING", "yes"
    )

    if not rocm_path:
        raise RuntimeError("ROCm path is not set")
    ROCM_LLVM_INC = [
        os.path.join(rocm_path, "include"),
        os.path.join(rocm_path, "llvm", "include"),
    ]
    ROCM_LLVM_LIB = [
        os.path.join(rocm_path, "lib"),
        os.path.join(rocm_path, "llvm", "lib"),
    ]

    EXTRA_COMPILE_ARGS = [f"-I{dir}" for dir in ROCM_LLVM_INC]


def create_extension(name, sources, ROCM_LLVM_PYTHON_MODULES):
    global ROCM_LLVM_INC
    global ROCM_LLVM_LIB
    global ROCM_LLVM_PYTHON_RUNTIME_LINKING
    return Extension(
        name,
        sources=sources,
        include_dirs=ROCM_LLVM_INC,
        library_dirs=ROCM_LLVM_LIB,
        libraries=[]
        if ROCM_LLVM_PYTHON_RUNTIME_LINKING
        else [mod.lib for mod in ROCM_LLVM_PYTHON_MODULES],
        language="c",
        extra_compile_args=EXTRA_COMPILE_ARGS,
    )


class Module:
    PKG_NAME = "rocm.llvm"

    def __init__(self, global_module_name: str):
        parts = global_module_name.split(".")
        self.pkg_path = "/".join(parts[:-1])
        self.pkg_name = ".".join(parts[:-1])
        self.name = parts[-1]
        self._helpers = []

    @property
    def ext_modules(self):
        return self._helpers + [
            (f"{self.pkg_name}.c{self.name}", [f"./{self.pkg_path}/c{self.name}.pyx"]),
            (f"{self.pkg_name}.{self.name}", [f"./{self.pkg_path}/{self.name}.pyx"]),
        ]


# differs between rocm-llvm-python and rocm-llvm-python-as-cuda package
def gather_ext_modules(global_module_names: str):
    global CYTHON_EXT_MODULES
    global ROCM_LLVM_PYTHON_LIBS
    ROCM_LLVM_PYTHON_MODULES = [Module(a) for a in global_module_names]

    # process and check user-provided library names
    module_names = [mod.name for mod in ROCM_LLVM_PYTHON_MODULES]
    if ROCM_LLVM_PYTHON_LIBS == "*":
        selected_libs = module_names
    else:
        processed_libs = ROCM_LLVM_PYTHON_LIBS.replace(" ", "")
        if processed_libs.startswith("^"):
            processed_libs = processed_libs[1:].split(",")
            selected_libs = [
                name for name in module_names if name not in processed_libs
            ]
        else:
            processed_libs = processed_libs.split(",")
            selected_libs = processed_libs
        for name in processed_libs:
            if name not in module_names:
                raise ValueError(
                    f"library name '{name}' is not valid, use one of: {', '.join(module_names)}"
                )

    for mod in ROCM_LLVM_PYTHON_MODULES:
        if mod.name in selected_libs:
            CYTHON_EXT_MODULES += mod.ext_modules
    return ROCM_LLVM_PYTHON_MODULES


if __name__ == "__main__":
    ROCM_LLVM_PYTHON_LIBS = None
    ROCM_LLVM_PYTHON_RUNTIME_LINKING = True
    ROCM_LLVM_INC = []
    ROCM_LLVM_LIB = []
    EXTRA_COMPILE_ARGS = None

    parse_options()
    CYTHON_EXT_MODULES = []
    CYTHON_EXT_MODULES.append(
        ("rocm.llvm._util.types", ["./rocm/llvm/_util/types.pyx"])
    )
    CYTHON_EXT_MODULES.append(
        ("rocm.llvm._util.posixloader", ["./rocm/llvm/_util/posixloader.pyx"])
    )

    # load _version.py
    _rocm_llvm_version_dict = {}
    _amd_comgr_version_dict = {}
    exec(
        open(os.path.join("rocm", "llvm", "_version.py"), "r").read(),
        _rocm_llvm_version_dict,
    )
    exec(
        open(os.path.join("rocm", "amd_comgr", "_version.py"), "r").read(),
        _amd_comgr_version_dict,
    )

    ROCM_LLVM_PYTHON_MODULES = gather_ext_modules(
        _rocm_llvm_version_dict["ROCM_LLVM_PYTHON_MODULE_LIST"]
    )
    ROCM_LLVM_PYTHON_MODULES += gather_ext_modules(
        _amd_comgr_version_dict["AMD_COMGR_PYTHON_MODULE_LIST"]
    )
    ext_modules = []
    for name, sources in CYTHON_EXT_MODULES:
        extension = create_extension(name, sources, ROCM_LLVM_PYTHON_MODULES)
        ext_modules += cythonize(
            [extension],
            compiler_directives=dict(
                embedsignature=True,
                language_level=3,
            ),
        )

    setup(
        ext_modules=ext_modules,
        version=_rocm_llvm_version_dict["__version__"],
    )
