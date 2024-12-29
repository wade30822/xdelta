cmake_minimum_required(VERSION 3.10)

project(xdelta3 VERSION 3.0.11)

include(CheckTypeSize)
check_type_size(size_t XD3_SIZEOF_SIZE_T)
check_type_size("unsigned long long" XD3_SIZEOF_UNSIGNED_LONG_LONG)

set(XD3_SOURCES xdelta3/xdelta3.c)

add_compile_definitions(SIZEOF_SIZE_T=${XD3_SIZEOF_SIZE_T})
add_compile_definitions(
  SIZEOF_UNSIGNED_LONG_LONG=${XD3_SIZEOF_UNSIGNED_LONG_LONG})
add_compile_definitions(XD3_USE_LARGEFILE64=1)
add_compile_definitions(XD3_USE_LARGESIZET=1)
add_compile_definitions(XD3_ENCODER=1)

add_library(${PROJECT_NAME} ${XD3_SOURCES})

target_include_directories(
  ${PROJECT_NAME} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/xdelta3>
                         $<INSTALL_INTERFACE:include/${PROJECT_NAME}>)

file(GLOB PUBLIC_HEADERS "xdelta3/*.h")
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER
                                                 "${PUBLIC_HEADERS}")
install(
  TARGETS ${PROJECT_NAME}
  EXPORT ${PROJECT_NAME}-targets
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  PUBLIC_HEADER DESTINATION include/${PROJECT_NAME})

install(
  EXPORT ${PROJECT_NAME}-targets
  FILE ${PROJECT_NAME}-config.cmake
  DESTINATION lib/cmake/${PROJECT_NAME})
