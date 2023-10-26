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
# set -e # failing subprograms make this script fail too

HELP_MSG="
Usage: ./$(basename $0) [OPTIONS]

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
  -j,--num-jobs          Number of build jobs to use (currently only applied for building docs). Defaults to 1.
  --pre-clean            Remove the virtual Python environment subfolder '_venv' --- if it exists --- before all other tasks.
  --post-clean           Remove the virtual Python environment subfolder '_venv' --- if it exists --- after all other tasks.
  -n, --no-_venv          Do not create and use a virtual Python environment.
  -h, --help             Show this help message.
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
    -n|--no-_venv)
      NO_VENV=1
      shift
      ;;
    --libs)
      ROCM_LLVM_PYTHON_LIBS=$2
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
    --no-build)
      NO_BUILD=1
      shift
      ;;
    --no-build-librocmllvm)
      NO_BUILD_LIBROCMLLVM=1
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
    --no-archive)
      NO_ARCHIVE_OLD_PACKAGES=1
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
declare -x ROCM_LLVM_PYTHON_LIBS=${ROCM_LLVM_PYTHON_LIBS:-*}

# note: [ -z {var+x} ] evaluates to true if `var` is unset!

[ -z ${PRE_CLEAN+x} ] || rm -rf _venv

alias PYTHON="python3"
PYTHON_PATH="python3"
if [ -z ${NO_ENV+x} ]; then
  [ ! -d "_venv" ] && python3 -m venv _venv
  alias PYTHON="$(pwd)/_venv/bin/python3"
  PYTHON_PATH="$(pwd)/_venv/bin/python3"
fi
shopt -s expand_aliases

PKG="rocm-llvm-python"
if [ -z ${NO_BUILD_LIBROCMLLVM+x} ]; then
    make clean librocmllvm.so
    mv librocmllvm.so ${PKG}/rocm/llvm
fi

if [ -z ${NO_BUILD+x} ]; then
  # build rocm-llvm-python
  echo "building package ${PKG}"
  mkdir -p ${PKG}/dist/
  mkdir -p ${PKG}/dist/archive
  if [ -z ${NO_ARCHIVE_OLD_PACKAGES+x} ]; then
    mv ${PKG}/dist/*.whl ${PKG}/dist/archive/    2> /dev/null
    mv ${PKG}/dist/*.tar.gz ${PKG}/dist/archive/ 2> /dev/null
  fi
  PYTHON -m pip install -r ${PKG}/requirements.txt
  PYTHON _render_update_version.py
  PYTHON -m build ${PKG} -n
fi

# if [ -z ${NO_DOCS+x} ]; then
#   echo "building docs for package rocm-llvm-python"
#   # build docs
#   PYTHON -m pip install --force-reinstall rocm-llvm-python/dist/hip*whl \
#                                                     rocm-llvm-python-as-cuda/dist/hip*whl
#   PYTHON -m pip install -r rocm-llvm-python/docs/requirements.txt
#   DOCS_DIR="rocm-llvm-python/docs"
#   
#   if [ ! -z ${NO_API_DOCS+x} ]; then
#      mv "$DOCS_DIR/python_api" "./_python_api"
#   fi
# 
#   if [ -z ${NO_CLEAN_DOCS+x} ]; then
#     PYTHON -m sphinx -j ${NUM_JOBS} -T -E -b html -d _build/doctrees -D language=en ${DOCS_DIR} ${DOCS_DIR}/_build/html
#   else
#     echo "reuse saved sphinx environment" 
#     PYTHON -m sphinx -j ${NUM_JOBS} -T -b html -d _build/doctrees -D language=en ${DOCS_DIR} ${DOCS_DIR}/_build/html
#   fi
#   
#   if [ ! -z ${NO_API_DOCS+x} ]; then
#      mv "./_python_api" "$DOCS_DIR/python_api"
#   fi
# fi
# 
# if [ ! -z ${RUN_TESTS+x} ]; then
#   PYTHON -m pip install --force-reinstall rocm-llvm-python/dist/hip*whl
# fi

[ -z ${POST_CLEAN+x} ] || rm -rf _venv
