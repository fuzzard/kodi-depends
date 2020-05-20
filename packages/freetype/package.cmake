set(PKG_NAME "freetype")
set(PKG_VERSION "2.10.1")
set(PKG_SHA256 "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "custom")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--with-png=no")

set(PKG_CONFIGURE_COMMAND_TARGET ./autogen.sh
                         COMMAND ./configure ${PKG_CONFIGURE_OPTS_TARGET})

set(PKG_BUILD_COMMAND_TARGET $(MAKE))

set(PKG_INSTALL_COMMAND_TARGET $(MAKE) install)
