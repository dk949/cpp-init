include(${PROJECT_SOURCE_DIR}/cmake/find_with_nix.cmake)
set(_%%CPP_INIT_REPLACE%%_COVERAGE_DIRS
    ""
    CACHE INTERNAL "" FORCE
)
function (%%cpp_init_replace%%_target_add_coverage target access)
    if (NOT %%CPP_INIT_REPLACE%%_ENABLE_COVERAGE)
        return()
    endif ()
    if (NOT (CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang"))
        message(WARNING "Can only run coverage on GNU or Clang compilers")
        return()
    endif ()
    if (NOT ((CMAKE_BUILD_TYPE STREQUAL "Debug") OR ("Debug" IN_LIST CMAKE_CONFIGURATION_TYPES)))
        message(WARNING "Can only run coverage with build type Debug, got ${CMAKE_BUILD_TYPE}")
        return()
    endif ()
    cmake_parse_arguments(PARSE_ARGV 0 %%CPP_INIT_REPLACE%% CREATE_TARGET "" "")

    message(STATUS "Configured ${target}:Debug with coverage")
    target_compile_options(${target} ${access} $<$<CONFIG:Debug>:-O0 -g --coverage>)
    target_link_options(${target} ${access} $<$<CONFIG:Debug>:--coverage>)

    set(OBJDIR ${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${target}.dir/)
    set(_%%CPP_INIT_REPLACE%%_COVERAGE_DIRS
        ${_%%CPP_INIT_REPLACE%%_COVERAGE_DIRS} --directory ${OBJDIR}
        CACHE INTERNAL "" FORCE
    )

    if (%%CPP_INIT_REPLACE%%_CREATE_TARGET)
        %%cpp_init_replace%%_find_program_nix(_%%cpp_init_replace%%_lcov_exe lcov)
        if(${_%%cpp_init_replace%%_lcov_exe} STREQUAL "_%%cpp_init_replace%%_lcov_exe-NOTFOUND")
            message(WARNING "Coverage was requested, but neither lcov nor nix were found")
            return()
        endif()
        string(REGEX REPLACE " +" ";" _%%cpp_init_replace%%_lcov_exe "${_%%cpp_init_replace%%_lcov_exe}")
        add_custom_target(
            "coverage_${target}"
            COMMENT "Generating coverage report"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            COMMAND #
                    ${_%%cpp_init_replace%%_lcov_exe} ${_%%CPP_INIT_REPLACE%%_COVERAGE_DIRS} --zerocounters
            COMMAND #
                    ctest --test-dir ${CMAKE_CURRENT_BINARY_DIR} --output-on-failure
            COMMAND
                ${_%%cpp_init_replace%%_lcov_exe} #
                --ignore-errors inconsistent #
                --ignore-errors unused #
                --capture #
                ${_%%CPP_INIT_REPLACE%%_COVERAGE_DIRS} --base-directory ${PROJECT_SOURCE_DIR}/src #
                --base-directory ${PROJECT_SOURCE_DIR}/lib #
                --output-file ${OBJDIR}/coverage.info
            COMMAND
                ${_%%cpp_init_replace%%_lcov_exe} --ignore-errors inconsistent #
                --ignore-errors unused #
                --remove ${OBJDIR}/coverage.info #
                /usr/**/* #
                ${FETCHCONTENT_BASE_DIR}/**/* #
                ${CMAKE_BINARY_DIR}/vcpkg_installed/**/* #
                --output-file ${OBJDIR}/coverage.cleaned.info
            COMMAND #
                    ${_%%cpp_init_replace%%_lcov_exe} --list ${OBJDIR}/coverage.cleaned.info
            VERBATIM
        )

        add_dependencies("coverage_${target}" ${target})
    endif ()
endfunction ()
