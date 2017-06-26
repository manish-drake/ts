#-------------------------------------------------
#
# Project created by QtCreator 2017-04-13T10:49:43
#
#-------------------------------------------------

QT       -= gui

TARGET = ts-client
TEMPLATE = lib

DEFINES += TSCLIENT_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += client.cpp \
    jsonarraymodel.cpp \
    request.cpp \
    requestfactory.cpp \
    response.cpp \
    scan.cpp \
    session.cpp \
    controlnavigation.cpp \
    setup.cpp

HEADERS += client.h\
        ts-client_global.h \
    jsonarraymodel.h \
    request.h \
    requestfactory.h \
    response.h \
    scan.h \
    session.h \
    controlnavigation.h \
    setup.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}


unix|win32: LIBS += -L$$PWD/'../../../../Program Files (x86)/ZeroMQ 4.0.4/lib/' -llibzmq-v120-mt-4_0_4

INCLUDEPATH += $$PWD/'../../../../Program Files (x86)/ZeroMQ 4.0.4/include'
DEPENDPATH += $$PWD/'../../../../Program Files (x86)/ZeroMQ 4.0.4/include'

#unix|win32: LIBS += -L$$PWD/../../../../zeromq-android/lib/ -lzmq

#INCLUDEPATH += $$PWD/../../../../zeromq-android/include
#DEPENDPATH += $$PWD/../../../../zeromq-android/include

#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../libzmq_dist/lib/release/ -lzmq
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../libzmq_dist/lib/debug/ -lzmq
#else:unix: LIBS += -L$$PWD/../../../libzmq_dist/lib/ -lzmq

#INCLUDEPATH += $$PWD/../../../libzmq_dist/include
#DEPENDPATH += $$PWD/../../../libzmq_dist/include

#win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../libzmq_dist/lib/release/libzmq.a
#else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../libzmq_dist/lib/debug/libzmq.a
#else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../libzmq_dist/lib/release/zmq.lib
#else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../libzmq_dist/lib/debug/zmq.lib
#else:unix: PRE_TARGETDEPS += $$PWD/../../../libzmq_dist/lib/libzmq.a

#macx: LIBS += -L$$PWD/../../../libzmq_dist/lib/ -lzmq

#INCLUDEPATH += $$PWD/../../../libzmq_dist/include
#DEPENDPATH += $$PWD/../../../libzmq_dist/include

#macx: PRE_TARGETDEPS += $$PWD/../../../libzmq_dist/lib/libzmq.a
