set(PKG_NAME "openssl")
set(PKG_VERSION "1.1.0h")
set(PKG_SHA256 "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_NATIVE "")
set(PKG_DEPENDS_TARGET "zlib")
set(PKG_TOOLCHAIN "custom")

if(CORE_SYSTEM_NAME STREQUAL linux)
  if(WITH_CPU MATCHES x86_64)
    set(OPENSSL_PLATFORM linux-x86_64)
  elseif(WITH_CPU MATCHES arm)
    set(OPENSSL_PLATFORM linux-armv4)
  elseif(WITH_CPU MATCHES aarch64)
    set(OPENSSL_PLATFORM linux-aarch64)
  endif()
elseif(CORE_SYSTEM_NAME STREQUAL osx)
  set(OPENSSL_PLATFORM darwin64-${WITH_CPU}-cc)
elseif(CORE_SYSTEM_NAME STREQUAL android)
  set(OPENSSL_PLATFORM linux-generic32)
  set(OPENSSL_OPTIONS -D__ANDROID_API__=${WITH_NDK_API})
endif()

# todo: sed patches

set(PKG_CONFIGURE_OPTS_TARGET "no-shared"
                              "zlib"
                              "no-asm"
                              "--prefix=${INSTALL_PREFIX_TARGET}"
                              "--libdir=lib"
                              "--with-zlib-include=${INSTALL_PREFIX_TARGET}/include"
                              "--with-zlib-lib=${INSTALL_PREFIX_TARGET}/lib"
                              "${OPENSSL_PLATFORM}"
                              "${OPENSSL_OPTIONS}")

set(PKG_CONFIGURE_COMMAND_TARGET ./Configure ${PKG_CONFIGURE_OPTS_TARGET})

set(PKG_BUILD_COMMAND_TARGET $(MAKE))

set(PKG_INSTALL_COMMAND_TARGET $(MAKE) install_sw)

