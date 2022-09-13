cmake_minimum_required(VERSION 2.8.12)
project(Types_and_Byte_Order)

add_definitions("-std=c++11")

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(example_1 src/example_1.cpp)
add_executable(example_2 src/example_2.cpp)
add_executable(example_3 src/example_3.cpp)

target_link_libraries(example_1 ${CONAN_LIBS})
target_link_libraries(example_2 ${CONAN_LIBS})
target_link_libraries(example_3 ${CONAN_LIBS})
