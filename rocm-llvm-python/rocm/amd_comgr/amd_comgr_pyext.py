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

import ctypes

import rocm.amd_comgr.amd_comgr as _comgr


def comgr_check(
    call_result,
):
    """Checks the status of AMD COMGR calls and returns remaining result tuple entries."""
    if isinstance(call_result, tuple):
        err = call_result[0]
        result = call_result[1:]
    else:
        err = call_result
        result = None
    if result and len(result) == 1:
        result = result[0]
    if (
        isinstance(err, _comgr.amd_comgr_status_s)
        and err != _comgr.amd_comgr_status_s.AMD_COMGR_STATUS_SUCCESS
    ):
        raise RuntimeError(str(err))
    return result


def metadata_string_get_bytes(metadata_str: _comgr.amd_comgr_metadata_node_s):
    """Get the text associated with a string metadata node as `bytes`.

    Args:
        metadata_str (`~.amd_comgr_metadata_node_s`):
            A metadata node that represents a string.
    """
    # First determines length of string, then loads it into buffer.
    str_len = ctypes.c_ulong(0)
    comgr_check(
        _comgr.amd_comgr_get_metadata_string(
            metadata_str, ctypes.addressof(str_len), None
        )
    )
    str_len.value -= 1  # remove the 0x00 terminator
    str_buf = bytes(str_len.value)
    comgr_check(
        _comgr.amd_comgr_get_metadata_string(
            metadata_str, ctypes.addressof(str_len), str_buf
        )
    )
    return str_buf


@ctypes.CFUNCTYPE(None, ctypes.c_ulong, ctypes.c_ulong, ctypes.c_void_p)
def _get_map_keys_cb(ckey, _, userdata):
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

        We can thus rephrase the callback signature as follows:

        ```cython
        void (*callback) (unsigned long key, unsigned long value, void * userdata)
        ```
    """
    result_list = ctypes.cast(
        ctypes.c_void_p(userdata), ctypes.POINTER(ctypes.py_object)
    ).contents.value
    key = _comgr.amd_comgr_metadata_node_s(handle=ckey)
    result_list.append(metadata_string_get_bytes(key))


def metadata_map_get_keys(metadata_map: _comgr.amd_comgr_metadata_node_s):
    """Get the keys of a AMD COMGR metadata map as `list`.

    Args:
        metadata_map (`~.amd_comgr_metadata_node_s`):
            A metadata node that represents a map.
    """
    keys = ctypes.py_object([])
    comgr_check(
        _comgr.amd_comgr_iterate_map_metadata(
            metadata_map,
            ctypes.cast(_get_map_keys_cb, ctypes.c_void_p),
            ctypes.addressof(keys),
        )
    )
    return keys.value


def parse_metadata(metadata: _comgr.amd_comgr_metadata_node_s, level: int = 0):
    """Parse arbitrary metadata node and return a nest of `dict`, `list`, and `str`.

    Args:
        metadata_map (`~.amd_comgr_metadata_node_s`):
            A metadata node that represents a map.
        level (int, optional):
            Not used yet. Useful for debugging.
    """
    metadata_kind = comgr_check(_comgr.amd_comgr_get_metadata_kind(metadata))
    if metadata_kind == _comgr.amd_comgr_metadata_kind_s.AMD_COMGR_METADATA_KIND_MAP:
        result = {}
        map_keys = metadata_map_get_keys(metadata)
        for key in map_keys:
            map_value: _comgr.amd_comgr_metadata_node_s = comgr_check(
                _comgr.amd_comgr_metadata_lookup(metadata, key)
            )
            result[key.decode("utf-8")] = parse_metadata(map_value, level + 1)
            comgr_check(_comgr.amd_comgr_destroy_metadata(map_value))
        return result
    elif metadata_kind == _comgr.amd_comgr_metadata_kind_s.AMD_COMGR_METADATA_KIND_LIST:
        result = []
        list_size = comgr_check(_comgr.amd_comgr_get_metadata_list_size(metadata))
        for i in range(0, list_size):
            list_entry: _comgr.amd_comgr_metadata_node_s = comgr_check(
                _comgr.amd_comgr_index_list_metadata(metadata, i)
            )
            result.append(parse_metadata(list_entry, level + 1))
            comgr_check(_comgr.amd_comgr_destroy_metadata(list_entry))
        return result
    elif (
        metadata_kind == _comgr.amd_comgr_metadata_kind_s.AMD_COMGR_METADATA_KIND_STRING
    ):
        return metadata_string_get_bytes(metadata).decode("utf-8")


def parse_data_metadata(data: _comgr.amd_comgr_data_s):
    """Parse metadata of a `amd_comgr_data_s` object."""
    metadata = comgr_check(_comgr.amd_comgr_get_data_metadata(data))
    result = parse_metadata(metadata)
    comgr_check(_comgr.amd_comgr_destroy_metadata(metadata))
    return result


def parse_code_metadata(
    code, code_size, kind=_comgr.amd_comgr_data_kind_s.AMD_COMGR_DATA_KIND_EXECUTABLE
):
    """Parse metadata of a code object, e.g., one generated via HIPRTC.

    Args:
        code:
            Code object that is accepted as input of `rocm.llvm._util.Pointer`, e.g.
            an implementor of the Python buffer protocol such as `bytes`.
        code_size (`int`):
            Length of the code.
        kind (`~.amd_comgr_data_kind_s`, optional):
            Kind of the code object in terms of AMD COMGR kinds, e.g.
            `~.amd_comgr_data_kind_s.AMD_COMGR_DATA_KIND_EXECUTABLE`,
            which is the default.
    """
    data = comgr_check(_comgr.amd_comgr_create_data(kind))
    comgr_check(_comgr.amd_comgr_set_data(data, code_size, code))
    result = parse_data_metadata(data)
    comgr_check(_comgr.amd_comgr_release_data(data))
    return result


def get_isa_names(decode: bool = True):
    """Return the ISA names supported by this version of COMGR as `list` of `str` / `bytes`.

    Args:
        decode (`bool`, optional):
            If the names should be decoded to a Python `str`.
    Returns:
        `list`:
            List of ISA names, either as Python `str` (``decode=True``) or `bytes`.
    """
    from rocm.llvm._util.types import CStr

    result = []
    for i in range(0, comgr_check(_comgr.amd_comgr_get_isa_count())):
        isa_name = comgr_check(_comgr.amd_comgr_get_isa_name(i))
        result.append(isa_name.decode("utf-8") if decode else isa_name.encode("utf-8"))
    return result


def get_isa_metadata(isa_name):
    """Parse metadata for a specific ISA.

    Args:
        isa_name (`bytes` or `str`):
            The ISA name
    See:
        get_isa_names
    """
    if isinstance(isa_name, bytes):
        isa_name_bytes = isa_name
    elif isinstance(isa_name, str):
        isa_name_bytes = isa_name.encode("utf-8")
    isa_metadata: _comgr.amd_comgr_metadata_node_s = comgr_check(
        _comgr.amd_comgr_get_isa_metadata(isa_name_bytes)
    )
    result = parse_metadata(isa_metadata)
    comgr_check(_comgr.amd_comgr_destroy_metadata(isa_metadata))
    return result


def get_isa_metadata_all():
    """Return the metadata for all ISAs supported by this version of COMGR as `dict`."""
    result = {}
    for isa_name in get_isa_names(decode=True):
        result[isa_name] = get_isa_metadata(isa_name)
    return result


class _Symbol:
    """Represents a code object symbol.

    Members result from `~.amd_comgr_symbol_get_info` supplied with the following ``attribute`` parameters:

    `~.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_NAME_LENGTH`:
        The length of the symbol name in bytes. Does not include the NUL terminator. The type of this attribute is uint64_t.
    `~.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_NAME`:
        The name of the symbol. The type of this attribute is character array with the length equal to the value of the AMD_COMGR_SYMBOL_INFO_NAME_LENGTH attribute plus 1 for a NUL terminator.
    `~.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_TYPE`:
        The kind of the symbol. The type of this attribute is amd_comgr_symbol_type_t.
    `~.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_SIZE`:
        Size of the variable. The value of this attribute is undefined if the symbol is not a variable. The type of this attribute is uint64_t.
    `~.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_IS_UNDEFINED`:
        Indicates whether the symbol is undefined. The type of this attribute is bool.
    `~.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_VALUE`:
        The value of the symbol. The type of this attribute is uint64_t.
    `~.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_LAST`:
        Marker for last valid symbol info.

    An object's member ``self.type`` can have the following values:

    ``UNKNOWN``:
        The symbol's type is unknown.
    ``NOTYPE``:
        The symbol's type is not specified.
    ``OBJECT``:
        The symbol is associated with a data object, such as a variable, an array, and so on.
    ``FUNC``:
        The symbol is associated with a function or other executable code.
    ``SECTION``:
        The symbol is associated with a section. Symbol table entries of this type exist primarily for relocation.
    ``FILE``:
        Conventionally, the symbol's name gives the name of the source file associated with the object file.
    ``COMMON``:
        The symbol labels an uninitialized common block.
    ``AMDGPU_HSA_KERNEL``:
        The symbol is associated with an AMDGPU Code Object V2 kernel function.
    """

    def __init__(self):
        self.type: str = None
        self.name: str = None
        self.size: int = -1
        self.is_undefined: bool = -1
        self.value: int = -1


@ctypes.CFUNCTYPE(None, ctypes.c_ulong, ctypes.c_void_p)
def _iterate_symbols_cb(csymbol, userdata):
    """Callback for iterating over a code object's symbols.

    Intended to be used with `~.amd_comgr_iterate_symbols`.

    Note:
        The callback has the following signature:

        ```cython
        void (*callback) (amd_comgr_symbol_s symbol, void * userdata)
        ```

        where

        ```cython
        cdef struct amd_comgr_symbol_s:
            unsigned long handle
        ```

        We can thus rephrase the callback signature as follows:

        ```cython
        void (*callback) (unsigned long key, void * userdata)
        ```
    """
    result_dict = ctypes.cast(
        ctypes.c_void_p(userdata), ctypes.POINTER(ctypes.py_object)
    ).contents.value
    result = _Symbol()
    symbol = _comgr.amd_comgr_symbol_s(handle=csymbol)

    # 1) type
    symbol_type = _comgr.amd_comgr_symbol_type_s.ctypes_type()(0)
    _comgr.amd_comgr_symbol_get_info(
        symbol,
        _comgr.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_TYPE,
        ctypes.addressof(symbol_type),
    )
    result.type = _comgr.amd_comgr_symbol_type_s(symbol_type.value).name.replace(
        "AMD_COMGR_SYMBOL_TYPE_", ""
    )
    # 2) name
    symbol_name_len = ctypes.c_uint64(0)
    _comgr.amd_comgr_symbol_get_info(
        symbol,
        _comgr.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_NAME_LENGTH,
        ctypes.addressof(symbol_name_len),
    )
    symbol_name = bytes(symbol_name_len.value)
    _comgr.amd_comgr_symbol_get_info(
        symbol,
        _comgr.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_NAME,
        symbol_name,
    )
    result.name = symbol_name.decode("utf-8")
    #  3) size
    if result.type == "OBJECT":
        symbol_size = ctypes.c_uint64(0)
        _comgr.amd_comgr_symbol_get_info(
            symbol,
            _comgr.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_SIZE,
            ctypes.addressof(symbol_size),
        )
        result.size = symbol_size.value
    # 4) is_undefined
    symbol_is_undefined = ctypes.c_bool(0)
    _comgr.amd_comgr_symbol_get_info(
        symbol,
        _comgr.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_IS_UNDEFINED,
        ctypes.addressof(symbol_is_undefined),
    )
    result.is_undefined = symbol_is_undefined.value
    # 5) value
    symbol_value = ctypes.c_uint64(0)
    _comgr.amd_comgr_symbol_get_info(
        symbol,
        _comgr.amd_comgr_symbol_info_s.AMD_COMGR_SYMBOL_INFO_SIZE,
        ctypes.addressof(symbol_value),
    )
    result.value = symbol_value.value
    # add to result list
    result_dict[result.name] = result.__dict__


def parse_data_symbols(data: _comgr.amd_comgr_data_s):
    """Parse all symbols of a data object and return as `dict`."""
    result = ctypes.py_object({})
    comgr_check(
        _comgr.amd_comgr_iterate_symbols(
            data,
            ctypes.cast(_iterate_symbols_cb, ctypes.c_void_p),
            ctypes.addressof(result),
        )
    )
    return result.value


def parse_code_symbols(
    code, code_size, kind=_comgr.amd_comgr_data_kind_s.AMD_COMGR_DATA_KIND_EXECUTABLE
):
    """Parse metadata of a code object, e.g., one generated via HIPRTC.

    Args:
        code:
            Code object that is accepted as input of `rocm.llvm._util.Pointer`, e.g.
            an implementor of the Python buffer protocol such as `bytes`.
        code_size (`int`):
            Length of the code.
        kind (`~.amd_comgr_data_kind_s`, optional):
            Kind of the code object in terms of AMD COMGR kinds, e.g.
            `~.amd_comgr_data_kind_s.AMD_COMGR_DATA_KIND_EXECUTABLE`,
            which is the default.
    """
    data = comgr_check(_comgr.amd_comgr_create_data(kind))
    comgr_check(_comgr.amd_comgr_set_data(data, code_size, code))
    result = parse_data_symbols(data)
    comgr_check(_comgr.amd_comgr_release_data(data))
    return result
