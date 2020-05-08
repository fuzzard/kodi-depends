set(PKG_NAME "TexturePacker")
set(PKG_VERSION "1.0")
set(PKG_SHA256 "6cb397bba64b13e32b9575832d2bcd834ac583018a8f487890abfcc3ba87a365")
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

