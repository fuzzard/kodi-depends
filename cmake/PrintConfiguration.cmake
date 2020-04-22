set(DASHES "===========================")

message(NOTICE \n${DASHES}${DASHES}${DASHES})
message(NOTICE "Build Options")
message(STATUS "Install Prefix: ${WITH_PREFIX}")
message(STATUS "Using Toolchain: ${WITH_TOOLCHAIN}")
message(STATUS "Target Platform: ${CORE_PLATFORM_NAME_LC}")
message(STATUS "Target CPU: ${WITH_CPU}")
message(STATUS "Build Triplet: ${WITH_BUILD}")
message(STATUS "Host Triplet: ${WITH_HOST}")
message(STATUS "CMake build type: ${CMAKE_BUILD_TYPE}")
message(STATUS "Enable CCache: ${ENABLE_CCACHE}")
message(STATUS "Enable GPLv3: ${ENABLE_GPLV3}")
message(STATUS "Enable Console Logging ${ENABLE_CONSOLE_LOGGING}")
message(STATUS "Archives Location: ${WITH_ARCHIVES}")

message(STATUS "Target cflags: ${WITH_TARGET_CFLAGS}")
message(STATUS "Target cxxflags: ${WITH_TARGET_CXXFLAGS}")
message(STATUS "Target ldflags: ${WITH_TARGET_LDFLAGS}")

message(STATUS "FFmpeg Options: ${WITH_FFMPEG_OPTIONS}")

# android
message(STATUS "NDK Path: ${WITH_NDK_PATH}")
message(STATUS "SDK Path: ${WITH_SDK_PATH}")
message(STATUS "SDK Platform Version: ${WITH_SDK_PLATFORM_VERSION}")
message(STATUS "NDK API Level: ${WITH_NDK_API}")

# linux/freebsd
message(STATUS "Render System: ${WITH_RENDERSYSTEM}")

# rpbi
message(STATUS "Firmware Location: ${WITH_FIRMWARE}")
message(NOTICE ${DASHES}${DASHES}${DASHES})

message(NOTICE \n${DASHES}${DASHES}${DASHES})
message(NOTICE "Build Configuration")
message(STATUS "App Name: ${APP_NAME}")
message(STATUS "Base URL: ${BASE_URL}")
message(STATUS "Target Install Prefix: ${INSTALL_PREFIX_TARGET}")
message(STATUS "Native Install Prefix: ${INSTALL_PREFIX_NATIVE}")
message(STATUS "Target Build Directory: ${BUILD_DIR_TARGET}")
message(STATUS "Native Build Directory: ${BUILD_DIR_NATIVE}")
message(STATUS "Meson CPU: ${MESON_CPU}")
message(STATUS "Meson System: ${MESON_SYSTEM}")
message(STATUS "Cmake System: ${CMAKE_SYSTEM_NAME}")
message(STATUS "Core System: ${CORE_SYSTEM_NAME}")
message(NOTICE ${DASHES}${DASHES}${DASHES})

message(NOTICE \n${DASHES}${DASHES}${DASHES})
message(NOTICE "Platform Flags")
message(STATUS "PLATFORM_INCLUDES: ${PLATFORM_INCLUDES}")
message(STATUS "PLATFORM_CFLAGS: ${PLATFORM_CFLAGS}")
message(STATUS "PLATFORM_CXXFLAGS: ${PLATFORM_CXXFLAGS}")
message(STATUS "PLATFORM_LDFLAGS: ${PLATFORM_LDFLAGS}")

message(STATUS "CMAKE_C_FLAGS_RELEASE: ${CMAKE_C_FLAGS_RELEASE}")
message(STATUS "CMAKE_CXX_FLAGS_RELEASE: ${CMAKE_CXX_FLAGS_RELEASE}")

message(STATUS "CMAKE_C_FLAGS_DEBUG: ${CMAKE_C_FLAGS_DEBUG}")
message(STATUS "CMAKE_CXX_FLAGS_DEBUG: ${CMAKE_CXX_FLAGS_DEBUG}")

message(STATUS "CMAKE_C_FLAGS: ${CMAKE_C_FLAGS}")
message(STATUS "CMAKE_CXX_FLAGS: ${CMAKE_CXX_FLAGS}")

message(STATUS "CMAKE_EXE_LINKER_FLAGS: ${CMAKE_EXE_LINKER_FLAGS}")
message(NOTICE ${DASHES}${DASHES}${DASHES}\n)
