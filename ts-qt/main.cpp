#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "datamanager.h"
#include "sectionmodel.h"
#include "testmodel.h"

const int DATA_CREATION_MODE = 1;

int createData(){
    DataManager::deleteExitingDBFile();

    SectionModel sectionModel{};
    Section start("Start");
    sectionModel.addSection(start);

    Section transponder("Transponder");
    sectionModel.addSection(transponder);

    Section modeS("Mode S");
    sectionModel.addSection(modeS);

    Section sectionADSB("ADS-B");
    sectionModel.addSection(sectionADSB);

    Section nav("NAV");
    sectionModel.addSection(nav);

    Section comm("Comm");
    sectionModel.addSection(comm);

    Section antenna("Antenna");
    sectionModel.addSection(antenna);

    Section reports("Reports");
    sectionModel.addSection(reports);

    Section setup("Setup");
    sectionModel.addSection(setup);

    Section search("Search");
    sectionModel.addSection(search);

    TestModel testModel { };

    Test out1090("1090 ADS-B OUT", sectionADSB.id());
    testModel.addTest(out1090);

    Test in1090("1090 ADS-B IN", sectionADSB.id());
    testModel.addTest(in1090);

    Test uatOut("UAT ADS-B OUT", sectionADSB.id());
    testModel.addTest(uatOut);

    Test uatIn("UAT ADS-B IN", sectionADSB.id());
    testModel.addTest(uatIn);

    return 1;
}

int main(int argc, char *argv[])
{
    if(DATA_CREATION_MODE){
        return createData();
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

