cmake_minimum_required(VERSION 3.0)

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
install(TARGETS ${PROJECT_NAME} DESTINATION lib)
install(FILES xdelta3/xdelta3.h DESTINATION ${PROJECT_NAME}/include)
install(FILES cmake/xdelta3Config.cmake DESTINATION lib/cmake/xdelta3)
