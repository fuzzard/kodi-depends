set(CORE_SYSTEM_NAME osx)
set(MESON_SYSTEM darwin)

list(APPEND WITH_TARGET_CFLAGS "-fheinous-gnu-extensions -no-cpp-precomp -mmacosx-version-min=10.13 -arch ${WITH_CPU} -isysroot ${WITH_SDK_PATH}")
list(APPEND WITH_TARGET_CXXFLAGS "-stdlib=libc++ ${WITH_TARGET_CFLAGS}")
list(APPEND WITH_TARGET_LDFLAGS "-Wl,-search_paths_first -stdlib=libc++ -mmacosx-version-min=10.13 -arch ${WITH_CPU} -isysroot ${WITH_SDK_PATH}")
