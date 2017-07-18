#-------------------------------------------------
#
# Project created by QtCreator 2017-03-11T23:22:06
#
#-------------------------------------------------

QT       -= gui

TARGET = ts-model
TEMPLATE = lib

DEFINES += TSMODEL_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    testmodel.cpp \
    summarymodel.cpp \
    testparammodel.cpp \
    navigationmodel.cpp \
    modelbase.cpp \
    qtestparams.cpp \
    snapshotmodel.cpp \
    aviationclmodel.cpp \
    aviationdtfmodel.cpp \
    aviationmarkersmodel.cpp \
    aviationvswrmodel.cpp \
    controlnavigationmodel.cpp \
    setupmodel.cpp \
    loggingmodel.cpp \
    sectiongroupmodel.cpp \
    sectionmodel.cpp \
    qsections.cpp\
    user.cpp

HEADERS +=\
        ts-model_global.h \
    testmodel.h \
    summarymodel.h \
    testparammodel.h \
    navigationmodel.h \
    modelbase.h \
    qtestparams.h \
    snapshotmodel.h \
    aviationclmodel.h \
    aviationdtfmodel.h \
    aviationmarkersmodel.h \
    aviationvswrmodel.h \
    controlnavigationmodel.h \
    setupmodel.h \
    loggingmodel.h \
    qsections.h \
    sectiongroupmodel.h \
    sectionmodel.h\
    user.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-core/release/ -lts-core
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-core/debug/ -lts-core
else:unix: LIBS += -L$$OUT_PWD/../ts-core/ -lts-core

INCLUDEPATH += $$PWD/../ts-core
DEPENDPATH += $$PWD/../ts-core

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-dao/release/ -lts-dao
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-dao/debug/ -lts-dao
else:unix: LIBS += -L$$OUT_PWD/../ts-dao/ -lts-dao

INCLUDEPATH += $$PWD/../ts-dao
DEPENDPATH += $$PWD/../ts-dao

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-client/release/ -lts-client
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-client/debug/ -lts-client
else:unix: LIBS += -L$$OUT_PWD/../ts-client/ -lts-client

INCLUDEPATH += $$PWD/../ts-client
DEPENDPATH += $$PWD/../ts-client
unix {
    unix:!macx:!android: LIBS += -L$$PWD/../../../../../usr/local/lib/ -lzmq

    INCLUDEPATH += $$PWD/../../../../../usr/local/include
    DEPENDPATH += $$PWD/../../../../../usr/local/include

    unix:!macx:!android: PRE_TARGETDEPS += $$PWD/../../../../../usr/local/lib/libzmq.a
}
android{
    unix:!macx: LIBS += -L$$PWD/../../../../zeromq-android/lib/ -lzmq

    INCLUDEPATH += $$PWD/../../../../zeromq-android/include
    DEPENDPATH += $$PWD/../../../../zeromq-android/include
}
macx{
    macx: LIBS += -L$$PWD/../../../libzmq_dist/lib/ -lzmq

    INCLUDEPATH += $$PWD/../../../libzmq_dist/include
    DEPENDPATH += $$PWD/../../../libzmq_dist/include

    macx: PRE_TARGETDEPS += $$PWD/../../../libzmq_dist/lib/libzmq.a
}
win32{
    !android{
        win32: LIBS += -L$$PWD/'../../../../Program Files (x86)/ZeroMQ 4.0.4/lib/' -llibzmq-v120-mt-4_0_4

        INCLUDEPATH += $$PWD/'../../../../Program Files (x86)/ZeroMQ 4.0.4/include'
        DEPENDPATH += $$PWD/'../../../../Program Files (x86)/ZeroMQ 4.0.4/include'
    }
}
