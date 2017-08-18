#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>
#include <aviationclmodel.h>
#include <aviationdtfmodel.h>
#include <aviationmarkersmodel.h>
#include <aviationvswrmodel.h>
#include <snapshotmodel.h>
#include <setupmodel.h>
#include <controlnavigationmodel.h>

#include "databuilder.h"
#include "sectiongroupmodel.h"
#include "testmodel.h"
#include "summarymodel.h"
#include "testparammodel.h"
#include "navigationmodel.h"
#include "resourcenamecoupling.h"
#include "controls.h"
#include "client.h"
#include "zmq.hpp"
#include "dummygraphdata.h"
#include "datamanager.h"
#include "loggerthread.h"
#include <QThreadPool>
#include "../ts-smtp/SmtpMime"
#include "loggingmodel.h"
#include "runlater.h"

const int DATA_CREATION_MODE = 0;


void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    if(type > QtMsgType::QtWarningMsg){

        LoggerThread *log = new LoggerThread(type, context, msg);
        QThreadPool::globalInstance()->start(log);
    }
}


int main(int argc, char *argv[])
{
    qInfo() << "main()";

    if(DATA_CREATION_MODE){
        DataBuilder builder;
        return builder.build();
    } else {
        QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
        qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

        QGuiApplication app(argc, argv);

//        qInstallMessageHandler(myMessageOutput);

        qmlRegisterType<Controls>("com.ti.controls", 1, 0, "Controls");

        QQmlApplicationEngine engine;
        QQmlContext *context = engine.rootContext();

        LoggingModel loggingModel;
        context->setContextProperty("loggingModel", &loggingModel);

        Client client;
        context->setContextProperty("zmq", &client);

        dummygraphdata dummy;
        context->setContextProperty("dummy", &dummy);

        SectionGroupModel sectionGroupModel;
        context->setContextProperty("sectionGroupModel", &sectionGroupModel);

        TestModel testModel;
        context->setContextProperty("testModel", &testModel);

        SummaryModel summaryModel;
        context->setContextProperty("summaryModel", &summaryModel);

        NavigationModel navigationModel;
        context->setContextProperty("navigationModel", &navigationModel);

        SnapshotModel snapshotModel;
        context->setContextProperty("snapshotModel", &snapshotModel);

        AviationMarkersModel aviationmarkersModel;
        context->setContextProperty("aviationmarkersModel", &aviationmarkersModel);

        AviationVswrModel aviationVswrModel;
        context->setContextProperty("aviationVswrModel", &aviationVswrModel);

        AviationClModel aviationClModel;
        context->setContextProperty("aviationClModel", &aviationClModel);

        AviationDtfModel aviationDtfModel;
        context->setContextProperty("aviationDtfModel", &aviationDtfModel);

        ControlNavigationModel controlNavigationModel;
        context->setContextProperty("controlNavigationModel", &controlNavigationModel);

        SetupModel setupModel;
        context->setContextProperty("setup", &setupModel);

        context->setContextProperty("registry", &ResourceNameCoupling::instance());


        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(const int&)),
                         &summaryModel, SLOT(currentViewChanged(const int&)));
        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(const int&)),
                         &testModel, SLOT(currentViewChanged(const int&)));

        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

        qInfo() << "GUI loop started";
        return app.exec();
    }
}

