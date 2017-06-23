#-------------------------------------------------
#
# Project created by QtCreator 2017-03-11T23:20:35
#
#-------------------------------------------------

QT       += sql

QT       -= gui

TARGET = ts-dao
TEMPLATE = lib

DEFINES += TSDAO_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += datamanager.cpp \
    sectiondao.cpp \
    dao.cpp \
    testdao.cpp \
    summarydao.cpp \
    testparamdao.cpp \
    viewdao.cpp \
    navigationdao.cpp \
    aviationcldao.cpp \
    aviationdtfdao.cpp \
    aviationmarkersdao.cpp \
    aviationvswrdao.cpp \
    snapshotdao.cpp \
    loggingdao.cpp

HEADERS += datamanager.h\
        ts-dao_global.h \
    sectiondao.h \
    dao.h \
    testdao.h \
    summarydao.h \
    testparamdao.h \
    viewdao.h \
    navigationdao.h \
    aviationcldao.h \
    aviationvswrdao.h \
    aviationdtfdao.h \
    aviationmarkersdao.h \
    snapshotdao.h \
    loggingdao.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-core/release/ -lts-core
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-core/debug/ -lts-core
else:unix: LIBS += -L$$OUT_PWD/../ts-core/ -lts-core

INCLUDEPATH += $$PWD/../ts-core
DEPENDPATH += $$PWD/../ts-core
