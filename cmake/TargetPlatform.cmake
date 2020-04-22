# Only use CORE_PLATFORM_NAME_LC after here
string(TOLOWER ${CORE_PLATFORM_NAME} CORE_PLATFORM_NAME_LC)

if(CORE_PLATFORM_NAME_LC STREQUAL android)

  set(ANDROID_TOOLCHAIN linux-x86_64)
  set(WITH_TOOLCHAIN ${WITH_NDK_PATH}/toolchains/llvm/prebuilt/${ANDROID_TOOLCHAIN})

elseif(CORE_PLATFORM_NAME_LC STREQUAL tvos)

  set(WITH_CPU arm64)

  set(WITH_BUILD x86_64-apple-darwin)
  set(WITH_HOST aarch64-apple-darwin)

  set(WITH_TOOLCHAIN /Applications/Xcode10.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain)
  set(WITH_SDK_PATH /Applications/Xcode10.2.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/SDKs/AppleTVOS12.2.sdk)

  elseif(CORE_PLATFORM_NAME_LC STREQUAL ios)

  set(WITH_CPU arm64)

  set(WITH_BUILD x86_64-apple-darwin)
  set(WITH_HOST aarch64-apple-darwin)

  set(WITH_TOOLCHAIN /Applications/Xcode10.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain)
  set(WITH_SDK_PATH /Applications/Xcode10.2.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.2.sdk)

elseif(CORE_PLATFORM_NAME_LC STREQUAL osx)

  set(WITH_CPU x86_64)

  set(WITH_BUILD x86_64-apple-darwin)
  set(WITH_HOST x86_64-apple-darwin)

  set(WITH_TOOLCHAIN /Applications/Xcode10.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain)
  set(WITH_SDK_PATH /Applications/Xcode10.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk)

elseif(CORE_PLATFORM_NAME_LC STREQUAL rbpi)

endif()
