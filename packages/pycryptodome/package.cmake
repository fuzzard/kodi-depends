set(PKG_NAME "pycryptodome")
set(PKG_VERSION "3.4.3")
set(PKG_SHA256 "a77e6eb562641b6922685725bfb62dd33e37abae0491ce56f9c4b5606fd19a1f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_NATIVE "")
set(PKG_DEPENDS_TARGET "Python-native"
                       "setuptools")
set(PKG_TOOLCHAIN "custom")
set(PKG_PATCHES "01-nosetuptool.patch"
                "02-obey-crosscompileflags.patch")

if(CORE_SYSTEM_NAME STREQUAL android)
  list(APPEND PKG_PATCHES "03-android-dlopen.patch")
endif()

set(PKG_LDSHARED "${TARGET_CC} -shared")

set(PKG_BUILD_COMMAND_TARGET LDSHARED=${PKG_LDSHARED} ${INSTALL_PREFIX_NATIVE}/bin/python3 setup.py build_ext --plat-name ${CORE_SYSTEM_NAME}-${WITH_CPU})
set(PKG_INSTALL_COMMAND_TARGET ${INSTALL_PREFIX_NATIVE}/bin/python3 setup.py install --prefix=${INSTALL_PREFIX_TARGET})

