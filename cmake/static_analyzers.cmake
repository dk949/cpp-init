macro (%%cpp_init_replace%%_enable_stat target _stat)
    string(TOUPPER ${_stat} _STAT)
    string(REPLACE "-" "_" _STAT ${_STAT})
    if (%%CPP_INIT_REPLACE%%_ENABLE_${_STAT})
        find_program(%%cpp_init_replace%%_${_STAT} ${_stat})
        if (%%cpp_init_replace%%_${_STAT})
            set_property(TARGET ${target} PROPERTY CXX_${_STAT} ${%%cpp_init_replace%%_${_STAT}} ${ARGN})
            # set(CMAKE_CXX_${_STAT} ${%%cpp_init_replace%%_${_STAT}} ${ARGN})
            message(STATUS "${_stat} found and enabled")
        else ()
            message(WARNING "${_stat} requested but executable not found")
        endif ()
    endif ()
    unset(_STAT)
endmacro ()

function (%%cpp_init_replace%%_target_enable_cppcheck target)
    if (%%CPP_INIT_REPLACE%%_WARNINGS_AS_ERRORS)
        set(_exit_code 127)
    else ()
        set(_exit_code 0)
    endif ()
    %%cpp_init_replace%%_enable_stat(
        ${target}
        cppcheck
        --quiet
        --cppcheck-build-dir=${PROJECT_BINARY_DIR}
        --error-exitcode=${_exit_code}
        --suppress=missingIncludeSystem
        --suppress=unmatchedSuppression
        --suppress=checkersReport
        --suppress=unusedFunction
        --enable=all
        --inline-suppr
        --inconclusive
        ${ARGN}
    )
endfunction ()
function (%%cpp_init_replace%%_target_enable_clang_tidy target)
    if (%%CPP_INIT_REPLACE%%_WARNINGS_AS_ERRORS)
        set(_clang_tidy_wae "*")
    else ()
        set(_clang_tidy_wae "")
    endif ()
    %%cpp_init_replace%%_enable_stat(
        ${target} #
        clang-tidy #
        --warnings-as-errors=${_clang_tidy_wae} #
        --extra-arg=-Wno-unknown-warning-option
        ${ARGN}
    )
endfunction ()
