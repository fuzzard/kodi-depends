  * [CMake Variables](#cmake-variables)
      * [PKG_NAME](#pkg_name)
      * [PKG_VERSION](#pkg_version)
      * [PKG_SHA256](#pkg_sha256)
      * [PKG_URL](#pkg_url)
      * [PKG_ARCHIVE](#pkg_archive)
      * [PKG_DEPENDS_NATIVE](#pkg_depends_native)
      * [PKG_DEPENDS_TARGET](#pkg_depends_target)
      * [PKG_TOOLCHAIN](#pkg_toolchain)
      * [PKG_PATCHES](#pkg_patches)
      * [PKG_PATCHES_NATIVE](#pkg_patches_native)
      * [PKG_PATCHES_TARGET](#pkg_patches_target)
      * [PKG_AUTORECONF](#pkg_autoreconf)
      * [PKG_BUILD_CFLAGS_NATIVE](#pkg_build_cflags_native)
      * [PKG_BUILD_CFLAGS_TARGET](#pkg_build_cflags_target)
      * [PKG_BUILD_LDFLAGS_NATIVE](#pkg_build_ldflags_native)
      * [PKG_BUILD_LDFLAGS_TARGET](#pkg_build_ldflags_target)
      * [PKG_CONFIGURE_OPTS_NATIVE](#pkg_configure_opts_native)
      * [PKG_CONFIGURE_OPTS_TARGET](#pkg_configure_opts_target)
      * [PKG_CMAKE_OPTS_NATIVE](#pkg_cmake_opts_native)
      * [PKG_CMAKE_OPTS_TARGET](#pkg_cmake_opts_target)
      * [PKG_MESON_OPTS_NATIVE](#pkg_meson_opts_native)
      * [PKG_MESON_OPTS_TARGET](#pkg_meson_opts_target)
      * [PKG_MAKE_OPTS_NATIVE](#pkg_make_opts_native)
      * [PKG_MAKE_OPTS_TARGET](#pkg_make_opts_target)
      * [PKG_MAKE_INSTALL_OPTS_NATIVE](#pkg_make_install_opts_native)
      * [PKG_MAKE_INSTALL_OPTS_TARGET](#pkg_make_install_opts_target)
      * [PKG_CONFIGURE_COMMAND_NATIVE](#pkg_configure_command_native)
      * [PKG_CONFIGURE_COMMAND_TARGET](#pkg_configure_command_target)
      * [PKG_BUILD_COMMAND_NATIVE](#pkg_build_command_native)
      * [PKG_BUILD_COMMAND_TARGET](#pkg_build_command_target)
      * [PKG_INSTALL_COMMAND_NATIVE](#pkg_install_command_native)
      * [PKG_INSTALL_COMMAND_TARGET](#pkg_install_command_target)
      * [PKG_POST_INSTALL_COMMAND_NATIVE](#pkg_post_install_command_native)
      * [PKG_POST_INSTALL_COMMAND_TARGET](#pkg_post_install_command_target)
  * [CMake Macros](#cmake-macros)
      * [add_depends_for_targets(targets)](#add_depends_for_targetstargets)

## CMake Variables

### PKG_NAME

> m4

### PKG_VERSION

> 1.4.18

### PKG_SHA256

> ab2633921a5cd38e48797bf5521ad259bdc4b979078034a3b790d7fec5493fab

### PKG_URL

Base url of package if not supplied by mirrors

### PKG_ARCHIVE

> ${PKG_NAME}-${PKG_VERSION}.tar.gz

### PKG_DEPENDS_NATIVE

Quoted list of dependencies for native

### PKG_DEPENDS_TARGET

Quoted list of dependencies for target

### PKG_TOOLCHAIN

toolchain that is used for building the package

 - autotools
 - cmake
 - meson
 - custom

### PKG_PATCHES
### PKG_PATCHES_NATIVE
### PKG_PATCHES_TARGET

Quoted list of patches in accending order. Patches must be prefixed with `[0-9][0-9]-`.

> "01-fix-ftbfs-with-glibc-2.28.patch"

### PKG_AUTORECONF

Boolean switch if package needs autoreconf step (autotools toolchain only).

- ON
- OFF

### PKG_BUILD_CFLAGS_NATIVE
### PKG_BUILD_CFLAGS_TARGET

Quoted list of CFLAGS (added to CXXFLAGS also)

### PKG_BUILD_LDFLAGS_NATIVE
### PKG_BUILD_LDFLAGS_TARGET

Quoted list of LDFLAGS

### PKG_CONFIGURE_OPTS_NATIVE
### PKG_CONFIGURE_OPTS_TARGET

Quoted list of options to specify for autotools builds. Use with `PKG_TOOLCHAIN=autotools`

### PKG_CMAKE_OPTS_NATIVE
### PKG_CMAKE_OPTS_TARGET

Quoted list of options to specify for cmake builds. Use with `PKG_TOOLCHAIN=cmake`

### PKG_MESON_OPTS_NATIVE
### PKG_MESON_OPTS_TARGET

Quoted list of options to specify for meson builds. Use with `PKG_TOOLCHAIN=meson`

### PKG_MAKE_OPTS_NATIVE
### PKG_MAKE_OPTS_TARGET

Unquoted list of make targets for native and target respectively. Use with `PKG_TOOLCHAIN=autotools`

### PKG_MAKE_INSTALL_OPTS_NATIVE
### PKG_MAKE_INSTALL_OPTS_TARGET

Unquoted list of make install targets for native and target respectively. Use with `PKG_TOOLCHAIN=autotools`

### PKG_CONFIGURE_COMMAND_NATIVE
### PKG_CONFIGURE_COMMAND_TARGET
### PKG_BUILD_COMMAND_NATIVE
### PKG_BUILD_COMMAND_TARGET
### PKG_INSTALL_COMMAND_NATIVE
### PKG_INSTALL_COMMAND_TARGET

Unquoted custom commands to be run for configure, build, and install respectively. Use with `PKG_TOOLCHAIN=custom`

### PKG_POST_INSTALL_COMMAND_NATIVE
### PKG_POST_INSTALL_COMMAND_TARGET

Quoted list of commands to be run post install.

## CMake Macros

### add_depends_for_targets(targets)

Macro to add package as a dependency. Must be called after all PKG_ variables are assigned. For example after using `include(packages/<pkgname>/package.cmake)`

Valid targets:
 - NATIVE
 - TARGET
