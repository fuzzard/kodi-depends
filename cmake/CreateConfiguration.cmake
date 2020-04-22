if(ENABLE_CCACHE)
  find_program(CCACHE_PROGRAM ccache)
endif()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "CMake build type" FORCE)
endif()

if(NOT CMAKE_CXX_EXTENSIONS)
  set(CMAKE_CXX_EXTENSIONS OFF CACHE BOOL "CMake CXX Extentions")
endif()

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14 CACHE STRING "CMake CXX Standard")
endif()

file(STRINGS ${WITH_KODI_SOURCE}/version.txt VERSION_TXT)
string(REGEX MATCH "APP_NAME ([^ ]*);" APP_NAME "${VERSION_TXT}")
string(TOLOWER ${CMAKE_MATCH_1} APP_NAME)

# set native/target install locations
set(INSTALL_PREFIX_TARGET ${WITH_PREFIX}/${WITH_HOST} CACHE STRING "Path to target install prefix" FORCE)
set(INSTALL_PREFIX_NATIVE ${WITH_PREFIX}/${WITH_BUILD} CACHE STRING "Path to native install prefix" FORCE)

# set native/target build locations
set(BUILD_DIR_TARGET ${CMAKE_BINARY_DIR}/build-target CACHE STRING "Path to target build prefix" FORCE)
set(BUILD_DIR_NATIVE ${CMAKE_BINARY_DIR}/build-native CACHE STRING "Path to native build prefix" FORCE)

if(WITH_CPU MATCHES "arm64|aarch64")
  set(MESON_CPU aarch64)
elseif(WITH_CPU MATCHES "arm")
  set(MESON_CPU arm)
elseif(WITH_CPU MATCHES "x86_64")
  set(MESON_CPU x86_64)
elseif(WITH_CPU MATCHES "i386|i686")
  set(MESON_CPU x86)
endif()

if(WITH_CPU AND NOT MESON_CPU)
  message(FATAL_ERROR "MESON_CPU invalid. Check WITH_CPU")
endif()

if(CORE_PLATFORM_NAME_LC IN_LIST VALID_LINUX_PLATFORMS_LIST)
  set(CORE_SYSTEM_NAME linux)
  set(MESON_SYSTEM linux)

  list(APPEND WITH_TARGET_CFLAGS "-fPIC -DPIC")

elseif(CORE_PLATFORM_NAME_LC STREQUAL android)
  set(CMAKE_SYSTEM_NAME Android)
  set(CORE_SYSTEM_NAME android)
  set(MESON_SYSTEM android)

  list(APPEND WITH_TARGET_CFLAGS "-DANDROID -D__ANDROID_API__=${WITH_NDK_API} -fexceptions -funwind-tables -fstack-protector-strong -no-canonical-prefixes -fPIC -DPIC")
  list(APPEND WITH_TARGET_CXXFLAGS "-frtti")
  list(APPEND WITH_TARGET_LDFLAGS "-Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libatomic.a -L${INSTALL_PREFIX_TARGET}/lib/android-${WITH_NDK_API}")

  if(WITH_CPU MATCHES "arm64")
    list(APPEND WITH_TARGET_CFLAGS "-march=armv8-a -mtune=cortex-a53")
  elseif(WITH_CPU MATCHES "arm")
    list(APPEND WITH_TARGET_CFLAGS "-march=armv7-a -mtune=cortex-a9 -mfloat-abi=softfp -mfpu=neon")
    list(APPEND WITH_TARGET_LDFLAGS "-Wl,--exclude-libs,libunwind.a")
  endif()

  list(APPEND WITH_TARGET_CFLAGS "-I${INSTALL_PREFIX_TARGET}/include/android-${WITH_NDK_API}")

elseif(CORE_PLATFORM_NAME_LC STREQUAL tvos)
  set(CMAKE_SYSTEM_NAME Darwin)
  set(CORE_SYSTEM_NAME darwin_embedded)
  set(MESON_SYSTEM darwin)

  list(APPEND WITH_TARGET_CFLAGS "-ftree-vectorize -pipe -Wno-trigraphs -fpascal-strings -Wreturn-type -Wunused-variable -fmessage-length=0 -gdwarf-2 -Wno-error=implicit-function-declaration -fembed-bitcode -fheinous-gnu-extensions -no-cpp-precomp")
  list(APPEND WITH_TARGET_CXXFLAGS "-frtti")
  list(APPEND WITH_TARGET_LDFLAGS "-Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libatomic.a -L$prefix/$deps_dir/lib/android-$use_ndk_api -stdlib=libc++")

elseif(CORE_PLATFORM_NAME_LC STREQUAL ios)
  set(CMAKE_SYSTEM_NAME Darwin)
  set(CORE_SYSTEM_NAME darwin_embedded)
  set(MESON_SYSTEM darwin)

  list(APPEND WITH_TARGET_CFLAGS "-ftree-vectorize -pipe -Wno-trigraphs -fpascal-strings -Wreturn-type -Wunused-variable -fmessage-length=0 -gdwarf-2 -Wno-error=implicit-function-declaration -fembed-bitcode -fheinous-gnu-extensions -no-cpp-precomp")
  list(APPEND WITH_TARGET_CXXFLAGS "-frtti")
  list(APPEND WITH_TARGET_LDFLAGS "-Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libatomic.a -L$prefix/$deps_dir/lib/android-$use_ndk_api -stdlib=libc++")

elseif(CORE_PLATFORM_NAME_LC STREQUAL osx)
  set(CORE_SYSTEM_NAME osx)
  set(MESON_SYSTEM darwin)

  list(APPEND WITH_TARGET_CFLAGS "-fheinous-gnu-extensions -no-cpp-precomp")
  list(APPEND WITH_TARGET_LDFLAGS "-Wl,-search_paths_first -stdlib=libc++")

elseif(CORE_PLATFORM_NAME_LC STREQUAL rbpi)
  set(CORE_SYSTEM_NAME rbpi)
  set(MESON_SYSTEM linux)

  list(APPEND WITH_TARGET_CFLAGS "-pipe -mabi=aapcs-linux -Wno-psabi -Wa,-mno-warn-deprecated -Wno-deprecated-declarations -isystem${WITH_FIRMWARE}/opt/vc/include -isystem${WITH_FIRMWARE}/opt/vc/include/interface/vcos/pthreads -isystem${WITH_FIRMWARE}/opt/vc/include/interface/vmcs_host/linux")
  list(APPEND WITH_TARGET_LDFLAGS "-L${WITH_FIRMWARE}/opt/vc/lib -lEGL -lGLESv2 -lbcm_host -lvcos -lvchiq_arm")

endif()

if(NOT CORE_SYSTEM_NAME)
  message(FATAL_ERROR "CORE_SYSTEM_NAME not set. Check that it's defined for your platform: ${CORE_PLATFORM_NAME_LC}")
endif()

if(NOT MESON_SYSTEM)
  message(FATAL_ERROR "MESON_SYSTEM not set. Check that it's defined for your platform: ${CORE_PLATFORM_NAME_LC}")
endif()

# sanity check that these are strings
string(REPLACE ";" " " WITH_TARGET_CFLAGS "${WITH_TARGET_CFLAGS}")
string(REPLACE ";" " " WITH_TARGET_CXXFLAGS "${WITH_TARGET_CXXFLAGS}")
string(REPLACE ";" " " WITH_TARGET_LDFLAGS "${WITH_TARGET_LDFLAGS}")

# CONFIG FLAGS (should be possible on all platforms)
set(PLATFORM_INCLUDES "-I${INSTALL_PREFIX_TARGET}/include -isystem ${INSTALL_PREFIX_TARGET}/include" CACHE STRING "" FORCE)

set(PLATFORM_CFLAGS "${WITH_TARGET_CFLAGS} ${PLATFORM_INCLUDES}" CACHE STRING "" FORCE)
set(PLATFORM_CXXFLAGS "${WITH_TARGET_CFLAGS} ${WITH_TARGET_CXXFLAGS} ${PLATFORM_INCLUDES}" CACHE STRING "" FORCE)
set(PLATFORM_LDFLAGS "${WITH_TARGET_LDFLAGS} -Wl,-rpath-link=${INSTALL_PREFIX_TARGET}/lib -L${INSTALL_PREFIX_TARGET}/lib" CACHE STRING "" FORCE)
