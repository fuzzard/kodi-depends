set(PKG_NAME "Python")
set(PKG_VERSION "3.7.4")
set(PKG_SHA256 "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_URL "https://www.python.org/ftp/python/${PKG_VERSION}/${PKG_ARCHIVE}")
set(PKG_DEPENDS_NATIVE "toolchain"
                       "expat"
                       "libffi"
                       "zlib")
set(PKG_DEPENDS_TARGET "expat"
                       "gettext"
                       "libxml2"
                       "sqlite3"
                       "openssl"
                       "libffi")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)
set(PKG_PATCHES_TARGET "01-crosscompile.patch"
                       "02-fix-datetime.patch"
                       "03-android.patch"
                       "04-fix-ffi.patch"
                       "05-android-nl_langinfo.patch"
                       "06-apple.patch"
                       "08-link-intl-for-locale.patch")

if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_PATCHES "07-darwin_embedded.patch")
endif()

set(PKG_CONFIGURE_OPTS_NATIVE "--disable-shared"
                              "--disable-framework"
                              "--without-pymalloc"
                              "--with-system-ffi"
                              "--with-system-expat")

set(PKG_CONFIGURE_OPTS_TARGET "ac_cv_func_gethostbyname_r=no"
                              "ac_cv_header_sys_un_h=yes"
                              "ac_cv_file__dev_ptmx=no"
                              "ac_cv_file__dev_ptc=no"
                              "--disable-shared"
                              "--without-ensurepip"
                              "--disable-framework"
                              "--with-system-expat"
                              "--with-system-ffi"
                              "--without-pymalloc"
                              "--enable-ipv6")

set(PKG_MAKE_OPTS_TARGET PYTHON_FOR_BUILD=${INSTALL_NATIVE_PREFIX}/bin/python3
                         NATIVE_PGEN=${INSTALL_NATIVE_PREFIX}/bin/pgen
                         CROSS_COMPILE_TARGET=yes
                         libpython3.7.a)

set(PKG_MAKE_INSTALL_OPTS_TARGET PYTHON_FOR_BUILD=${INSTALL_NATIVE_PREFIX}/bin/python3
                                 NATIVE_PGEN=${INSTALL_NATIVE_PREFIX}/bin/pgen
                                 CROSS_COMPILE_TARGET=yes)


# todo: other install targets???
