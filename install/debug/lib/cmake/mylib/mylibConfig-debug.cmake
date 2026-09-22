#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mylib::mylib" for configuration "Debug"
set_property(TARGET mylib::mylib APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(mylib::mylib PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libmylib.a"
  )

list(APPEND _cmake_import_check_targets mylib::mylib )
list(APPEND _cmake_import_check_files_for_mylib::mylib "${_IMPORT_PREFIX}/lib/libmylib.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
