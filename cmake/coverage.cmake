include(${CMAKE_SOURCE_DIR}/cmake/find_with_nix.cmake)
function (target_add_coverage target access)
    if (NOT ENABLE_COVERAGE)
        return()
    endif ()
    if (NOT (CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang"))
        message(FATAL_ERROR "Can only run coverage on GNU or Clang compilers")
        return()
    endif ()
    if (NOT (CMAKE_BUILD_TYPE STREQUAL "Debug"))
        message(FATAL_ERROR "Can only run coverage with build type Debug, got ${CMAKE_BUILD_TYPE}")
        return()
    endif ()
    message(STATUS "Building with coverage")
    target_compile_options(${target} ${access} -O0 -g --coverage)
    target_link_options(${target} ${access} --coverage)
    find_program_nix(LCOV_EXE lcov)
    string(REGEX REPLACE " +" ";" LCOV_EXE "${LCOV_EXE}")

    set(OBJDIR ${CMAKE_BINARY_DIR}/tests/CMakeFiles/${target}.dir/)

    add_custom_target(
        "coverage_${target}"
        COMMENT "Generating coverage report"
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMAND #
                ${LCOV_EXE} --directory ${OBJDIR} --zerocounters
        COMMAND #
                ctest --test-dir ${CMAKE_BINARY_DIR}/tests --output-on-failure
        COMMAND
            ${LCOV_EXE} #
            --ignore-errors inconsistent #
            --ignore-errors unused #
            --capture #
            --directory ${OBJDIR} #
            --base-directory ${CMAKE_SOURCE_DIR}/src #
            --output-file ${OBJDIR}/coverage.info
        COMMAND
            ${LCOV_EXE} --ignore-errors inconsistent #
            --ignore-errors unused #
            --remove ${OBJDIR}/coverage.info #
            /usr/**/* #
            ${FETCHCONTENT_BASE_DIR}/**/* #
            ${CMAKE_BINARY_DIR}/vcpkg_installed/**/* #
            --output-file ${OBJDIR}/coverage.cleaned.info
        COMMAND #
                ${LCOV_EXE} --list ${OBJDIR}/coverage.cleaned.info
        VERBATIM
    )

    add_dependencies("coverage_${target}" ${TEST_NAME})

endfunction ()
