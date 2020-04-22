set(PKG_NAME "mesa")
set(PKG_VERSION "20.0.5")
set(PKG_SHA256 "fe1d9c21a007af21ac0fd80561c0b4246994d976d8bacd28d93fe0559f8888db")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_URL "https://github.com/mesa3d/mesa/archive/${PKG_ARCHIVE}")
set(PKG_DEPENDS_NATIVE "")
set(PKG_DEPENDS_TARGET "libdrm")
set(PKG_TOOLCHAIN "meson")

set(PKG_MESON_OPTS_TARGET "-Ddri-drivers="
                          "-Dgallium-drivers=kmsro,lima"
                          "-Dgallium-extra-hud=false"
                          "-Dgallium-xvmc=false"
                          "-Dgallium-omx=disabled"
                          "-Dgallium-nine=false"
                          "-Dgallium-opencl=disabled"
                          "-Dvulkan-drivers="
                          "-Dshader-cache=true"
                          "-Dshared-glapi=true"
                          "-Dopengl=true"
                          "-Dgbm=true"
                          "-Degl=true"
                          "-Dvalgrind=false"
                          "-Dlibunwind=false"
                          "-Dlmsensors=false"
                          "-Dbuild-tests=false"
                          "-Dselinux=false"
                          "-Dosmesa=none"
                          "-Dplatforms=drm"
                          "-Ddri3=false"
                          "-Dglx=disabled"
                          "-Dglvnd=false"
                          "-Dllvm=false"
                          "-Dgallium-vdpau=false"
                          "-Dgallium-va=false"
                          "-Dgallium-xa=false"
                          "-Dgles1=false"
                          "-Dgles2=true")

