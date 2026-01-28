%%cpp_init_replace%%_link_compile_commands(compile_commands.json)

find_package(Catch2 3 REQUIRED)
add_executable(${%%CPP_INIT_REPLACE%%_TEST_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/test_exe.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/test_fib.cpp
)
target_link_libraries(${%%CPP_INIT_REPLACE%%_TEST_NAME}
    PRIVATE
        ${%%CPP_INIT_REPLACE%%_OBJLIB_NAME}
        ${%%CPP_INIT_REPLACE%%_LIB_NAME}
        Catch2::Catch2WithMain
)

target_include_directories(${%%CPP_INIT_REPLACE%%_TEST_NAME}
    PRIVATE
    ${PROJECT_SOURCE_DIR}/src
    ${PROJECT_SOURCE_DIR}/lib
)

%%cpp_init_replace%%_target_enable_sanitizers(${%%CPP_INIT_REPLACE%%_TEST_NAME} PRIVATE)
include(CTest)
include(Catch)
catch_discover_tests(${%%CPP_INIT_REPLACE%%_TEST_NAME})
%%cpp_init_replace%%_target_add_coverage(${%%CPP_INIT_REPLACE%%_TEST_NAME} PUBLIC CREATE_TARGET)
%%cpp_init_replace%%_target_enable_clang_tidy(${%%CPP_INIT_REPLACE%%_TEST_NAME} --checks "-misc-include-cleaner,-readability-magic-numbers")
%%cpp_init_replace%%_target_enable_cppcheck(${%%CPP_INIT_REPLACE%%_TEST_NAME})
