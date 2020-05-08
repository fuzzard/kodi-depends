set(PKG_NAME "TexturePacker")
set(PKG_VERSION "1.0.0")
set(PKG_SHA256 "65316fa1bb69473d0f4c8da1f0e2d7b2340ead3a3814e9dbf85393f68f545ab8")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain"
                       "libpng"
                       "lzo"
                       "giflib"
                       "libjpeg-turbo")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_HOST "KODI_SRC_DIR=${WITH_KODI_SOURCE}"
                            "EXTRA_DEFINES=-L${INSTALL_PREFIX_HOST}/lib"
                            "STATIC_FLAG=-enable-static")

if(APPLE)
  set(PKG_BUILD_CFLAGS_HOST "-DTARGET_DARWIN")
endif()
