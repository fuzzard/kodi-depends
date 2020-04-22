set(VALID_LINUX_PLATFORMS_LIST wayland gbm x11 CACHE STRING "List of valid linux platforms" FORCE)
set(VALID_PLATFORMS_LIST ${VALID_LINUX_PLATFORMS_LIST} rbpi android osx ios tvos CACHE STRING "List of valid platforms" FORCE)
string(REPLACE ";" " " VALID_PLATFORMS_STRING "${VALID_PLATFORMS_LIST}")

set(VALID_RENDERSYSTEMS_LIST gl gles CACHE STRING "List of valid rendersystems for linux" FORCE)
