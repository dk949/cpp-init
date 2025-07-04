link_compile_commands(compile_commands.json)

add_library(${OBJLIB_NAME} OBJECT
    ${CMAKE_CURRENT_SOURCE_DIR}/factorial.cpp
)

target_sources(${OBJLIB_NAME} PUBLIC FILE_SET HEADERS BASE_DIRS
    ${CMAKE_SOURCE_DIR}/src
    ${CMAKE_BINARY_DIR}/project_config/include
)

find_package(fmt CONFIG REQUIRED)
target_link_libraries(${OBJLIB_NAME} PUBLIC fmt::fmt)

enable_sanitizers(${OBJLIB_NAME} PUBLIC)
set_target_warnings(${OBJLIB_NAME} PUBLIC)
set_macro_prefix(${OBJLIB_NAME} PUBLIC)
target_add_coverage(${OBJLIB_NAME} PUBLIC)

add_executable(${EXE_NAME} ${MAIN})
target_link_libraries(${EXE_NAME} PRIVATE ${OBJLIB_NAME})
