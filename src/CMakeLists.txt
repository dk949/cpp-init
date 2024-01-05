link_compile_commands()

file(GLOB_RECURSE SOURCE_FILES "${CMAKE_SOURCE_DIR}/src/*.cpp")
list(REMOVE_ITEM SOURCE_FILES ${MAIN})
add_dummy_source(SOURCE_FILES)

add_library(${OBJLIB_NAME} OBJECT ${SOURCE_FILES})
target_include_directories(${OBJLIB_NAME} PUBLIC "${CMAKE_BINARY_DIR}/project_config/include")

find_package(fmt CONFIG REQUIRED)
target_link_libraries(${OBJLIB_NAME} PUBLIC fmt::fmt)

enable_sanitizers(${OBJLIB_NAME} PUBLIC)
set_target_warnings(${OBJLIB_NAME} PUBLIC)

add_executable(${EXE_NAME} ${MAIN})
target_link_libraries(${EXE_NAME} PRIVATE ${OBJLIB_NAME})
