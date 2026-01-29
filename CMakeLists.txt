cmake_minimum_required(VERSION 3.31)
include(cmake/setup_pkg.cmake)
project(
    ${%%CPP_INIT_REPLACE%%_PROJECT_NAME}
    VERSION      ${%%CPP_INIT_REPLACE%%_PROJECT_VERSION}
    DESCRIPTION  ${%%CPP_INIT_REPLACE%%_PROJECT_DESCRIPTION}
    HOMEPAGE_URL ${%%CPP_INIT_REPLACE%%_PROJECT_HOMEPAGE_URL}
    LANGUAGES CXX C
)

include(cmake/options.cmake)

include(cmake/static_analyzers.cmake)
include(cmake/cache.cmake)
include(cmake/compile_commands.cmake)
include(cmake/compiler_warnings.cmake)
include(cmake/doxygen.cmake)
include(cmake/sanitizers.cmake)
include(cmake/always_include.cmake)
include(cmake/coverage.cmake)
include(cmake/macro_prefix.cmake)

add_subdirectory(lib)
add_subdirectory(src)
add_subdirectory(project_config)
include(cmake/install.cmake)

if (%%CPP_INIT_REPLACE%%_BUILD_TESTING)
    add_subdirectory(tests)
endif ()
