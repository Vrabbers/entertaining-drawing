#include "gamewindow.h"

#include <tapplication.h>
#include <QDir>
#include <entertaining.h>
#include <discordintegration.h>
#include <musicengine.h>
#include <QSettings>
#include <notificationengine.h>

int main(int argc, char *argv[])
{
    tApplication a(argc, argv);
    a.registerCrashTrap();

    if (QDir("/usr/share/entertaining-drawing").exists()) {
        a.setShareDir("/usr/share/entertaining-drawing");
    } else if (QDir(QDir::cleanPath(QApplication::applicationDirPath() + "/../share/entertaining-drawing/")).exists()) {
        a.setShareDir(QDir::cleanPath(QApplication::applicationDirPath() + "/../share/entertaining-drawing/"));
    }
    a.installTranslators();

    a.setOrganizationName("theSuite");
    a.setOrganizationDomain("");
    //TODO: icon
    a.setApplicationName("0.0");
    a.setGenericName(QApplication::translate("main", "Drawing Game"));
    a.setApplicationLicense(tApplication::Gpl3OrLater);
    a.setCopyrightHolder("Vrabbers");
    a.setCopyrightYear("2020");
    a.setDesktopFileName("com.vrabbers.entertaining.drawing");
    a.setApplicationName("Entertaining Drawing Dev");

    // Entertaining::initialize();

    //TODO: discord rich presence

    GameWindow w;
    w.show();

    NotificationEngine::setApplicationNotificationWindow(&w);

    return a.exec();
}
