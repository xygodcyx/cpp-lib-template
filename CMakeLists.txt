cmake_minimum_required(VERSION 3.16)

project(mylib VERSION 1.0.0 LANGUAGES CXX)

include(GNUInstallDirs)

# ---- core库 ----
add_library(core 
    src/core/vector3.cpp
)

add_library(${PROJECT_NAME}::core ALIAS core)

target_compile_options(core PRIVATE -Wall -Wextra)
target_compile_features(core PUBLIC cxx_std_17)

target_compile_options(core PRIVATE -Wall -Wextra)
target_compile_definitions(core PUBLIC FEATURE_X)

# 公共头文件
target_include_directories(core PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

# 内部头文件
target_include_directories(core PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src/core) 

#---- core ----

# 链接的第三方库（按 PUBLIC/PRIVATE 区分）
# target_link_libraries(${PROJECT_NAME} PUBLIC fmt::fmt PRIVATE spdlog::spdlog)

# 版本
set_target_properties(core PROPERTIES
    VERSION   ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR}
)

# ---- 安装 ----
install(TARGETS core
    EXPORT  ${PROJECT_NAME}Targets
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR} 
)

install(DIRECTORY include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(EXPORT ${PROJECT_NAME}Targets
    FILE      ${PROJECT_NAME}Config.cmake
    NAMESPACE ${PROJECT_NAME}::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
)

