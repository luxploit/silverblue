cmake_minimum_required(VERSION 3.25)
project(silverblue LANGUAGES C ASM_NASM)

if(CMAKE_HOST_APPLE)
    message(FATAL_ERROR "Building Silverblue is not supported on Mac OS X")
endif()

set(CMAKE_CONFIGURATION_TYPES "Debug;Release") # remove stupid bloat ahh configs
set(CMAKE_C_STANDARD 99)
set(CMAKE_EXE_LINKER_FLAGS "-fuse-ld=lld")

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/builds/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/builds/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/builds/bin)

set(SILVERBLUE_SOURCE ${CMAKE_SOURCE_DIR}/src)

add_subdirectory(${SILVERBLUE_SOURCE}/base)
