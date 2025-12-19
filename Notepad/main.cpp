#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "readfile.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    readFile file;
    QQmlApplicationEngine engine;

    // Register singleton type
    qmlRegisterSingletonType(QUrl("qrc:/ConstantType.qml"), "ConstantType", 1, 0, "Constant");

    // Set context property
    engine.rootContext()->setContextProperty("file", &file);

    // Load main QML
    const QUrl url(QStringLiteral("qrc:/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection
        );

    engine.load(url);

    return app.exec();
}
