set(PKG_NAME "wayland")
set(PKG_VERSION "1.13.0")
set(PKG_SHA256 "69b052c031a61e89af7cc8780893d0da1e301492352aa449dee9345043e6fe51")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_HOST "toolchain"
                     "expat")
set(PKG_DEPENDS_TARGET "expat"
                       "libffi")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_HOST "--disable-libraries"
                            "--disable-documentation"
                            "--disable-dtd-validation")

seT(PKG_CONFIGURE_OPTS_TARGET "--with-host-scanner"
                              "--disable-documentation"
                              "--disable-dtd-validation")

