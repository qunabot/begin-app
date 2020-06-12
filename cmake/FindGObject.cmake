include(PkgConfigWithFallback)
find_pkg_config_with_fallback(GObject
    PKG_CONFIG_NAME gobject-2.0
    LIB_NAMES gobject-2.0
    INCLUDE_NAMES gobject/gobject.h
    INCLUDE_DIR_SUFFIXES glib-2.0 glib-2.0/include
    DEPENDS GLib
)

if(GObject_FOUND AND NOT GObject_VERSION)
    # TODO
    find_package(GLib ${GLib_GLOBAL_VERSION})
    set(GObject_VERSION ${GLib_VERSION})
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GObject
    REQUIRED_VARS GObject_LIBRARY
    VERSION_VAR GObject_VERSION)