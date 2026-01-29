# cmake-format: off

# Targets
set(%%CPP_INIT_REPLACE%%_EXE_NAME ${%%CPP_INIT_REPLACE%%_PROJECT_NAME} CACHE STRING "Name of the main executable")
set(%%CPP_INIT_REPLACE%%_LIB_NAME ${%%CPP_INIT_REPLACE%%_PROJECT_NAME} CACHE STRING "Name of the main library")
set(%%CPP_INIT_REPLACE%%_OBJLIB_NAME ${%%CPP_INIT_REPLACE%%_PROJECT_NAME}_objlib CACHE STRING "Name of the object library (used for tests)")
set(%%CPP_INIT_REPLACE%%_TEST_NAME ${%%CPP_INIT_REPLACE%%_PROJECT_NAME}_test CACHE STRING "Name of the test executable")
set(%%CPP_INIT_REPLACE%%_DOXYFILE_SUFFIX ${%%CPP_INIT_REPLACE%%_PROJECT_NAME}_docs CACHE STRING "Documentation target")



set(_%%cpp_init_replace%%_usage "Can be a boolean or a list of build types (semicolon separated).")
# Tests
option(%%CPP_INIT_REPLACE%%_BUILD_TESTING "Build the tests" OFF)
option(%%CPP_INIT_REPLACE%%_ENABLE_COVERAGE "Build tests with coverage (only in Debug mode)" OFF)

# Analysers
option(%%CPP_INIT_REPLACE%%_ENABLE_CPPCHECK "Enable cppcheck" OFF)
option(%%CPP_INIT_REPLACE%%_ENABLE_CLANG_TIDY "Enable clang-tidy" OFF)

# Sanitizers
set(%%CPP_INIT_REPLACE%%_ENABLE_SANITIZERS OFF CACHE STRING "Enable sanitizers. ${_%%cpp_init_replace%%_usage}")
set(%%CPP_INIT_REPLACE%%_SANITIZER_LIST "address,leak,undefined" CACHE STRING "List of sanitizers to use")


# Docs
option(%%CPP_INIT_REPLACE%%_ENABLE_DOXYGEN "Enable doxygen doc builds of source" OFF)

# Warnings
option(%%CPP_INIT_REPLACE%%_WARNINGS_AS_ERRORS "Treat compiler warnings as errors" ${PROJECT_IS_TOP_LEVEL})


# Caching
option(%%CPP_INIT_REPLACE%%_ENABLE_CACHE "Enable cache if available" OFF)
set(%%CPP_INIT_REPLACE%%_CACHE_PROGRAM "ccache" CACHE STRING "Compiler cache to be used")

# Macro prefix

option(%%CPP_INIT_REPLACE%%_ENABLE_MACRO_PREFIX "Enable __FILE__ macro replacement" ${IS_NOT_DEBUG})
set(%%CPP_INIT_REPLACE%%_MACRO_PREFIX "./" CACHE STRING "Make __FILE__ macro relative to particular directory")

# Language standard and extensions
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)


# Compile commands
if(PROJECT_IS_TOP_LEVEL)
    option(CMAKE_EXPORT_COMPILE_COMMANDS "generate compile_commands.json" OFF)

    set(FETCHCONTENT_BASE_DIR "${PROJECT_SOURCE_DIR}/_deps" CACHE STRING "base directory to fetch content into")

    # Compiler colours
    option(CMAKE_COLOR_DIAGNOSTICS "use colour output for compilation" ON)
    option(CMAKE_CXX_SCAN_FOR_MODULES "" OFF)

    # Artifacts
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib CACHE STRING "archive location")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib CACHE STRING "library location")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin CACHE STRING "executable location")
endif()

unset(_%%cpp_init_replace%%_usage)

# cmake-format: on
