include(PkgConfigWithFallback)
find_pkg_config_with_fallback(SQLite3
    PKG_CONFIG_NAME sqlite3
    LIB_NAMES sqlite3
    INCLUDE_NAMES sqlite3.h
)

if(SQLite3_FOUND AND NOT SQLite3_VERSION)
    find_file(SQLite3_HEADER "sqlite3.h" HINTS ${SQLite3_INCLUDE_DIRS})
    mark_as_advanced(SQLite3_HEADER)

    if(SQLite3_HEADER)
        file(STRINGS "${SQLite3_HEADER}" SQLite3_VERSION REGEX "^#define SQLITE_VERSION +\\\"[^\\\"]+\\\"")
        string(REGEX REPLACE "^#define SQLITE_VERSION +\\\"([0-9]+)\\.([0-9]+)\\.([0-9]+)\\\"$" "\\1.\\2.\\3" SQLite3_VERSION "${SQLite3_VERSION}")
    endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SQLite3
    REQUIRED_VARS SQLite3_LIBRARY
    VERSION_VAR SQLite3_VERSION)