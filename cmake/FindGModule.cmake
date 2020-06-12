include(PkgConfigWithFallback)
find_pkg_config_with_fallback(GModule
    PKG_CONFIG_NAME gmodule-2.0
    LIB_NAMES gmodule-2.0
    INCLUDE_NAMES gmodule.h
    INCLUDE_DIR_SUFFIXES glib-2.0 glib-2.0/include
    DEPENDS GLib
)

if(GModule_FOUND AND NOT GModule_VERSION)
    # TODO
    find_package(GLib ${GLib_GLOBAL_VERSION})
    set(GModule_VERSION ${GLib_VERSION})
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GModule
    REQUIRED_VARS GModule_LIBRARY
    VERSION_VAR GModule_VERSION)