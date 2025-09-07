if (NOT CMAKE_BUILD_TYPE)
    message(WARNING "CMAKE_BUILD_TYPE not specified defaulting to RelWithDebInfo")
    set(CMAKE_BUILD_TYPE
        "RelWithDebInfo"
        CACHE STRING ""
    )
endif ()

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(IS_DEBUG ON CACHE INTERNAL "")
else()
    set(IS_NOT_DEBUG ON CACHE INTERNAL "")
endif ()
