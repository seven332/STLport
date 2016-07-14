LOCAL_PATH := $(call my-dir)

libstlport_path := $(LOCAL_PATH)

libstlport_src_files := \
        src\dll_main.cpp \
        src\fstream.cpp \
        src\strstream.cpp \
        src\sstream.cpp \
        src\ios.cpp \
        src\stdio_streambuf.cpp \
        src\istream.cpp \
        src\ostream.cpp \
        src\iostream.cpp \
        src\codecvt.cpp \
        src\collate.cpp \
        src\ctype.cpp \
        src\monetary.cpp \
        src\new.cpp \
        src\num_get.cpp \
        src\num_put.cpp \
        src\num_get_float.cpp \
        src\num_put_float.cpp \
        src\numpunct.cpp \
        src\time_facets.cpp \
        src\messages.cpp \
        src\locale.cpp \
        src\locale_impl.cpp \
        src\locale_catalog.cpp \
        src\facets_byname.cpp \
        src\complex.cpp \
        src\complex_io.cpp \
        src\complex_trig.cpp \
        src\string.cpp \
        src\bitset.cpp \
        src\allocators.cpp \
        src\chrono.cc \
        src\reachable.cc \
        src\except.cc \
        src\system_error.cc \
        src\thread.cc \
        src\c_locale.c \
        src\cxa.c \

libstlport_cflags := -D_GNU_SOURCE
libstlport_cppflags := -std=c++11 -fuse-cxa-atexit -fpermissive
libstlport_c_includes := $(libstlport_path)/stlport

#It is much more practical to include the sources of GAbi++ in our builds
# of STLport. This is similar to what the GNU libstdc++ does (it includes
# its own copy of libsupc++)
#
# This simplifies usage, since you only have to list a single library
# as a dependency, instead of two, especially when using the standalone
# toolchain.
#
libgabi++_src_files := \
        src/array_type_info.cc \
        src/auxilary.cc \
        src/class_type_info.cc \
        src/cxxabi.cc \
        src/cxxabi_vec.cc \
        src/dwarf_helper.cc \
        src/dynamic_cast.cc \
        src/enum_type_info.cc \
        src/exception.cc \
        src/fatal_error.cc \
        src/function_type_info.cc \
        src/fundamental_type_info.cc \
        src/helper_func_internal.cc \
        src/one_time_construction.cc \
        src/pbase_type_info.cc \
        src/personality.cc \
        src/pointer_type_info.cc \
        src/pointer_to_member_type_info.cc \
        src/call_unexpected.cc \
        src/si_class_type_info.cc \
        src/stdexcept.cc \
        src/terminate.cc \
        src/type_info.cc \
        src/vmi_class_type_info.cc\

libgabi++_src_files := $(libgabi++_src_files:%=../gabi++/%)
libgabi++_c_includes := $(LOCAL_PATH)/../gabi++/include
libstlport_c_includes += $(libgabi++_c_includes)

include $(CLEAR_VARS)
LOCAL_MODULE := stlport_static
LOCAL_MODULE_FILENAME := libstlport
LOCAL_CPP_EXTENSION := .cpp .cc
LOCAL_SRC_FILES := $(libstlport_src_files)
LOCAL_SRC_FILES += $(libgabi++_src_files)
LOCAL_CFLAGS := $(libstlport_cflags)
LOCAL_CPPFLAGS := $(libstlport_cppflags)
LOCAL_C_INCLUDES := $(libstlport_c_includes)
LOCAL_EXPORT_C_INCLUDES := $(libstlport_c_includes)
LOCAL_CPP_FEATURES := rtti exceptions
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := stlport_shared
LOCAL_MODULE_FILENAME := libstlport
LOCAL_WHOLE_STATIC_LIBRARIES := stlport_static
LOCAL_EXPORT_C_INCLUDES := $(libstlport_c_includes)
include $(BUILD_SHARED_LIBRARY)
