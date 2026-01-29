include(CMakePackageConfigHelpers)
include(GNUInstallDirs)
set(%%CPP_INIT_REPLACE%%_CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")

# TODO(dk949): Look into this
install(
    DIRECTORY "${PROJECT_SOURCE_DIR}/include/${PROJECT_NAME}"
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    FILES_MATCHING
    PATTERN "*.h"
    PATTERN "*.hpp"
    PATTERN "CMakeLists.txt" EXCLUDE
)

install(
    TARGETS ${%%CPP_INIT_REPLACE%%_LIB_NAME} ${%%CPP_INIT_REPLACE%%_EXE_NAME}_exe
    EXPORT ${PROJECT_NAME}Targets
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

# write exported targets file (will provide MyProject::mylib when installed)
install(
    EXPORT ${PROJECT_NAME}Targets
    FILE "${PROJECT_NAME}Targets.cmake"
    NAMESPACE "${PROJECT_NAME}::"
    DESTINATION "${%%CPP_INIT_REPLACE%%_CONFIG_INSTALL_DIR}"
)

# configure and install the package config files
configure_package_config_file(
    "${PROJECT_SOURCE_DIR}/cmake/Config.cmake.in" "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    INSTALL_DESTINATION "${%%CPP_INIT_REPLACE%%_CONFIG_INSTALL_DIR}"
)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
              "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
        DESTINATION "${%%CPP_INIT_REPLACE%%_CONFIG_INSTALL_DIR}"
)
