
if(EXISTS "${PROJECT_SOURCE_DIR}/cmake/platform/${CORE_PLATFORM_NAME_LC}/Options.cmake")
  include(cmake/platform/${CORE_PLATFORM_NAME_LC}/Options.cmake)
endif()
