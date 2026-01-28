if (%%CPP_INIT_REPLACE%%_ENABLE_CACHE)
    find_program(_%%cpp_init_replace%%_cache_bin ${%%CPP_INIT_REPLACE%%_CACHE_PROGRAM})
    if (_%%cpp_init_replace%%_cache_bin)
        message(STATUS "${%%CPP_INIT_REPLACE%%_CACHE_PROGRAM} found and enabled")
        set(CMAKE_CXX_COMPILER_LAUNCHER
            ${_%%cpp_init_replace%%_cache_bin}
            CACHE STRING "cmake compiler launcher"
        )
    else ()
        message(WARNING "${%%CPP_INIT_REPLACE%%_CACHE_PROGRAM} is enabled but was not found. Not using it")
    endif ()
endif ()
