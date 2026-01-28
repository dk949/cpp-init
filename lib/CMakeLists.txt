%%cpp_init_replace%%_link_compile_commands(compile_commands.json)

add_library(${%%CPP_INIT_REPLACE%%_LIB_NAME} STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/fib.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/helper.cpp
)
target_include_directories(
    ${%%CPP_INIT_REPLACE%%_LIB_NAME}
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
    PRIVATE
        ${PROJECT_BINARY_DIR}/project_config/include
)
%%cpp_init_replace%%_target_enable_sanitizers(${%%CPP_INIT_REPLACE%%_LIB_NAME} PRIVATE)
%%cpp_init_replace%%_target_warnings(${%%CPP_INIT_REPLACE%%_LIB_NAME} PRIVATE)
%%cpp_init_replace%%_target_add_coverage(${%%CPP_INIT_REPLACE%%_LIB_NAME} PRIVATE)
%%cpp_init_replace%%_target_enable_cppcheck(${%%CPP_INIT_REPLACE%%_LIB_NAME})
%%cpp_init_replace%%_target_enable_clang_tidy(${%%CPP_INIT_REPLACE%%_LIB_NAME})
%%cpp_init_replace%%_target_macro_prefix(${%%CPP_INIT_REPLACE%%_LIB_NAME} PRIVATE)
