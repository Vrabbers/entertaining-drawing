QT       += core gui svg gamepad network websockets
TARGET   = ent-drawing
SHARE_APP_NAME = ent-drawing
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    gamewindow.cpp \
    screens/mainmenu.cpp

HEADERS += \
    gamewindow.h \
    screens/mainmenu.h

FORMS += \
    gamewindow.ui \
    screens/mainmenu.ui


unix:!macx:!android {
    # Include the-libs build tools
    include(/usr/share/the-libs/pri/buildmaster.pri)

    QT += thelib entertaining
    TARGET = ent-drawing

    target.path = /usr/bin

    desktop.path = /usr/share/applications
    desktop.files = com.vrabbers.entertaining.drawing.desktop

    icon.path = /usr/share/icons/hicolor/scalable/apps/
    icon.files = icons/ent-drawing.svg

    audio.path = /usr/share/ent-drawing/audio
    audio.files = audio/*

    INSTALLS += target desktop icon audio
}

win32 {
    # Include the-libs build tools
    include(C:/Program Files/thelibs/pri/buildmaster.pri)

    INCLUDEPATH += "C:/Program Files/thelibs/include" "C:/Program Files/libentertaining/include"
    LIBS += -L"C:/Program Files/thelibs/lib" -lthe-libs -L"C:/Program Files/libentertaining/lib" -lentertaining
#    RC_FILE = icon.rc
}

macx {
    # Include the-libs build tools
    include(/usr/local/share/the-libs/pri/buildmaster.pri)

    QT += macextras
    LIBS += -framework CoreFoundation -framework AppKit

    blueprint {
        TARGET = "Entertaining Drawing Blueprint"
#        ICON = icon-bp.icns
    } else {
        TARGET = "Entertaining Drawing"
        ICON = icon.icns
    }

    audio.files = audio/
    audio.path = Contents/audio

    QMAKE_BUNDLE_DATA += audio

    INCLUDEPATH += "/usr/local/include/the-libs" "/usr/local/include/libentertaining"
    LIBS += -L/usr/local/lib -lthe-libs -lentertaining

    QMAKE_POST_LINK += $$quote(cp $${PWD}/dmgicon.icns $${PWD}/app-dmg-background.png $${OUT_PWD})
}

android {
    # Include the-libs build tools
    include(/opt/thesuite-android/share/the-libs/pri/gentranslations.pri)

    QT += multimedia
    INCLUDEPATH += "/opt/thesuite-android/include/the-libs" "/opt/thesuite-android/include/libentertaining"
    LIBS += -L/opt/thesuite-android/libs/armeabi-v7a -lthe-libs -lentertaining

    ANDROID_EXTRA_LIBS = \
        /opt/thesuite-android/libs/armeabi-v7a/libentertaining.so \
        /opt/thesuite-android/libs/armeabi-v7a/libthe-libs.so \
        /opt/thesuite-android/openssl/libcrypto_1_1.so \
        /opt/thesuite-android/openssl/libssl_1_1.so

    ANDROID_EXTRA_PLUGINS = \
        /opt/thesuite-android/plugins/

    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
