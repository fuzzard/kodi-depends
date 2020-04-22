set(PKG_NAME "dav1d")
set(PKG_VERSION "0.6.0")
set(PKG_SHA256 "66c3e831a93f074290a72aad5da907e3763ecb092325f0250a841927b3d30ce3")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_NATIVE "")
set(PKG_DEPENDS_TARGET "meson-native"
                       "ninja-native"
                       "nasm-native")
set(PKG_TOOLCHAIN "meson")

set(PKG_MESON_OPTS_NATIVE "--default-library=static"
                          "-Denable_asm=true"
                          "-Denable_tools=false"
                          "-Denable_examples=false"
                          "-Denable_tests=false")

set(PKG_MESON_OPTS_TARGET ${PKG_MESON_OPTS_TARGET})

