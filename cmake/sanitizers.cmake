include(${CMAKE_SOURCE_DIR}/cmake/misc.cmake)
function (enable_sanitizers project_name #[[access]])
    optional_args(acc DEFAULTS "PRIVATE" ARGS ${ARGN})

    if (NOT ENABLE_SANITIZERS)
        return()
    endif ()

    if (MSVC)
        set(SANITIZER_LIST "address")
        set(_cli_prefix "/")
    else ()
        set(_cli_prefix "-")
    endif ()

    message(STATUS "Running with sanitizers: [${SANITIZER_LIST}]")
    target_compile_options(${project_name} ${acc_0} ${_cli_prefix}fsanitize=${SANITIZER_LIST})
    target_link_options(${project_name} ${acc_0} ${_cli_prefix}fsanitize=${SANITIZER_LIST})
endfunction ()
