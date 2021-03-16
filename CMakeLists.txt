cmake_minimum_required(VERSION 3.1)

project(Curl)

set(CMAKE_CXX_STANDARD 17)

# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.16.1/conan.cmake"
    "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(REQUIRES

  libcurl/7.75.0

  BASIC_SETUP CMAKE_TARGETS
  BUILD missing)

list(APPEND LIB_APPLICATION CONAN_PKG::libcurl)

add_executable(Main src/main.cpp)
target_link_libraries(Main ${LIB_APPLICATION})