# cmake-format: off


# Targets
set(EXE_NAME ${CMAKE_PROJECT_NAME} CACHE STRING "Name of the main executable")
set(OBJLIB_NAME ${CMAKE_PROJECT_NAME}_objlib CACHE STRING "Name of the object library (used for tests)")
set(TEST_NAME ${CMAKE_PROJECT_NAME}_test CACHE STRING "Name of the test executable")
set(DOXYFILE_SUFFIX ${CMAKE_PROJECT_NAME}_docs CACHE STRING "Documentation target")

# main file
set(MAIN "${CMAKE_SOURCE_DIR}/src/main.cpp" CACHE STRING "File containing the main function")


# Artifacts
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib CACHE STRING "archive location")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib CACHE STRING "library location")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin CACHE STRING "executable location")


# Tests
option(BUILD_TESTING "Build the tests" ON)

# Analysers
option(ENABLE_CPPCHECK "Enable cppcheck" OFF)
option(ENABLE_CLANG_TIDY "Enable clang-tidy" OFF)
option(ENABLE_INCLUDE_WHAT_YOU_USE "Enable include-what-you-use" OFF)



# Sanitizers
option(ENABLE_SANITIZERS "Enable sanitizers" OFF)
set(SANITIZER_LIST "address,leak,undefined" CACHE STRING "List of sanitizers to use")



# Docs
option(ENABLE_DOXYGEN "Enable doxygen doc builds of source" ON)



# Warnings
option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors" ON)



# Caching
option(ENABLE_CACHE "Enable cache if available" OFF)
set(CACHE_PROGRAM "ccache" CACHE STRING "Compiler cache to be used")



# Language standard and extensions
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)



# Compile commands
option(CMAKE_EXPORT_COMPILE_COMMANDS "generate compile_commands.json" OFF)



# cmake-format: on
