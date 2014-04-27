#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
//#include <QQmlContext>
#include "dbman.h"
#include <QtQml/QQmlContext>
#include <QDir>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QDir currentDir;
    currentDir.mkdir ("data");

    DbMan dbmanager;
    QtQuick2ApplicationViewer viewer;
    viewer.rootContext()->setContextProperty("DBMAN",&dbmanager);
    viewer.setMainQmlFile(QStringLiteral("qml/optoman/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
