#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "datamanager.h"
#include "sectionmodel.h"

const int DATA_CREATION_MODE = 0;

int createData(){
    DataManager::deleteExitingDBFile();

    SectionModel sectionModel{};

    sectionModel.addSection(Section("Start"));
    sectionModel.addSection(Section("Transponder"));
    sectionModel.addSection(Section("Mode S"));
    sectionModel.addSection(Section("ADS-B"));
    sectionModel.addSection(Section("NAV"));
    sectionModel.addSection(Section("Comm"));
    sectionModel.addSection(Section("Antenna"));
    sectionModel.addSection(Section("Reports"));
    sectionModel.addSection(Section("Setup"));
    sectionModel.addSection(Section("Search"));
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

