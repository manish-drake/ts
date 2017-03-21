#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "databuilder.h"
#include "sectionmodel.h"
#include "testmodel.h"
#include "summarymodel.h"
#include "testparammodel.h"

const int DATA_CREATION_MODE = 1;


int main(int argc, char *argv[])
{
    if(DATA_CREATION_MODE){
        DataBuilder builder;
        return builder.build();
    } else {
        QGuiApplication app(argc, argv);

        QQmlApplicationEngine engine;
        QQmlContext *context = engine.rootContext();

        SectionModel sectionModel;
        context->setContextProperty("sectionModel", &sectionModel);

        TestModel testModel;
        context->setContextProperty("testModel", &testModel);

        SummaryModel summaryModel;
        context->setContextProperty("summaryModel", &summaryModel);

        TestParamModel testParamModel;
        context->setContextProperty("testParamModel", &testParamModel);

        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

        return app.exec();
    }
}

