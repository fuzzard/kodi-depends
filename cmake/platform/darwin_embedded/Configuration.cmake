set(CMAKE_SYSTEM_NAME Darwin)
set(CORE_SYSTEM_NAME darwin_embedded)
set(MESON_SYSTEM darwin)

list(APPEND WITH_TARGET_CFLAGS "-fheinous-gnu-extensions -no-cpp-precomp -ftree-vectorize -pipe -Wno-trigraphs -fpascal-strings -Wreturn-type -Wunused-variable -fmessage-length=0 -gdwarf-2 -Wno-error=implicit-function-declaration -arch ${WITH_CPU} -isysroot ${WITH_SDK_PATH}")
list(APPEND WITH_TARGET_CXXFLAGS "-std=c++14 -no-cpp-precomp -stdlib=libc++ -arch ${WITH_CPU} -isysroot ${WITH_SDK_PATH}")
list(APPEND WITH_TARGET_LDFLAGS "-Wl,-search_paths_first -L${WITH_SDK_PATH}/usr/lib -isysroot ${WITH_SDK_PATH} -stdlib=libc++ -arch ${WITH_CPU}")

# TARGET_CC not populated from Toolchainsetup.cmake yet
# better way to handle this? Relocate target_as assignment elsewhere?
if(NOT TARGET_CC)
  set(CMAKE_FIND_ROOT_PATH ${WITH_TOOLCHAIN})
  find_program(TARGET_CC NAMES clang)
endif()

set(TARGET_AS "${INSTALL_PREFIX_HOST}/bin/gas-preprocessor.pl -arch aarch64 -- ${TARGET_CC}")
