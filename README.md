<!-- Copyright (c) 2023-2024 Advanced Micro Devices, Inc. -->

# ROCm LLVM Python Source Repository

This repository provides Cython and Python bindings to the (ROCm) LLVM and AMD COMGR C API. Also ships the official LLVM Clang Python bindings from the same ROCm release.

## Requirements

* Currently, only Linux is supported (prebuilt packages and code).
  * Prebuilt packages distributed via PyPI (or Test PyPI) are only provided for Linux systems that agree with the `manylinux_2_17_x86_64` tag.
* Requires that a compatible ROCm&trade; HIP SDK is installed on your system.
  * Source code is provided only for particular ROCm versions.
    * See the git branches tagged with `release/rocm-rel-X.Y[.Z]`
  * Prebuilt packages are built only for particular ROCm versions. 

> [!NOTE]
> You may find that packages for one ROCm&trade; release might be compatible with the ROCm&trade; HIP SDK of another release as the ROCm LLVM Python functions load HIP C functions in a lazy manner.

### Build requirements

* All Python requirements are taking care of by installation scripts. 
If you decide not to use these scripts, take a look into the `requirements.txt` file 
in the top-level folder of the this repository and those 
in the repository's subfolder `rocm-llvm-python`.

## Install Prebuilt Package(s)

<!--
> **NOTE**: The prebuilt packages might not be available on PyPI directly after a ROCm release as this project is not an official part of the ROCm HIP SDK yet and thus is not fully integrated into the global ROCm HIP SDK build process. Check the `simple` lists to see if your operating system and Python version is supported: [rocm-llvm-python](https://test.pypi.org/simple/rocm-llvm-python/), [rocm-llvm-python-as-cuda](https://test.pypi.org/simple/rocm-llvm-python-as-cuda/).
-->

> [!NOTE]
> Prebuilt packages for some ROCm releases are published to Test PyPI first. Check the `simple` lists to see if your operating system and Python version is supported: [rocm-llvm-python](https://test.pypi.org/simple/rocm-llvm-python/).

> [!CAUTION]
> We have not uploaded any ROCm LLVM Python packages to PyPI. So far we have only uploaded packages to TestPyPI, mainly intended for internal testing purposes. If you find similar named packages on PyPI they may been provided by others, possibly with malicious intent.

### Via TestPyPI

First identify the first two or three digits of the version number of your ROCm&trade; installation.
Then install the ROCm LLVM Python package(s) as follows:

```shell
python3 -m pip install -i https://test.pypi.org/simple rocm-llvm-python~=$rocm_version
```

<!--
-- #### Via TestPyPI
-- 
-- Packages can be installed via the TestPyPI index by prefixing the
-- the PIP install commands as follows:
-- 
-- ```shell
-- python3 -m pip install -i https://test.pypi.org/simple ...
-- ```
-->

### Via Wheel in Local Filesystem

If you have ROCm LLVM Python package wheels somewhere in your filesystem, you can also run:

```shell
python3 -m pip install <path/to/rocm_llvm_python>.whl
```

> **NOTE**: See the ROCm LLVM Python user guide for more details:
> https://rocm.docs.amd.com/projects/rocm-llvm-python/en/latest/index.html

## Build From Source

> [!NOTE]
> The `main` branch is used for tracking updates to the docs, examples and CI scripts. 
> The source code can be found on the release branches `relaese/rocm-rel-X.Y[.Z]`.

1. Install ROCM
1. Install `pip`, virtual environment and development headers for Python 3:
   ```bash
   # Ubuntu:
   sudo apt install python3-pip python3-venv python3-dev
   ```
1. Check out the feature branch `release/rocm-rel-X.Y[.Z]` for your particular ROCm&trade; installation:
1. Initialize the branch:
   ```bash
   ./init.sh
   ```
1. Finally run:
   ```bash
   ./build_pkg.sh --post-clean
   ```

> [!NOTE]
> See the ROCm LLVM Python developer guide for more details:
> https://rocm.docs.amd.com/projects/rocm-llvm-python/en/latest/index.html

### Build Options

```
Usage: ./build_pkg.sh [OPTIONS]

Options:
  --rocm-path            Path to a ROCm installation, defaults to variable 'ROCM_PATH' if set or '/opt/rocm'.
  --libs                 Libraries to build as comma separated list without whitespaces, defaults to variable 'ROCM_LLVM_PYTHON_LIBS' if set or '*'.
                         Add a prefix '^' to NOT build the comma-separated list of libraries that follows but all other libraries.
  --no-build             Do not build package 'rocm-llvm-python'.
  --no-docs              Do not build the docs of package 'rocm-llvm-python'.
  --no-build-librocmllvm Do not build the librocmllvm shared object.
  --no-api-docs          Temporarily move the 'rocm-llvm-python/docs/python_api' subfolder so that sphinx does not see it.
  --no-clean-docs        Do not generate docs from scratch, i.e. don't run sphinx with -E switch.
  --run-tests            Run the tests.
  --no-archive           Do not put previously created packages into the archive folder.
  -j,--num-jobs          Number of build jobs to use. Defaults to 1.
  --pre-clean            Remove the virtual Python environment subfolder '_venv' --- if it exists --- before all other tasks.
  --post-clean           Remove the virtual Python environment subfolder '_venv' --- if it exists --- after all other tasks.
  -n, --no-venv          Do not create and use a virtual Python environment.
  -h, --help             Show this help message.
```

> [!NOTE]
> See the ROCm LLVM Python developer guide for more details:
> https://rocm.docs.amd.com/projects/rocm-llvm-python/en/latest/index.html

## Documentation

> [!NOTE]
> Documentation pages have not been published yet.

For examples, guides and API reference, please take a
look at the official ROCm LLVM Python documentation pages:

https://rocm.docs.amd.com/projects/rocm-llvm-python/en/latest/index.html
