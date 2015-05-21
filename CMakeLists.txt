cmake_minimum_required (VERSION 2.6)
project(nanotap)

enable_testing()

add_executable(01_c t/01_c.c)
set_target_properties(01_c PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/t/")

add_executable(02_cpp t/02_cpp.cc)
set_target_properties(02_cpp PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/t/")

add_executable(04_is_binary t/04_is_binary.cc)
set_target_properties(04_is_binary PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/t/")

add_test(NAME prove COMMAND prove t)

