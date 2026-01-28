include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

function (%%cpp_init_replace%%_target_macro_prefix target acc)
    if (NOT %%CPP_INIT_REPLACE%%_ENABLE_MACRO_PREFIX)
        return()
    endif ()
    if (NOT (CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang"))
        return()
    endif ()

    _%%cpp_init_replace%%_normalise_val(%%CPP_INIT_REPLACE%%_ENABLE_MACRO_PREFIX _normal)
    if ((_normal STREQUAL TRUE) AND %%CPP_INIT_REPLACE%%_ENABLE_COVERAGE)
        message(
            FATAL_ERROR
                "If %%CPP_INIT_REPLACE%%_ENABLE_MACRO_PREFIX is used with %%CPP_INIT_REPLACE%%_ENABLE_COVERAGE, it must be set to a build mode which does not produce a coverage report."
        )
    endif ()

    if (_normal STREQUAL LIST)
        list(JOIN %%CPP_INIT_REPLACE%%_ENABLE_MACRO_PREFIX ">,$<CONFIG:" _joined)
        set(_joined "$<OR:$<CONFIG:${_joined}>>")
        set(_arg $<${_joined}:-fmacro-prefix-map=${CMAKE_SOURCE_DIR}/=${%%CPP_INIT_REPLACE%%_MACRO_PREFIX}>)
        list(APPEND _arg $<${_joined}:-ffile-prefix-map=${CMAKE_SOURCE_DIR}/=${%%CPP_INIT_REPLACE%%_MACRO_PREFIX}>)
    else ()
        set(_arg -fmacro-prefix-map=${CMAKE_SOURCE_DIR}/=${%%CPP_INIT_REPLACE%%_MACRO_PREFIX}
                 -ffile-prefix-map=${CMAKE_SOURCE_DIR}/=${%%CPP_INIT_REPLACE%%_MACRO_PREFIX}
        )
    endif ()
    target_compile_options(${target} ${acc} ${_arg})
endfunction ()
