#include <QGuiApplication>
#include <QQmlApplicationEngine>

const int DATA_CREATION_MODE = 1;

int createData(){

    return 1;
}

int main(int argc, char *argv[])
{
    if(DATA_CREATION_MODE){
        return createData();
    } else {
        QGuiApplication app(argc, argv);

        QQmlApplicationEngine engine;
        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

        return app.exec();
    }
}

