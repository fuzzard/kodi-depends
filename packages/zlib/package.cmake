set(PKG_NAME "zlib")
set(PKG_VERSION "1.2.11")
set(PKG_SHA256 "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "cmake")
set(PKG_PATCHES "01-visibility.patch")

set(PKG_CMAKE_OPTS_TARGET "-DCMAKE_BUILD_SHARED=OFF")

