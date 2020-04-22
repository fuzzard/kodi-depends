# Find programs

set(CMAKE_FIND_ROOT_PATH ${WITH_TOOLCHAIN})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

unset(MISSING_COMPONENTS)

find_program(TARGET_CC NAMES ${WITH_HOST}-gcc
                       ${WITH_HOST}-clang
                       ${WITH_HOST}${WITH_NDK_API}-clang)
if(NOT TARGET_CC)
  list(APPEND MISSING_COMPONENTS TARGET_CC)
else()
  message(STATUS "found TARGET_CC: ${TARGET_CC}")
endif()

find_program(TARGET_CXX NAMES ${WITH_HOST}-g++
                        ${WITH_HOST}-clang++
                        ${WITH_HOST}${WITH_NDK_API}-clang++)
if(NOT TARGET_CXX)
  list(APPEND MISSING_COMPONENTS TARGET_CXX)
else()
  message(STATUS "found TARGET_CXX: ${TARGET_CXX}")
endif()

find_program(TARGET_CPP NAMES ${WITH_HOST}-cpp
                        ${WITH_HOST}-clang-cpp)
if(NOT TARGET_CPP)
  # todo
  # include(CheckCCompilerFlag)
  # check_c_compiler_flag(-E C_COMPILER_AS_CPP)

  # if(C_COMPILER_AS_CPP)
    set(TARGET_CPP "${TARGET_CC} -E")
  # else()
    # list(APPEND MISSING_COMPONENTS TARGET_CPP)
  # endif()
else()
  message(STATUS "found TARGET_CPP: ${TARGET_CPP}")
endif()

find_program(TARGET_LD NAMES ${WITH_HOST}-ld
                             ld)
if(NOT TARGET_LD)
  list(APPEND MISSING_COMPONENTS TARGET_LD)
else()
  message(STATUS "found TARGET_LD: ${TARGET_LD}")
endif()

find_program(TARGET_AS NAMES ${WITH_HOST}-as
                             as)
if(NOT TARGET_AS)
  list(APPEND MISSING_COMPONENTS TARGET_AS)
else()
  message(STATUS "found TARGET_AS: ${TARGET_AS}")
endif()

find_program(TARGET_AR NAMES ${WITH_HOST}-ar
                             ar)
if(NOT TARGET_AR)
  list(APPEND MISSING_COMPONENTS TARGET_AR)
else()
  message(STATUS "found TARGET_AR: ${TARGET_AR}")
endif()

find_program(TARGET_NM NAMES ${WITH_HOST}-nm
                             nm)
if(NOT TARGET_NM)
  list(APPEND MISSING_COMPONENTS TARGET_NM)
else()
  message(STATUS "found TARGET_NM: ${TARGET_NM}")
endif()

find_program(TARGET_RANLIB NAMES ${WITH_HOST}-ranlib
                                 ranlib)
if(NOT TARGET_RANLIB)
  list(APPEND MISSING_COMPONENTS TARGET_RANLIB)
else()
  message(STATUS "found TARGET_RANLIB: ${TARGET_RANLIB}")
endif()

find_program(TARGET_OBJCOPY NAMES ${WITH_HOST}-objcopy
                                  objcopy)
if(NOT TARGET_OBJCOPY)
  list(APPEND MISSING_COMPONENTS TARGET_OBJCOPY)
else()
  message(STATUS "found TARGET_OBJCOPY: ${TARGET_OBJCOPY}")
endif()

find_program(TARGET_OBJDUMP NAMES ${WITH_HOST}-objdump
                                  objdump)
if(NOT TARGET_OBJDUMP)
  list(APPEND MISSING_COMPONENTS TARGET_OBJDUMP)
else()
  message(STATUS "found TARGET_OBJDUMP: ${TARGET_OBJDUMP}")
endif()

find_program(TARGET_STRIP NAMES ${WITH_HOST}-strip
                                strip)
if(NOT TARGET_STRIP)
  list(APPEND MISSING_COMPONENTS TARGET_STRIP)
else()
  message(STATUS "found TARGET_STRIP: ${TARGET_STRIP}")
endif()

set(CMAKE_FIND_USE_PACKAGE_ROOT_PATH OFF)

find_program(HOST_CC NAMES ${WITH_BUILD}-gcc
                           ${WITH_BUILD}-clang
                           gcc
                           clang)
if(NOT HOST_CC)
  list(APPEND MISSING_COMPONENTS HOST_CC)
else()
  message(STATUS "found HOST_CC: ${HOST_CC}")
endif()

find_program(HOST_CXX NAMES ${WITH_BUILD}-g++
                            ${WITH_BUILD}-clang++
                            g++
                            clang++)
if(NOT HOST_CC)
  list(APPEND MISSING_COMPONENTS HOST_CXX)
else()
  message(STATUS "found HOST_CXX: ${HOST_CXX}")
endif()

find_program(PATCH_COMMAND patch
                           NO_CMAKE_FIND_ROOT_PATH)
if(NOT PATCH_COMMAND)
  list(APPEND MISSING_COMPONENTS PATCH_COMMAND)
else()
  message(STATUS "found PATCH_COMMAND: ${PATCH_COMMAND}")
endif()

if(MISSING_COMPONENTS)
  message(FATAL_ERROR "Missing components: ${MISSING_COMPONENTS}")
endif()


# Configure toolchain files
configure_file(${CMAKE_SOURCE_DIR}/toolchain/Toolchain.cmake.in ${CMAKE_BINARY_DIR}/Toolchain.cmake @ONLY)

configure_file(${CMAKE_SOURCE_DIR}/toolchain/meson-cross-setup.sh.in ${CMAKE_BINARY_DIR}/meson-cross-setup.sh @ONLY)

# after configure_file because cmake uses a launch rule and meson doesn't like cc=/usr/bin/ccache /usr/bin/cc anyways
if(ENABLE_CCACHE AND CCACHE_PROGRAM)
  set(TARGET_CC  "${CCACHE_PROGRAM} ${TARGET_CC}")
  set(TARGET_CXX "${CCACHE_PROGRAM} ${TARGET_CXX}")
  set(TARGET_CPP "${CCACHE_PROGRAM} ${TARGET_CPP}")
endif()
