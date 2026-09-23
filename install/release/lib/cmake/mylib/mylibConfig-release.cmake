#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mylib::core" for configuration "Release"
set_property(TARGET mylib::core APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mylib::core PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcore.a"
  )

list(APPEND _cmake_import_check_targets mylib::core )
list(APPEND _cmake_import_check_files_for_mylib::core "${_IMPORT_PREFIX}/lib/libcore.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
