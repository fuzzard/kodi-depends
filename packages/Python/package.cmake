set(PKG_NAME "Python")
set(PKG_VERSION "3.7.4")
set(PKG_SHA256 "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_URL "https://www.python.org/ftp/python/${PKG_VERSION}/${PKG_ARCHIVE}")
set(PKG_DEPENDS_HOST "toolchain"
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
                       "06-apple.patch")

if(APPLE)
  if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
    list(APPEND PKG_PATCHES_TARGET "07-darwin_embedded.patch")        
  endif()
  list(APPEND PKG_PATCHES_TARGET "08-apple-link-intl-for-locale.patch")
elseif(CORE_SYSTEM_NAME STREQUAL android)
  list(APPEND PKG_PATCHES_TARGET "08-android-disable-locale.patch")
else()
  list(APPEND PKG_PATCHES_TARGET "08-link-intl-for-locale.patch")
endif()

set(PKG_CONFIGURE_OPTS_HOST "--disable-shared"
                            "--disable-framework"
                            "--without-pymalloc"
                            "--without-doc-strings"
                            "--with-system-ffi"
                            "--with-system-expat")

#checking for aarch64-apple-darwin-pkg-config... /Users/Shared/xbmc-depends/kodi-depends/appletvos/x86_64-apple-darwin/bin/pkg-config
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
               
if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "ac_cv_func_clock_settime=no"
                                        "ac_cv_func_sigaltstack=no"
                                        "ac_cv_func_vfork_works=no"
                                        "ac_cv_func_fork=no")
endif()

set(PKG_MAKE_OPTS_TARGET PYTHON_FOR_BUILD=${INSTALL_PREFIX_HOST}/bin/python3
                         HOST_PGEN=${INSTALL_PREFIX_HOST}/bin/pgen
                         CROSS_COMPILE_TARGET=yes
                         libpython3.7.a)

set(PKG_MAKE_INSTALL_OPTS_TARGET PYTHON_FOR_BUILD=${INSTALL_PREFIX_HOST}/bin/python3
                                 HOST_PGEN=${INSTALL_PREFIX_HOST}/bin/pgen
                                 CROSS_COMPILE_TARGET=yes)


# todo: other install targets???
