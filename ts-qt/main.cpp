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
#include "sectionmodel.h"
#include "testmodel.h"
#include "summarymodel.h"
#include "testparammodel.h"
#include "navigationmodel.h"
#include "resourcenamecoupling.h"
#include "controls.h"
#include "client.h"
#include "zmq.hpp"
#include "dummygraphdata.h"
#include "loggingmodel.h"

#include "datamanager.h"
#include "logging.h"

#include "../ts-smtp/SmtpMime"

const int DATA_CREATION_MODE = 0;

void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    QByteArray localMsg = msg.toLocal8Bit();
    QDateTime current = QDateTime::currentDateTime();
    if(type >= 1)
    {
        auto loggingDao = DataManager::logger().loggingDao();
        auto log = Logging(current, type, localMsg.constData(),context.file, context.line, context.function);
        loggingDao->addLogging(log);
    }

    //    switch (type) {
    //    case QtDebugMsg:
    //        fprintf(stderr, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
    //        break;
    //    case QtInfoMsg:
    //        fprintf(stderr, "Info: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
    //        break;
    //    case QtWarningMsg:
    //        fprintf(stderr, "Warning: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
    //        break;
    //    case QtCriticalMsg:
    //        fprintf(stderr, "Critical: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
    //        break;
    //    case QtFatalMsg:
    //        fprintf(stderr, "Fatal: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
    //        abort();
    //    }
}

int main(int argc, char *argv[])
{
    if(DATA_CREATION_MODE){
        DataBuilder builder;
        return builder.build();
    } else {
        QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
        QGuiApplication app(argc, argv);

        qInstallMessageHandler(myMessageOutput);

        qmlRegisterType<Controls>("com.ti.controls", 1, 0, "Controls");
        QQmlApplicationEngine engine;
        QQmlContext *context = engine.rootContext();


        Client client("tcp://192.168.145.133:6000");
        context->setContextProperty("zmq", &client);

        dummygraphdata dummy;
        context->setContextProperty("dummy", &dummy);

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

        LoggingModel loggingModel;
        context->setContextProperty("loggingModel", &loggingModel);

        //        SetupModel setupModel;
        //        context->setContextProperty("setupModel", &setupModel);

        //        ControlNavigationModel controlNavigationModel;
        //        context->setContextProperty("controlNavigationModel", &controlNavigationModel);

        context->setContextProperty("registry", &ResourceNameCoupling::instance());

        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(const int&)),
                         &sectionModel, SLOT(currentViewChanged(const int&)));
        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(const int&)),
                         &summaryModel, SLOT(currentViewChanged(const int&)));
        QObject::connect(&navigationModel, SIGNAL(currentViewChanged(const int&)),
                         &testModel, SLOT(currentViewChanged(const int&)));

        engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));

        //        // First we need to create an SmtpClient object
        //        // We will use the Gmail's smtp server (smtp.gmail.com, port 465, ssl)

        //        SmtpClient smtp("smtp.gmail.com", 465, SmtpClient::SslConnection);

        //        // We need to set the username (your email address) and the password
        //        // for smtp authentification.

        //        smtp.setUser("gurpreet.drake@gmail.com");
        //        smtp.setPassword("drake8283");

        //        // Now we create a MimeMessage object. This will be the email.

        //        MimeMessage message;

        //        message.setSender(new EmailAddress("gurpreet.drake@gmail.com", "Gurpreet"));
        //        message.addRecipient(new EmailAddress("gurpreet.drake@hotmail.com", "Gurp"));
        //        message.setSubject("SmtpClient for Qt - Demo");

        //        // Now add some text to the email.
        //        // First we create a MimeText object.

        //        MimeText text;

        //        text.setText("Hi,\nThis is a simple email message.\n");

        //        // Now add it to the mail

        //        message.addPart(&text);

        //        // Now we can send the mail

        //        smtp.connectToHost();
        //        smtp.login();
        //        smtp.sendMail(message);
        //        smtp.quit();

        return app.exec();
    }
}

