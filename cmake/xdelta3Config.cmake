set(XDELTA3_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/${PROJECT_NAME}")
set(XDELTA3_LIBRARIES "${CMAKE_INSTALL_PREFIX}/lib/lib${PROJECT_NAME}.a")

# 设置对应的目标
set(XDELTA3_TARGET xdelta3)

set(XDELTA3_FOUND TRUE)

# 为了兼容不同版本的 CMake，可以提供 find_package 时的配置选项
find_package(PkgConfig)
if(PKG_CONFIG_FOUND)
  pkg_check_modules(XDELTA3 REQUIRED xdelta3)
  set(XDELTA3_INCLUDE_DIRS ${XDELTA3_INCLUDE_DIRS} ${XDELTA3_INCLUDE_DIRS})
  set(XDELTA3_LIBRARIES ${XDELTA3_LIBRARIES} ${XDELTA3_LIBRARIES})
endif()
