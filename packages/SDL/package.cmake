set(PKG_NAME "SDL")
set(PKG_VERSION "1.2.15")
set(PKG_SHA256 "d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "custom")
set(PKG_PATCHES "01-SDL_SetWidthHeight.patch"
                "02-OSX_interpretKeyEvents.patch"
                "03-mavericks-compile.patch"
	            "04-fix_external_screen_crash.patch")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-video-directfb"
                              "--without-x"
                              "--disable-video-x11"
                              "--prefix=${INSTALL_PREFIX_TARGET}")

set(PKG_CONFIGURE_COMMAND_TARGET ./autogen.sh
                         COMMAND ./Configure ${PKG_CONFIGURE_OPTS_TARGET})

set(PKG_BUILD_COMMAND_TARGET $(MAKE))

set(PKG_INSTALL_COMMAND_TARGET $(MAKE) install)
