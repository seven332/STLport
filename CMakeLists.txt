cmake_minimum_required(VERSION 2.8)

project (STLport)
set(CMAKE_BUILD_TYPE Release)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fuse-cxa-atexit -fpermissive -nostdinc++ -nodefaultlibs")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -nostdinc++ -nodefaultlibs -s")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/stlport)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../gabi++/include)

set(SOURCE_FILES
    src/dll_main.cpp
    src/fstream.cpp
    src/strstream.cpp
    src/sstream.cpp
    src/ios.cpp
    src/stdio_streambuf.cpp
    src/istream.cpp
    src/ostream.cpp
    src/iostream.cpp
    src/codecvt.cpp
    src/collate.cpp
    src/ctype.cpp
    src/monetary.cpp
    src/new.cpp
    src/num_get.cpp
    src/num_put.cpp
    src/num_get_float.cpp
    src/num_put_float.cpp
    src/numpunct.cpp
    src/time_facets.cpp
    src/messages.cpp
    src/locale.cpp
    src/locale_impl.cpp
    src/locale_catalog.cpp
    src/facets_byname.cpp
    src/complex.cpp
    src/complex_io.cpp
    src/complex_trig.cpp
    src/string.cpp
    src/bitset.cpp
    src/allocators.cpp
    src/chrono.cc
    src/reachable.cc
    src/except.cc
    src/system_error.cc
    src/thread.cc
    src/c_locale.c
    src/cxa.c
    ../gabi++/src/array_type_info.cc
    ../gabi++/src/auxilary.cc
    ../gabi++/src/class_type_info.cc
    ../gabi++/src/cxxabi.cc
    ../gabi++/src/cxxabi_vec.cc
    ../gabi++/src/delete.cc
    ../gabi++/src/dwarf_helper.cc
    ../gabi++/src/dynamic_cast.cc
    ../gabi++/src/enum_type_info.cc
    ../gabi++/src/exception.cc
    ../gabi++/src/fatal_error.cc
    ../gabi++/src/function_type_info.cc
    ../gabi++/src/fundamental_type_info.cc
    ../gabi++/src/helper_func_internal.cc
    ../gabi++/src/new.cc
    ../gabi++/src/one_time_construction.cc
    ../gabi++/src/pbase_type_info.cc
    ../gabi++/src/personality.cc
    ../gabi++/src/pointer_type_info.cc
    ../gabi++/src/pointer_to_member_type_info.cc
    ../gabi++/src/call_unexpected.cc
    ../gabi++/src/si_class_type_info.cc
    ../gabi++/src/stdexcept.cc
    ../gabi++/src/terminate.cc
    ../gabi++/src/type_info.cc
    ../gabi++/src/vmi_class_type_info.cc
)

add_library(libstlport_static STATIC ${SOURCE_FILES})
set_target_properties(libstlport_static PROPERTIES OUTPUT_NAME "stlport")

add_library(libstlport_shared SHARED ${SOURCE_FILES})
target_link_libraries(libstlport_shared -lgcc -ldl -lm -lc)
set_target_properties(libstlport_shared PROPERTIES OUTPUT_NAME "stlport")

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/stlport DESTINATION ${CMAKE_INSTALL_PREFIX}/include/stlport)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../gabi++/include DESTINATION ${CMAKE_INSTALL_PREFIX}/include/gabi++)
INSTALL(TARGETS libstlport_static libstlport_shared
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)
