%%cpp_init_replace%%_link_compile_commands(compile_commands.json)

add_library(${%%CPP_INIT_REPLACE%%_OBJLIB_NAME} OBJECT
    ${CMAKE_CURRENT_SOURCE_DIR}/factorial.cpp
)
target_include_directories(
    ${%%CPP_INIT_REPLACE%%_OBJLIB_NAME}
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
        ${PROJECT_BINARY_DIR}/project_config/include
)

%%cpp_init_replace%%_target_enable_sanitizers(${%%CPP_INIT_REPLACE%%_OBJLIB_NAME} PUBLIC)
%%cpp_init_replace%%_target_warnings(${%%CPP_INIT_REPLACE%%_OBJLIB_NAME} PUBLIC)
%%cpp_init_replace%%_target_add_coverage(${%%CPP_INIT_REPLACE%%_OBJLIB_NAME} PUBLIC)
%%cpp_init_replace%%_target_macro_prefix(${%%CPP_INIT_REPLACE%%_OBJLIB_NAME} PUBLIC)

add_executable(${%%CPP_INIT_REPLACE%%_EXE_NAME}_exe ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)
%%cpp_init_replace%%_target_enable_cppcheck(${%%CPP_INIT_REPLACE%%_EXE_NAME}_exe)
%%cpp_init_replace%%_target_enable_clang_tidy(${%%CPP_INIT_REPLACE%%_EXE_NAME}_exe)
target_link_libraries(${%%CPP_INIT_REPLACE%%_EXE_NAME}_exe
    PRIVATE
        ${%%CPP_INIT_REPLACE%%_OBJLIB_NAME}
        ${%%CPP_INIT_REPLACE%%_LIB_NAME})
set_property(TARGET ${%%CPP_INIT_REPLACE%%_EXE_NAME}_exe PROPERTY OUTPUT_NAME ${%%CPP_INIT_REPLACE%%_EXE_NAME})
