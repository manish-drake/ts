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
    sectionmodel.cpp \
    testmodel.cpp

HEADERS +=\
        ts-model_global.h \
    sectionmodel.h \
    testmodel.h

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
