set(PKG_NAME "TexturePacker")
set(PKG_VERSION "1.0")
set(PKG_SHA256 "33f613ae3ea68aa161d261ca03202839b2e7acbaa0229071bf8b618daa5b3a38")
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
                            "--enable-static")

