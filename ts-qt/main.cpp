#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>

#include "databuilder.h"
#include "sectionmodel.h"
#include "testmodel.h"
#include "summarymodel.h"
#include "testparammodel.h"
#include "navigationmodel.h"
#include "resourcenamecoupling.h"

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

        NavigationModel navigationModel;
        context->setContextProperty("navigationModel", &navigationModel);

        ResourceNameCoupling resourceNameCoupling;
        context->setContextProperty("registry", &resourceNameCoupling);

        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(int)),
                         &sectionModel, SLOT(currentViewChanged(int)));
        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(int)),
                         &testModel, SLOT(currentViewChanged(int)));
        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(int)),
                         &summaryModel, SLOT(currentViewChanged(int)));

        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

        return app.exec();
    }
}

