set(PKG_NAME "gen_entitlements")
set(PKG_VERSION "1.0.0")
set(PKG_SHA256 "6b22ac443531590dc517ae386617ef7f614af60d704591dab0253e56dd786ffd")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_TOOLCHAIN "custom")

set(PKG_INSTALL_COMMAND_HOST install -d ${INSTALL_PREFIX_HOST}/bin
                     COMMAND install gen_entitlements.py ${INSTALL_PREFIX_HOST}/bin)
