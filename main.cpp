#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include "dbman.h"
#include "helper.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Helper helper;
    QDir currentDir;
    currentDir.mkdir ("data");

    QQmlApplicationEngine engine;

    DbMan dbmanager(0);
    dbmanager.setGlobalViewer(engine);

    engine.rootContext()->setContextProperty("DBMAN",&dbmanager);
    engine.rootContext()->setContextProperty("patientmodel",dbmanager.model());
    engine.rootContext()->setContextProperty("helper",&helper);
    engine.load(QUrl(QStringLiteral("qrc:/qml/optoman/main.qml")));

    return app.exec();
}
