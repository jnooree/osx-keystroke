cmake_minimum_required(VERSION 3.14 FATAL_ERROR)
project(osx-keystroke LANGUAGES C)

# Only do these if this is the main project, and not if it is included through
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Bulid type")

  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
  add_compile_options(-xobjective-c)
endif()

add_subdirectory(src)
