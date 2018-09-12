cmake_minimum_required(VERSION 2.8)
project(ios_unabto)

set(UNABTO_CRYPTO_MODULE libtomcrypt)
set(UNABTO_RANDOM_MODULE libtomcrypt)
add_definitions(-DNABTO_ENABLE_UCRYPTO=1)
add_definitions(-DNABTO_ENABLE_TCP_FALLBACK=0)

set(UNABTO_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/unabto)
include(${UNABTO_ROOT}/build/cmake/unabto_project.cmake)

add_definitions(-DDEBUG)
add_definitions(-miphoneos-version-min=8.0)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fvisibility=hidden")

add_definitions(${unabto_definitions})

set(src
  ${unabto_src}
  ${unabto_module_util_src}
  ${CMAKE_CURRENT_SOURCE_DIR}/src/unabto_app_runner.c
  ${UNABTO_ROOT}/apps/stream_echo/src/stream_echo.c
  ${UNABTO_ROOT}/apps/stream_echo/src/select_impl.c
)

include_directories(
  ${unabto_include_directories}
  ${UNABTO_ROOT}/apps/stream_echo/src
)

add_library(unabto_ios_lib ${src})



