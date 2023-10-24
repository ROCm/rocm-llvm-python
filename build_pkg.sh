#!/usr/bin/env bash
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
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
   echo "ERROR: script must not be sourced";
   return 1
fi

HELP_MSG="
Usage: ./$(basename $0) [OPTIONS]

Options:
  --rocm-path        Path to a ROCm installation, defaults to variable 'ROCM_PATH' if set or '/opt/rocm'.
  --libs             Libraries to build as comma separated list without whitespaces, defaults to variable 'ROCM_LLVM_LIBS' if set or '*'.
                     Add a prefix '^' to NOT build the comma-separated list of libraries that follows but all other libraries.
  --no-build         Do not build package 'rocm-llvm'.
  --no-docs          Do not build the docs of package 'rocm-llvm'.
  --no-api-docs      Temporarily move the 'rocm-llvm/docs/python_api' subfolder so that sphinx does not see it.
  --no-clean-docs    Do not generate docs from scratch, i.e. don't run sphinx with -E switch.
  --run-tests        Run the tests.
  -j,--num-jobs      Number of build jobs to use (currently only applied for building docs). Defaults to 1.
  --pre-clean        Remove the virtual Python environment subfolder '_venv' --- if it exists --- before all other tasks.
  --post-clean       Remove the virtual Python environment subfolder '_venv' --- if it exists --- after all other tasks.
  -n, --no-venv      Do not create and use a virtual Python environment.
  -h, --help         Show this help message.
"

NUM_JOBS=1
while [[ $# -gt 0 ]]; do
  case $1 in
    -b|--pre-clean)
      PRE_CLEAN=1
      shift
      ;;
    -a|--post-clean)
      POST_CLEAN=1
      shift
      ;;
    -n|--no-venv)
      NO_VENV=1
      shift
      ;;
    --libs)
      ROCM_LLVM_LIBS=$2
      shift; shift
      ;;
    -h|--help)
      echo "${HELP_MSG}"
      exit 0
      ;;
    --rocm-path)
      ROCM_PATH=$2
      shift; shift
      ;;
    --no-hip)
      NO_HIP=1
      shift
      ;;
    --run-tests)
      RUN_TESTS=1
      shift
      ;;
    --no-clean-docs)
      NO_CLEAN_DOCS=1
      shift
      ;;
    --no-api-docs)
      NO_API_DOCS=1
      shift
      ;;
    -j|--num-jobs)
      NUM_JOBS=$2
      shift; shift
      ;;
    -*|--*)
      echo "ERROR: unknown option '$1'"
      exit 1
      ;;
    *)
      echo "ERROR: unknown option '$1'"
      exit 1
      ;;
  esac
done

declare -x ROCM_PATH=${ROCM_PATH:-/opt/rocm}
declare -x ROCM_LLVM_LIBS=${ROCM_LLVM_LIBS:-*}

# note: [ -z {var+x} ] evaluates to true if `var` is unset!

[ -z ${PRE_CLEAN+x} ] || rm -rf venv

alias PYTHON="python3"
PYTHON_PATH="python3"
if [ -z ${NO_ENV+x} ]; then
  [ ! -d "venv" ] && python3 -m venv _venv
  alias PYTHON="$(pwd)/_venv/bin/python3"
  PYTHON_PATH="$(pwd)/_venv/bin/python3"
fi
shopt -s expand_aliases

if [ -z ${NO_HIP+x} ]; then
  # build rocm-llvm
  echo "building package rocm-llvm"
  PKG="rocm-llvm"
  mkdir -p ${PKG}/dist/
  mkdir -p ${PKG}/dist/archive
  mv ${PKG}/dist/*.whl ${PKG}/dist/archive/    2> /dev/null
  mv ${PKG}/dist/*.tar.gz ${PKG}/dist/archive/ 2> /dev/null
  PYTHON -m pip install -r ${PKG}/requirements.txt
  PYTHON -m build ${PKG} -n
fi
  
if [ -z ${NO_CUDA+x} ]; then
  # build rocm-llvm-as-cuda
  echo "building package rocm-llvm-as-cuda"
  PKG="rocm-llvm-as-cuda"
  mkdir -p ${PKG}/dist/
  mkdir -p ${PKG}/dist/archive
  mv ${PKG}/dist/*.whl ${PKG}/dist/archive/    2> /dev/null
  mv ${PKG}/dist/*.tar.gz ${PKG}/dist/archive/ 2> /dev/null
  PYTHON -m pip install --force-reinstall rocm-llvm/dist/hip*whl
  PYTHON -m pip install -r ${PKG}/requirements.txt
  PYTHON -m build ${PKG} -n
fi

if [ -z ${NO_DOCS+x} ]; then
  echo "building docs for package rocm-llvm"
  # build docs
  PYTHON -m pip install --force-reinstall rocm-llvm/dist/hip*whl \
                                                    rocm-llvm-as-cuda/dist/hip*whl
  PYTHON -m pip install -r rocm-llvm/docs/requirements.txt
  DOCS_DIR="rocm-llvm/docs"
  
  if [ ! -z ${NO_API_DOCS+x} ]; then
     mv "$DOCS_DIR/python_api" "./_python_api"
  fi

  if [ -z ${NO_CLEAN_DOCS+x} ]; then
    PYTHON -m sphinx -j ${NUM_JOBS} -T -E -b html -d _build/doctrees -D language=en ${DOCS_DIR} ${DOCS_DIR}/_build/html
  else
    echo "reuse saved sphinx environment" 
    PYTHON -m sphinx -j ${NUM_JOBS} -T -b html -d _build/doctrees -D language=en ${DOCS_DIR} ${DOCS_DIR}/_build/html
  fi
  
  if [ ! -z ${NO_API_DOCS+x} ]; then
     mv "./_python_api" "$DOCS_DIR/python_api"
  fi
fi

if [ ! -z ${RUN_TESTS+x} ]; then
  PYTHON -m pip install --force-reinstall rocm-llvm/dist/hip*whl \
                                          rocm-llvm-as-cuda/dist/hip*whl
  cd rocm-llvm/examples/0_*
  PYTHON -m pip install -r requirements.txt
  PYTHON hip_deviceattributes.py
  PYTHON hip_deviceproperties.py
  PYTHON hip_python_device_array.py
  PYTHON hip_stream.py
  PYTHON hipblas_with_numpy.py
  PYTHON hipfft.py
  #PYTHON hiprand_monte_carlo_pi.py
  PYTHON hiprtc_launch_kernel_args.py
  PYTHON hiprtc_launch_kernel_no_args.py
  PYTHON rccl_comminitall_bcast.py
  # 10x ok

  cd ../1_*
  PYTHON -m pip install -r requirements.txt
  PYTHON cuda_stream.py
  PYTHON=${PYTHON_PATH} make clean run
  # 2x ok
fi

[ -z ${POST_CLEAN+x} ] || rm -rf venv
