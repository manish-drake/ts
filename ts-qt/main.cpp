#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "databuilder.h"
#include "sectionmodel.h"

const int DATA_CREATION_MODE = 1;


int main(int argc, char *argv[])
{
    if(DATA_CREATION_MODE){
        DataBuilder builder;
        return builder.build();
    } else {
        QGuiApplication app(argc, argv);

        QQmlApplicationEngine engine;
        SectionModel sectionModel;
        QQmlContext *context = engine.rootContext();
        context->setContextProperty("sectionModel", &sectionModel);

        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

        return app.exec();
    }
}

