<!-- MIT License
  --
  -- Copyright (c) 2023-2026 Advanced Micro Devices, Inc.
  --
  -- Permission is hereby granted, free of charge, to any person obtaining a copy
  -- of this software and associated documentation files (the "Software"), to deal
  -- in the Software without restriction, including without limitation the rights
  -- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  -- copies of the Software, and to permit persons to whom the Software is
  -- furnished to do so, subject to the following conditions:
  --
  -- The above copyright notice and this permission notice shall be included in all
  -- copies or substantial portions of the Software.
  --
  -- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  -- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  -- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  -- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  -- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  -- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  -- SOFTWARE.
  -->
# ROCm LLVM Python

This repository provides low-level Python and Cython Bindings for ROCm LLVM.

## Requirements

* Currently, only Linux is supported (prebuilt packages and code).
  * Prebuilt packages distributed via PyPI (or Test PyPI) are only provided for
    Linux systems that agree with the `manylinux_2_17_x86_64` tag.
* Requires that a compatible ROCm&trade; HIP SDK is installed on your system.
  * Source code is provided only for particular ROCm versions.
    * See the `git` branches tagged with `release/rocm-rel-X.Y[.Z]`
  * Prebuilt packages are built only for particular ROCm versions.

> [!NOTE]
> You may find that packages for one ROCm release are compatible with
> the ROCm HIP SDK of other releases as the ROCm LLVM Python functions load
> C functions in a lazy manner.

### Build requirements

* A Linux operating system
* A C compiler
* `bash`, `python3` + `venv`
* The ROCm HIP SDK including the ROCm LLVM Compiler's C-API headers.
* Python 3.8+.

## Install Prebuilt Packages

> [!NOTE]
> Prebuilt packages for some ROCm releases are published to Test PyPI first.
> Check the `simple` lists to see if your operating system and Python version
> is supported: [rocm-llvm-python](https://test.pypi.org/simple/rocm-llvm-python/).

***

> [!IMPORTANT]
> Ensure that `pip` has at least version `24.0`, please upgrade it otherwise.

***

> [!CAUTION]
> We have only uploaded ROCm LLVM Python **dummy** packages to PyPI for
> security reasons. Note that they do not distribute any ROCm LLVM Python
> functionality. Please use the ones from Test PyPI for now.

### Via TestPyPI

First identify the first three digits of the version number of your
ROCm&trade; installation. Then install the ROCm LLVM Python package(s) as follows:

<!-- markdownlint-disable  MD013 -->

```shell
python3 -m pip install -i https://test.pypi.org/simple rocm-llvm-python~=$rocm_version.0
# Example: python3 -m pip install -i https://test.pypi.org/simple rocm-llvm-python~=7.2.0.0
```

<!-- markdownlint-enable  MD013 -->

### Via Wheel File

If you have a ROCm LLVM Python package wheel on your filesystem, you can run:

```shell
python3 -m pip install $path_to_rocm_llvm_python.whl
```

## Build from Source

1. Install ROCM.
2. Install `pip`, virtual environment and development headers for Python 3:

   ```shell
   # Ubuntu:
   sudo apt install python3-pip python3-venv python3-dev
   ```

3. Select the feature branch `release/rocm-rel-X.Y[.Z]` for your particular
   ROCm installation.
4. Finally run:

   ```shell
   ./build.sh --post-clean
   ```

The build process will produce a Python binary wheel in the subdirectory
`rocm-llvm-python/dist/`, which can be installed as discussed in the previous section.

### Build Options

<!-- markdownlint-disable  MD013 -->

```text
Usage: ./build.sh [OPTIONS]

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
  -n, --no-_venv          Do not create and use a virtual Python environment.
  -h, --help             Show this help message.
```

<!-- markdownlint-enable  MD013 -->

## LICENSE

```text
MIT License

Copyright (c) 2023-2026 Advanced Micro Devices, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
