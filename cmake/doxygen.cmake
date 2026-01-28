if (%%CPP_INIT_REPLACE%%_ENABLE_DOXYGEN)
    set(DOXYGEN_ENABLE_PREPROCESSING YES)
    set(DOXYGEN_EXTRACT_ALL YES)
    set(DOXYGEN_JAVADOC_AUTOBRIEF YES)
    set(DOXYGEN_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/docs")
    set(DOXYGEN_SEARCH_INCLUDES YES)
    set(DOXYGEN_EXTRACT_PRIVATE YES)
    set(DOXYGEN_HTML_EXTRA_STYLESHEET "")
    set(DOXYGEN_HTML_COLORSTYLE LIGHT)
    set(DOXYGEN_USE_MDFILE_AS_MAINPAGE "${PROJECT_SOURCE_DIR}/README.md")

    find_package(Doxygen REQUIRED OPTIONAL_COMPONENTS dot)
    if (DOXYGEN_FOUND)
        message(STATUS "Found dot, enabling graphs")
        set(DOXYGEN_CALLER_GRAPH
            YES
            CACHE STRING "generate caller graph"
        )
        set(DOXYGEN_CALL_GRAPH
            YES
            CACHE STRING "generate call graph"
        )
        set(DOXYGEN_DOT_TRANSPARENT YES)
        set(DOXYGEN_DOT_IMAGE_FORMAT svg)

    endif ()
    doxygen_add_docs(${%%CPP_INIT_REPLACE%%_DOXYFILE_SUFFIX} ${PROJECT_SOURCE_DIR}/src "${PROJECT_SOURCE_DIR}/README.md")
endif ()
