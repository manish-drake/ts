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
#include "controls.h"
#include "client.h"
#include "zmq.hpp"


const int DATA_CREATION_MODE = 0;


int main(int argc, char *argv[])
{
    if(DATA_CREATION_MODE){
        DataBuilder builder;
        return builder.build();
    } else {
        QGuiApplication app(argc, argv);

        qmlRegisterType<Controls>("com.ti.controls", 1, 0, "Controls");

        QQmlApplicationEngine engine;
        QQmlContext *context = engine.rootContext();

        Client client("tcp://192.168.1.104:6000");
        context->setContextProperty("zmq", &client);

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

        context->setContextProperty("registry", &ResourceNameCoupling::instance());

        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(const int&)),
                         &sectionModel, SLOT(currentViewChanged(const int&)));
        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(const int&)),
                         &summaryModel, SLOT(currentViewChanged(const int&)));
        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(const int&)),
                         &testModel, SLOT(currentViewChanged(const int&)));

        engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));

        return app.exec();
    }
}

