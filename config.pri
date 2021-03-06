# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/About_Page.qml) \
        $$quote($$BASEDIR/assets/Multi view.qml) \
        $$quote($$BASEDIR/assets/Settings.qml) \
        $$quote($$BASEDIR/assets/images/Thumbs.db) \
        $$quote($$BASEDIR/assets/images/about.png) \
        $$quote($$BASEDIR/assets/images/app_icon.png) \
        $$quote($$BASEDIR/assets/images/bottom.PNG) \
        $$quote($$BASEDIR/assets/images/cam1.png) \
        $$quote($$BASEDIR/assets/images/cam1pressed.png) \
        $$quote($$BASEDIR/assets/images/cam2.png) \
        $$quote($$BASEDIR/assets/images/cam2pressed.png) \
        $$quote($$BASEDIR/assets/images/cam3.png) \
        $$quote($$BASEDIR/assets/images/cam3pressed.png) \
        $$quote($$BASEDIR/assets/images/cam4.png) \
        $$quote($$BASEDIR/assets/images/cam4pressed.png) \
        $$quote($$BASEDIR/assets/images/capture.PNG) \
        $$quote($$BASEDIR/assets/images/left.PNG) \
        $$quote($$BASEDIR/assets/images/multiview.png) \
        $$quote($$BASEDIR/assets/images/navigationpressed.png) \
        $$quote($$BASEDIR/assets/images/navigationpressed_old.png) \
        $$quote($$BASEDIR/assets/images/refresh.PNG) \
        $$quote($$BASEDIR/assets/images/refresh_old.PNG) \
        $$quote($$BASEDIR/assets/images/right.PNG) \
        $$quote($$BASEDIR/assets/images/settings.png) \
        $$quote($$BASEDIR/assets/images/snapshot.png) \
        $$quote($$BASEDIR/assets/images/up.PNG) \
        $$quote($$BASEDIR/assets/images/z_bottom_old.PNG) \
        $$quote($$BASEDIR/assets/ipcammonitor-1_0_0_1.bar) \
        $$quote($$BASEDIR/assets/ipcammonitor-1_0_0_5.bar) \
        $$quote($$BASEDIR/assets/main.qml)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += $$quote($$BASEDIR/src/applicationui.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}.ts)
