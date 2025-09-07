link_compile_commands(compile_commands.json)

add_executable(${TEST_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/test_factorial.cpp)
target_link_libraries(${TEST_NAME} PRIVATE ${OBJLIB_NAME})

find_package(Catch2 3 REQUIRED)
target_link_libraries(${TEST_NAME} PRIVATE Catch2::Catch2WithMain)
target_include_directories(${TEST_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/src)

include(CTest)
include(Catch)
catch_discover_tests(${TEST_NAME})
target_add_coverage(${TEST_NAME} PUBLIC)
