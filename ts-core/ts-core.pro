#-------------------------------------------------
#
# Project created by QtCreator 2017-03-11T22:50:24
#
#-------------------------------------------------

QT       -= gui

TARGET = ts-core
TEMPLATE = lib

DEFINES += TSCORE_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += section.cpp \
    test.cpp \
    summary.cpp \
    testparam.cpp \
    view.cpp \
    navigation.cpp \
    aviationmarkers.cpp \
    aviationvswr.cpp \
    aviationcl.cpp \
    aviationdtf.cpp \
    snapshot.cpp \
    logging.cpp \
    sectionparam.cpp

HEADERS += section.h\
        ts-core_global.h \
    test.h \
    summary.h \
    testparam.h \
    view.h \
    navigation.h \
    aviationmarkers.h \
    aviationcl.h \
    aviationdtf.h \
    aviationvswr.h \
    snapshot.h \
    logging.h \
    sectionparam.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
