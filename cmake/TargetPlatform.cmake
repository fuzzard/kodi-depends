# Only use CORE_PLATFORM_NAME_LC after here
string(TOLOWER ${CORE_PLATFORM_NAME} CORE_PLATFORM_NAME_LC)

if(CORE_PLATFORM_NAME_LC STREQUAL android)

  set(ANDROID_TOOLCHAIN linux-x86_64)
  set(WITH_TOOLCHAIN ${WITH_NDK_PATH}/toolchains/llvm/prebuilt/${ANDROID_TOOLCHAIN})

elseif(CORE_PLATFORM_NAME_LC STREQUAL tvos OR CORE_PLATFORM_NAME_LC STREQUAL ios)

  if(CORE_PLATFORM_NAME_LC STREQUAL tvos)
    set(platform_name appletvos)
  else()
    set(platform_name iphoneos)
  endif()

  set(WITH_CPU arm64 CACHE STRING "Target CPU")
  set(WITH_BUILD x86_64-apple-darwin CACHE STRING "Build OS triplet")
  set(WITH_HOST aarch64-apple-darwin CACHE STRING "Target OS triplet")

  if(NOT WITH_PREFIX)
    set(WITH_PREFIX "/Users/Shared/xbmc-depends/kodi-depends/${platform_name}" CACHE STRING "Prefix path to install depends")
  endif()
  if(NOT WITH_ARCHIVES)
    set(WITH_ARCHIVES "/Users/Shared/xbmc-depends/kodi-archives" CACHE STRING "Path to where archives will be saved")
  endif()

  execute_process(COMMAND bash -c "xcode-select -print-path" OUTPUT_VARIABLE XCODE_PATH OUTPUT_STRIP_TRAILING_WHITESPACE)
  execute_process(COMMAND bash -c "${XCODE_PATH}/usr/bin/xcodebuild -showsdks | grep ${platform_name} | sort | tail -n 1 | awk '{ print $2}'"
                  OUTPUT_VARIABLE SDK_VER OUTPUT_STRIP_TRAILING_WHITESPACE)
  execute_process(COMMAND bash -c "${XCODE_PATH}/usr/bin/xcodebuild -version -sdk ${platform_name}${SDK_VER} | grep ^Path | awk '{ print $2}'"
                  OUTPUT_VARIABLE SDK_PATH OUTPUT_STRIP_TRAILING_WHITESPACE)

  set(WITH_SDK_PATH "${SDK_PATH}" CACHE STRING "path to SDK")
  set(WITH_TOOLCHAIN "${XCODE_PATH}/Toolchains/XcodeDefault.xctoolchain" CACHE STRING "Path to toolchain")
  set(WITH_HOSTTOOLCHAIN "${XCODE_PATH}/usr/bin" CACHE STRING "Path to host toolchain")

elseif(CORE_PLATFORM_NAME_LC STREQUAL osx)

  set(WITH_CPU x86_64)

  set(WITH_BUILD x86_64-apple-darwin)
  set(WITH_HOST x86_64-apple-darwin)

  set(WITH_TOOLCHAIN /Applications/Xcode10.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain)
  set(WITH_SDK_PATH /Applications/Xcode10.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk)

elseif(CORE_PLATFORM_NAME_LC STREQUAL rbpi)

endif()
