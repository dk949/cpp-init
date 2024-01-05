link_compile_commands()

file(GLOB_RECURSE TEST_FILES "${CMAKE_SOURCE_DIR}/tests/*.cpp")
add_executable(${TEST_NAME} ${TEST_FILES})
target_link_libraries(${TEST_NAME} PRIVATE ${OBJLIB_NAME})

find_package(Catch2 3 REQUIRED)
target_link_libraries(${TEST_NAME} PRIVATE Catch2::Catch2WithMain)
target_include_directories(${TEST_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/src)

include(CTest)
include(Catch)
catch_discover_tests(${TEST_NAME})
