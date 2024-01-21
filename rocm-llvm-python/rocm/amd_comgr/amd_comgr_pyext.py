# MIT License
#
# Copyright (c) 2024 Advanced Micro Devices, Inc.
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

"""Higher level interfaces that simplify the use of AMD COMGR.

Attributes:
    HIPRTC_RUNTIME_HEADER (`str`):
        The content of the ``hipRTC`` / ``hiprtc_runtime/h`` header file.
        Take a look at https://github.com/ROCm/clr for more details on how this file is generated.
        The ``HIP`` and ``clr`` branches for generating the file have been
        selected according to ``rocm.amd_comgr.ROCM_VERSION``.
"""

import os
import ctypes

import rocm.amd_comgr.amd_comgr as _comgr

NUL = b"\x00"


def to_bytes(obj):
    if isinstance(obj, str):
        return obj.encode("utf-8")
    elif isinstance(obj, bytes):
        return obj
    else:
        return bytes(obj)


def to_cstr(obj):
    """Make 0-char-terminated bytes object, a C string."""
    result = to_bytes(obj)
    if result[-1] != NUL:
        return result + NUL
    return result


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


def metadata_string_get_bytes(metadata_string: _comgr.amd_comgr_metadata_node_s):
    """Get the text associated with a string metadata node as `bytes`.

    Args:
        metadata_str (`~.amd_comgr_metadata_node_s`):
            A metadata node that represents a string.
    """
    # First determines length of string, then loads it into buffer.
    str_len = ctypes.c_ulong(0)
    comgr_check(
        _comgr.amd_comgr_get_metadata_string(
            metadata_string, ctypes.addressof(str_len), None
        )
    )
    str_len.value -= 1  # remove the 0x00 terminator
    str_buf = bytes(str_len.value)
    comgr_check(
        _comgr.amd_comgr_get_metadata_string(
            metadata_string, ctypes.addressof(str_len), str_buf
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

        We can thus simplify the callback signature too

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


class Symbol:
    """
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
    result_dict = ctypes.cast(
        ctypes.c_void_p(userdata), ctypes.POINTER(ctypes.py_object)
    ).contents.value
    result = Symbol()
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


class Data:
    @staticmethod
    def kind_str_to_enum(kind_str: str):
        """Prepends ``AMD_COMGR_DATA_KIND_`` to ``kind_str`` and looks up enum.

        Note:
            Also converts ``kind_str`` to upper case.

        The following ``kind_str`` keys can be used (state: ROCm 6.0.0):

        UNDEF:
            No data is available.
        SOURCE:
            The data is a textual main source.
        INCLUDE:
            The data is a textual source that is included in the main source or other include source.
        PRECOMPILED_HEADER:
            The data is a precompiled-header source that is included in the main source or other include source.
        DIAGNOSTIC:
            The data is a diagnostic output.
        LOG:
            The data is a textual log output.
        BC:
            The data is compiler LLVM IR bit code for a specific isa.
        RELOCATABLE:
            The data is a relocatable machine code object for a specific isa.
        EXECUTABLE:
            The data is an executable machine code object for a specific isa. An executable is the kind of code object that can be loaded and executed.
        BYTES:
            The data is a block of bytes.
        FATBIN:
            The data is a fat binary (clang-offload-bundler output).
        AR:
            The data is an archive.
        BC_BUNDLE:
            The data is a bundled bitcode.
        AR_BUNDLE:
            The data is a bundled archive.
        LAST:
            Marker for last valid data kind.
        """
        return getattr(
            _comgr.amd_comgr_data_kind_s, "AMD_COMGR_DATA_KIND_" + kind_str.upper()
        )

    def __new__(cls, *args, **kwargs):
        instance = super().__new__(cls)
        instance._data = None
        instance._name = None
        instance.kind_str: str = None
        instance.source_bytes = None
        return instance

    def __init__(self, name: str, kind_str: str, source_buffer=None):
        self._data = comgr_check(
            _comgr.amd_comgr_create_data(Data.kind_str_to_enum(kind_str))
        )
        self.kind_str = kind_str
        if source_buffer:
            self._set_data_buffer(source_buffer)
        self._set_data_name(name)

    def _set_data_name(self, name):
        self._name = to_bytes(name).decode("utf-8")
        comgr_check(_comgr.amd_comgr_set_data_name(self.get(), to_cstr(self._name)))

    def _set_data_buffer(self, data_buffer=None):
        self.source_bytes = to_bytes(data_buffer)  # store to keep alive
        comgr_check(
            _comgr.amd_comgr_set_data(
                self.get(), len(self.source_bytes), self.source_bytes
            )
        )

    def get_data_name(self):
        """Returns the data object's name as `str`."""
        name_len = ctypes.c_ulong(0)
        comgr_check(
            _comgr.amd_comgr_get_data_name(self.get(), ctypes.addressof(name_len), None)
        )
        name_len.value -= 1  # strip NUL char
        buf = bytes(name_len.value)
        comgr_check(
            _comgr.amd_comgr_get_data_name(self.get(), ctypes.addressof(name_len), buf)
        )
        return buf.decode("utf-8")

    def get_data_bytes(self):
        """Copies this data object's data into a newly created buffer.

        Note:
            This routine should only be used if this is a result data object,
            e.g. obtained as result from an action. If this is a source data object,
            you can also access ``self.source_bytes`` for a copy of
            the original source data buffer.
        """
        data_len = ctypes.c_ulong(0)
        comgr_check(
            _comgr.amd_comgr_get_data(self.get(), ctypes.addressof(data_len), None)
        )
        buf = bytes(data_len.value)
        comgr_check(
            _comgr.amd_comgr_get_data(self.get(), ctypes.addressof(data_len), buf)
        )
        return buf

    def __del__(self):
        comgr_check(_comgr.amd_comgr_release_data(self.get()))

    def get(self):
        return self._data


class DataSet:
    def __init__(self):
        self._data_set = comgr_check(_comgr.amd_comgr_create_data_set())
        self.datas = []  # keep the objects alive

    def add_data(self, data: Data):
        self.datas.append(data)
        comgr_check(_comgr.amd_comgr_data_set_add(self.get(), data.get()))

    def count_data(self, kind_str: str):
        comgr_check(
            _comgr.amd_comgr_action_data_count(
                self.get(), Data.kind_str_to_enum(kind_str)
            )
        )

    def get_data(self, kind_str: str, index: int) -> Data:
        data = Data.__new__()
        data._data = comgr_check(
            _comgr.amd_comgr_action_data_get_data(
                self.get(), Data.kind_str_to_enum(kind_str), index
            )
        )
        data.kind_str = kind_str
        return data

    def __del__(self):
        self.datas.clear()
        comgr_check(_comgr.amd_comgr_destroy_data_set(self.get()))

    def get(self):
        return self._data_set


class Action:
    @staticmethod
    def action_kind_str_to_enum(action_kind_str: str):
        """Prepends ``AMD_COMGR_LANGUAGE_`` to ``action_kind_str`` and looks up enum.

        Note:
            Also converts ``action_kind_str`` to upper case.

        The following ``action_kind_str`` keys can be used (state: ROCm 6.0.0):

        SOURCE_TO_PREPROCESSOR:
            Preprocess each source data object in input in order. For each successful preprocessor invocation, add a source data object to result. Resolve any include source names using the names of include data objects in input. Resolve any include relative path names using the working directory path in info. Preprocess the source for the language in info.
        ADD_PRECOMPILED_HEADERS:
            Copy all existing data objects in input to output, then add the device-specific and language-specific precompiled headers required for compilation.
        COMPILE_SOURCE_TO_BC:
            Compile each source data object in input in order. For each successful compilation add a bc data object to result. Resolve any include source names using the names of include data objects in input. Resolve any include relative path names using the working directory path in info. Produce bc for isa name in info. Compile the source for the language in info.
        ADD_DEVICE_LIBRARIES:
            Copy all existing data objects in input to output, then add the device-specific and language-specific bitcode libraries required for compilation.
        LINK_BC_TO_BC:
            Link a collection of bitcodes, bundled bitcodes, and bundled bitcode archives in into a single composite (unbundled) bitcode . Any device library bc data object must be explicitly added to input if needed.
        OPTIMIZE_BC_TO_BC:
            Optimize each bc data object in input and create an optimized bc data object to result.
        CODEGEN_BC_TO_RELOCATABLE:
            Perform code generation for each bc data object in input in order. For each successful code generation add a relocatable data object to result.
        CODEGEN_BC_TO_ASSEMBLY:
            Perform code generation for each bc data object in input in order. For each successful code generation add an assembly source data object to result.
        LINK_RELOCATABLE_TO_RELOCATABLE:
            Link each relocatable data object in input together and add the linked relocatable data object to result. Any device library relocatable data object must be explicitly added to input if needed.
        LINK_RELOCATABLE_TO_EXECUTABLE:
            Link each relocatable data object in input together and add the linked executable data object to result. Any device library relocatable data object must be explicitly added to input if needed.
        ASSEMBLE_SOURCE_TO_RELOCATABLE:
            Assemble each source data object in input in order into machine code. For each successful assembly add a relocatable data object to result. Resolve any include source names using the names of include data objects in input. Resolve any include relative path names using the working directory path in info. Produce relocatable for isa name in info.
        DISASSEMBLE_RELOCATABLE_TO_SOURCE:
            Disassemble each relocatable data object in input in order. For each successful disassembly add a source data object to result.
        DISASSEMBLE_EXECUTABLE_TO_SOURCE:
            Disassemble each executable data object in input in order. For each successful disassembly add a source data object to result.
        DISASSEMBLE_BYTES_TO_SOURCE:
            Disassemble each bytes data object in input in order. For each successful disassembly add a source data object to result. Only simple assembly language commands are generate that corresponf to raw bytes are supported, not any directives that control the code object layout, or symbolic branch targets or names.
        COMPILE_SOURCE_TO_FATBIN:
            Compile each source data object in input in order. For each successful compilation add a fat binary to result. Resolve any include source names using the names of include data objects in input. Resolve any include relative path names using the working directory path in info. Produce fat binary for isa name in info. Compile the source for the language in info.
        COMPILE_SOURCE_WITH_DEVICE_LIBS_TO_BC:
            Compile each source data object in input in order. For each successful compilation add a bc data object to result. Resolve any include source names using the names of include data objects in input. Resolve any include relative path names using the working directory path in info. Produce bc for isa name in info. Compile the source for the language in info. Link against the device-specific and language-specific bitcode device libraries required for compilation.
        LAST:
            Marker for last valid action kind.
        """
        return getattr(
            _comgr.amd_comgr_action_kind_s,
            "AMD_COMGR_ACTION_" + action_kind_str.upper(),
        )

    @staticmethod
    def lang_str_to_enum(lang_str: str):
        """Prepends ``AMD_COMGR_LANGUAGE_`` to ``lang_str`` and looks up enum.

        Note:
            Also converts ``lang_str`` to upper case.

        The following ``lang_str`` keys can be used (state: ROCm 6.0.0):

        NONE:
            No high level language.
        OPENCL_1_2:
            OpenCL 1.2.
        OPENCL_2_0:
            OpenCL 2.0.
        HC:
            AMD Hetrogeneous C++ (HC).
        HIP:
            HIP.
        LAST:
            Marker for last valid language.
        """
        return getattr(
            _comgr.amd_comgr_language_s, "AMD_COMGR_LANGUAGE_" + lang_str.upper()
        )

    def __init__(
        self,
        action_kind_str: str,
        isa_name=None,
        lang_str=None,
        options=None,
        logging: bool = False,
    ):
        self._action_info = comgr_check(_comgr.amd_comgr_create_action_info())
        self.result_data_set = DataSet()
        self._action_kind = Action.action_kind_str_to_enum(action_kind_str)
        if isa_name:
            self.set_isa_name(isa_name)
        if lang_str:
            self.set_language(lang_str)
        if options:
            self.set_options(options)
        self.set_logging(logging)

    def set_isa_name(self, isa_name):
        """Sets the action info object's isa_name.

        Args:
            isa_name (`str` or Python buffer such as `bytes`):
                ISA name supported by this version of AMD COMGR, e.g.
                ``amdgcn-amd-amdhsa--gfx90a:sramecc+:xnack-``.
                See `~.get_isa_names`, `~.get_isa_metadata_all` for more information.
        Note:
            Input will be null-terminated if it is not already.
        """
        comgr_check(
            _comgr.amd_comgr_action_info_set_isa_name(
                self._action_info,
                to_cstr(isa_name),
            )
        )

    def set_language(self, lang_str: str):
        """Set the language of the input data, e.g. "HIP".

        See:
            `lang_str_to_enum`.
        """
        comgr_check(
            _comgr.amd_comgr_action_info_set_language(
                self.get(), Action.lang_str_to_enum(lang_str)
            )
        )

    def set_options(self, options):
        """Set options to supply to the action runner.

        Args:
            options (`str` or Python buffer such as `bytes`):
                Options to supply to the action runner.
        Note:
            Input will be null-terminated if it is not already.
        """
        comgr_check(
            _comgr.amd_comgr_action_info_set_options(
                self.get(),
                to_cstr(options),
            )
        )

    def set_logging(self, logging: bool):
        """Enable logging."""
        comgr_check(_comgr.amd_comgr_action_info_set_logging(self.get(), logging))

    def do_action(self, input_data_set: DataSet):
        """Run the action for the given data_set."""
        comgr_check(
            _comgr.amd_comgr_do_action(
                self._action_kind,
                self.get(),
                input_data_set.get(),
                self.result_data_set.get(),
            )
        )

    def get(self):
        return self._action_info

    def __del__(self):
        comgr_check(_comgr.amd_comgr_destroy_action_info(self.get()))


def compile_hip_to_bc(
    source,  # bytes or str
    isa_name,  # offload architecture
    hip_version_tuple: tuple,  # integer triple like (6,0,32830) that indicates a HIP version, can be easily obtained when HIP Python is installed
    extra_opts="",
    default_opts="-fgpu-rdc -O3 -mcumode -std=c++14 -nogpuinc -Wno-gnu-line-marker -Wno-missing-prototypes",
    logging: bool = False,
    action_kind: str = "COMPILE_SOURCE_WITH_DEVICE_LIBS_TO_BC",
):
    """Compiles a HIP C++ source to LLVM BC.

    Returns:
        ``tuple``:
            A ``bytes`` object tuple with the compilation result, a log (``None`` if disabled),
            and diagnostics (``None`` if no errors have occured).

    Args:
        source (`str` or Python buffer such as `bytes`):
            The input as bytes or str.
        isa_name (`str` or Python buffer such as `bytes`):
            ISA name supported by this version of AMD COMGR, e.g.
            ``amdgcn-amd-amdhsa--gfx90a:sramecc+:xnack-``.
            See `~.get_isa_names`, `~.get_isa_metadata_all` for more information.
        hip_version_tuple (`str` or Python buffer such as `bytes`):
            Integer triple like ``(6,0,32830)`` that indicates a HIP version.
        extra_opts (`str` or Python buffer such as `bytes`):
            Extra options that are appended to the default options; see argument ``default_opts``.
            You would typically supply additional options via this value but
            can also use it overrule some or all of the options specified
            in default_opts.
        default_opts (`str` or Python buffer such as `bytes`):
            Default options that are typically not changed.
            Defaults to `-fgpu-rdc -O3 -mcumode -std=c++14 -nogpuinc -Wno-gnu-line-marker -Wno-missing-prototypes`
        action_kind (`str`):
            The compile action kind. Defaults to
            ``"COMPILE_SOURCE_WITH_DEVICE_LIBS_TO_BC"``
            Other supported option is ``"COMPILE_SOURCE_TO_BC"``.
        logging (bool):
            Enable logging. Defaults to ``False``.
    Note:
        String arguments are always encoded as `utf-8`.
    Note:
        Default option `-fgpu-rdc` keeps `__device__` functions in the bitcode file.
    See:
        `~.get_isa_names`, `~.get_isa_metadata_all`

    Note:
        This implementation is based on what AMD COMGR logs out when compiling HIP code to BC via HIPRTC.
        An example log is shown below (env. vars.: ``AMD_COMGR_REDIRECT_LOGS="stderr"``, ``AMD_COMGR_EMIT_VERBOSE_LOGS=1``):

        ```
        ActionKind: AMD_COMGR_ACTION_COMPILE_SOURCE_WITH_DEVICE_LIBS_TO_BC
        IsaName: amdgcn-amd-amdhsa--gfx90a:sramecc+:xnack-
        Options: "-O3" "-mcumode" "--hip-version=6.0.32830" "-DHIP_VERSION_MAJOR=6" "-DHIP_VERSION_MINOR=0" "-DHIP_VERSION_PATCH=32830" "-D__HIPCC_RTC__" "-include" "hiprtc_runtime.h" "-std=c++14" "-nogpuinc" "-Wno-gnu-line-marker" "-Wno-missing-prototypes" "--offload-arch=gfx90a:sramecc+:xnack-" "-fgpu-rdc"
        Path:
            Language: AMD_COMGR_LANGUAGE_HIP
        Compilation Args: [...]
        Driver Job Args: [...]
            ReturnStatus: AMD_COMGR_STATUS_SUCCESS
        ```
    """
    if action_kind not in (
        "COMPILE_SOURCE_TO_BC",
        "COMPILE_SOURCE_WITH_DEVICE_LIBS_TO_BC",
    ):
        raise ValueError(f"action kind '{str(action_kind)}' not supported")
    data_set = DataSet()
    data_set.add_data(Data("source.hip", "SOURCE", source))

    # prepare options
    # split expr like: amdgcn-amd-amdhsa--gfx90a:sramecc+:xnack-
    offload_arch = to_bytes(isa_name).decode("utf-8").split("--")[1]
    # produce something like: --hip-version=6.0.32830" "-DHIP_VERSION_MAJOR=6" "-DHIP_VERSION_MINOR=0 -DHIP_VERSION_PATCH=32830"
    hip_version = (
        "--hip-version="
        + ".".join(map(str, hip_version_tuple))
        + f" -DHIP_VERSION_MAJOR={hip_version_tuple[0]} -DHIP_VERSION_MINOR={hip_version_tuple[0]} -DHIP_VERSION_PATCH={hip_version_tuple[0]}"
    )
    options: str = (
        f" --offload-arch={offload_arch}"
        + " "
        + hip_version
        + " "
        + to_bytes(default_opts).decode("utf-8")
        + " "
        + to_bytes(extra_opts).decode("utf-8")
    )
    print(str(data_set.datas[0].get_data_bytes()))
    action = Action(
        action_kind_str=action_kind,
        isa_name=isa_name,
        lang_str="HIP",
        logging=logging,
        options=options,
    )
    action.do_action(data_set)
    result = action.result_data_set.get_data("BC", 0).get_data_bytes()
    if logging:
        log = action.result_data_set.get_data("LOG", 0).get_data_bytes()
    else:
        log = None
    if action.result_data_set.count_data("DIAGNOSTIC"):
        diagnostic = action.result_data_set.get_data("LOG", 0).get_data_bytes()
    else:
        diagnostic = None
    return (result, log, diagnostic)

HIPRTC_RUNTIME_HEADER = open(os.path.join(__file__,"hiprtc_runtime.h")).read()