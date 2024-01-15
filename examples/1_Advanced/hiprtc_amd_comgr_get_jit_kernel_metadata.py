#!/usr/bin/env python3
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

"""Parse metadata of a JIT-compiled HIP kernel

In this example, we compile a HIP C++ kernel just-in-time
via HIPRTC and then use AMD COMGR functionality to
parse the metadata that is embedded within the resulting
code object.

Typical output of this example:

```
{'amdhsa.kernels': [{'.agpr_count': '0',
                     '.args': [{'.address_space': 'global',
                                '.offset': '0',
                                '.size': '8',
                                '.value_kind': 'global_buffer'},
                               {'.offset': '8',
                                '.size': '4',
                                '.value_kind': 'by_value'}],
                     '.group_segment_fixed_size': '0',
                     '.kernarg_segment_align': '8',
                     '.kernarg_segment_size': '12',
                     '.language': 'OpenCL C',
                     '.language_version': ['2', '0'],
                     '.max_flat_workgroup_size': '1024',
                     '.name': 'scale',
                     '.private_segment_fixed_size': '0',
                     '.sgpr_count': '6',
                     '.sgpr_spill_count': '0',
                     '.symbol': 'scale.kd',
                     '.uniform_work_group_size': '1',
                     '.uses_dynamic_stack': '0',
                     '.vgpr_count': '2',
                     '.vgpr_spill_count': '0',
                     '.wavefront_size': '64'}],
 'amdhsa.target': 'amdgcn-amd-amdhsa--gfx90a:sramecc+:xnack-',
 'amdhsa.version': ['1', '2']}
```
 
Note that some necessary includes such as "hip/hip_runtime.h" are
prepended to the kernel by HIPRTC internally. Hence, they
do not appear in the kernel source.
"""

__author__ = "Advanced Micro Devices, Inc. <hip-python.maintainer@amd.com>"

# [literalinclude-begin]
import ctypes

from hip import hip, hiprtc

from rocm.amd_comgr.amd_comgr import *

# AMD_COMGR definitions


def comgr_check(
    call_result,
):  # TODO unify interface to always return tuple, insert AMD_COMGR_STATUS_SUCCESS at index 0 where no amd_comgr_status_s
    if isinstance(call_result, tuple):
        err = call_result[0]
        result = call_result[1:]
    else:
        err = call_result
        result = None
    if result and len(result) == 1:
        result = result[0]
    if (
        isinstance(err, amd_comgr_status_s)
        and err != amd_comgr_status_s.AMD_COMGR_STATUS_SUCCESS
    ):
        raise RuntimeError(str(err))
    return result


def get_string(metadata):
    """Gets a metadata string.

    Note:
        First determines length of string, then loads it into buffer.
    """
    str_len = ctypes.c_ulong(0)
    comgr_check(
        amd_comgr_get_metadata_string(metadata, ctypes.addressof(str_len), None)
    )
    str_buf = bytes(str_len.value - 1)  # -1 to substract 0
    comgr_check(
        amd_comgr_get_metadata_string(metadata, ctypes.addressof(str_len), str_buf)
    )
    return str_buf


@ctypes.CFUNCTYPE(None, ctypes.c_ulong, ctypes.c_ulong, ctypes.c_void_p)
def get_map_keys_cb(ckey, cvalue, userdata):
    """Callback for extracting keys from a metadata map.

    Intended to be used with amd_comgr_iterate_map_metadata(object metadata, object callback, object user_data)

    Note:
        The callback has the following signature:

        ```cython
        void (*callback) (amd_comgr_metadata_node_s key, amd_comgr_metadata_node_s value, void * userdata)
        ```

        where

        ```cython
        cdef struct amd_comgr_metadata_node_s:
            unsigned long handle
        ```

        We can thus simplify the callback signature too

        ```cython
        void (*callback) (unsigned long key, unsigned long value, void * userdata)
        ```
    """
    result_list = ctypes.cast(
        ctypes.c_void_p(userdata), ctypes.POINTER(ctypes.py_object)
    ).contents.value
    key = amd_comgr_metadata_node_s(handle=ckey)
    result_list.append(get_string(key))


def get_map_keys(metadata):
    keys = ctypes.py_object([])
    comgr_check(
        amd_comgr_iterate_map_metadata(
            metadata,
            ctypes.cast(get_map_keys_cb, ctypes.c_void_p),
            ctypes.addressof(keys),
        )
    )
    return keys.value


def parse_metadata(metadata, level=0):
    metadata_kind = comgr_check(amd_comgr_get_metadata_kind(metadata))
    if metadata_kind == amd_comgr_metadata_kind_s.AMD_COMGR_METADATA_KIND_MAP:
        result = {}
        map_keys = get_map_keys(metadata)
        for key in map_keys:
            result[key.decode("utf-8")] = parse_metadata(
                comgr_check(amd_comgr_metadata_lookup(metadata, key)), level + 1
            )
        return result
    elif metadata_kind == amd_comgr_metadata_kind_s.AMD_COMGR_METADATA_KIND_LIST:
        result = []
        list_size = comgr_check(amd_comgr_get_metadata_list_size(metadata))
        for i in range(0, list_size):
            result.append(
                parse_metadata(
                    comgr_check(amd_comgr_index_list_metadata(metadata, i)), level + 1
                )
            )
        return result
    elif metadata_kind == amd_comgr_metadata_kind_s.AMD_COMGR_METADATA_KIND_STRING:
        return get_string(metadata).decode("utf-8")


def parse_data_metadata(data):
    metadata = comgr_check(amd_comgr_get_data_metadata(data))
    result = parse_metadata(metadata)
    comgr_check(amd_comgr_destroy_metadata(metadata))
    return result


# HIPRTC definitions


def hip_check(call_result):
    err = call_result[0]
    result = call_result[1:]
    if len(result) == 1:
        result = result[0]
    if isinstance(err, hip.hipError_t) and err != hip.hipError_t.hipSuccess:
        raise RuntimeError(str(err))
    elif (
        isinstance(err, hiprtc.hiprtcResult)
        and err != hiprtc.hiprtcResult.HIPRTC_SUCCESS
    ):
        raise RuntimeError(str(err))
    return result


class HipProgram:
    def __init__(self, name: str, arch: str, source: bytes):
        self.hip_source = source
        self.name = name.encode("utf-8")
        self.prog = None
        self.code = None
        self.code_size = None
        self._compile_to_executable(arch)

    def _compile_to_executable(self, arch: str):
        self.prog = hip_check(
            hiprtc.hiprtcCreateProgram(self.hip_source, self.name, 0, [], [])
        )
        cflags = [b"--offload-arch=" + arch]
        (err,) = hiprtc.hiprtcCompileProgram(self.prog, len(cflags), cflags)
        if err != hiprtc.hiprtcResult.HIPRTC_SUCCESS:
            log_size = hip_check(hiprtc.hiprtcGetProgramLogSize(self.prog))
            log = bytearray(log_size)
            hip_check(hiprtc.hiprtcGetProgramLog(self.prog, log))
            raise RuntimeError(log.decode())
        self.code_size = hip_check(hiprtc.hiprtcGetCodeSize(self.prog))
        self.code = bytearray(self.code_size)
        hip_check(hiprtc.hiprtcGetCode(self.prog, self.code))

    def parse_metadata(self):
        assert self.code != None
        data = comgr_check(
            amd_comgr_create_data(amd_comgr_data_kind_s.AMD_COMGR_DATA_KIND_EXECUTABLE)
        )
        comgr_check(amd_comgr_set_data(data, kernel_prog.code_size, kernel_prog.code))
        result = parse_data_metadata(data)
        comgr_check(amd_comgr_release_data(data))
        return result

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if self.prog != None:
            hip_check(hiprtc.hiprtcDestroyProgram(self.prog.createRef()))


if __name__ == "__main__":
    import textwrap
    import pprint

    kernel_hip = textwrap.dedent(
        """\
        extern "C" __global__ void scale(float arr[], float factor) {
            arr[threadIdx.x] *= factor;
        }
        """
    ).encode("utf-8")

    props = hip.hipDeviceProp_t()
    hip_check(hip.hipGetDeviceProperties(props, 0))
    arch = props.gcnArchName
    with HipProgram("kernel", arch, kernel_hip) as kernel_prog:
        pprint.pprint(kernel_prog.parse_metadata())
        pass
    print("ok")
