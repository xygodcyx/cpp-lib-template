set(LIB_NAME mylib)

cmake_minimum_required(VERSION 3.16)
project(${LIB_NAME} VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(GNUInstallDirs)

# ---- 库 ----
add_library(${LIB_NAME}
    src/vector3.cpp
)

# 公共头文件
target_include_directories(${LIB_NAME} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

# 内部头文件
target_include_directories(${LIB_NAME} PRIVATE src)

# 链接的第三方库（按 PUBLIC/PRIVATE 区分）
# target_link_libraries(${LIB_NAME} PUBLIC fmt::fmt PRIVATE spdlog::spdlog)

# 版本
set_target_properties(${LIB_NAME} PROPERTIES
    VERSION   ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR}
)

# ---- 安装 ----
install(TARGETS ${LIB_NAME}
    EXPORT  ${LIB_NAME}Targets
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(DIRECTORY include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(EXPORT ${LIB_NAME}Targets
    FILE      ${LIB_NAME}Config.cmake
    NAMESPACE ${LIB_NAME}::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${LIB_NAME}
)

