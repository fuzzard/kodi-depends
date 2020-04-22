set(PKG_NAME "mariadb")
set(PKG_VERSION "3.0.3")
set(PKG_SHA256 "210f0ee3414b235d3db8e98e9e5a0a98381ecf771e67ca4a688036368984eeea")
set(PKG_ARCHIVE "${PKG_NAME}-connector-c-${PKG_VERSION}-src.tar.gz")
set(PKG_DEPENDS_TARGET "openssl"
                       "libiconv"
                       "zlib")
set(PKG_TOOLCHAIN "cmake")
set(PKG_PATCHES "01-android.patch")

# todo: sed patches

set(PKG_CMAKE_OPTS_TARGET "-DAUTH_GSSAPI=OFF"
                          "-DWITH_UNITTEST=OFF"
                          "-DWITH_EXTERNAL_ZLIB=ON"
                          "-DWITH_CURL=OFF")

