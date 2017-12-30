TEMPLATE = app

QT += qml quick
QT += network
QT += sql
QT += concurrent

CONFIG += c++11

SOURCES += main.cpp \
    databuilder.cpp \
    resourcenamecoupling.cpp \
    controls.cpp \
    controlsattachedtype.cpp \
    controlstyles.cpp \
    dummygraphdata.cpp \
    loggerthread.cpp

QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.9

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
#qnx: target.path = /tmp/$${TARGET}/bin
#else: unix:!android: target.path = /opt/$${TARGET}/bin
#else: android: target.path = /opt/$${TARGET}/bin
#!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-core/release/ -lts-core
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-core/debug/ -lts-core
else:unix: LIBS += -L$$OUT_PWD/../ts-core/ -lts-core

INCLUDEPATH += $$PWD/../ts-core
DEPENDPATH += $$PWD/../ts-core

contains (ANDROID_TARGET_ARCH,x86) {
    ANDROID_EXTRA_LIBS = \
        $$[QT_INSTALL_LIBS]/libQt5Sql.so \
        -L$$PWD/../../../../zeromq-android/lib/ -lzmq
}

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-model/release/ -lts-model
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-model/debug/ -lts-model
else:unix: LIBS += -L$$OUT_PWD/../ts-model/ -lts-model

INCLUDEPATH += $$PWD/../ts-model
DEPENDPATH += $$PWD/../ts-model

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-dao/release/ -lts-dao
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-dao/debug/ -lts-dao
else:unix: LIBS += -L$$OUT_PWD/../ts-dao/ -lts-dao

INCLUDEPATH += $$PWD/../ts-dao
DEPENDPATH += $$PWD/../ts-dao

HEADERS += \
    databuilder.h \
    resourcenamecoupling.h \
    controlsattachedtype.h \
    controlstyles.h \
    dummygraphdata.h \
    controls.h \
    loggerthread.h \
    runlater.h


win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-client/release/ -lts-client
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-client/debug/ -lts-client
else:unix: LIBS += -L$$OUT_PWD/../ts-client/ -lts-client

INCLUDEPATH += $$PWD/../ts-client
DEPENDPATH += $$PWD/../ts-client


unix {
    target.path = /opt/$${TARGET}/bin
    INSTALLS += target

    linux-oe-g++ {
        LIBS += -L$$PWD/../libzmq-bin/lib -lzmq
        INCLUDEPATH += $$PWD/../libzmq-bin/include
        DEPENDPATH += $$PWD/../libzmq-bin/include
        PRE_TARGETDEPS += $$PWD/../libzmq-bin/lib/libzmq.a
    } else {
        LIBS += -L$$PWD/../../../../../usr/local/lib -lzmq
        INCLUDEPATH += $$PWD/../../../../../usr/local/include
        DEPENDPATH += $$PWD/../../../../../usr/local/include
        PRE_TARGETDEPS += $$PWD/../../../../../usr/local/lib/libzmq.a
    }

    zeromq.path = /opt/$${TARGET}/bin
    zeromq.files += $$PWD/../libzmq-bin/lib/libzmq.so
    zeromq.files += $$PWD/../libzmq-bin/lib/libzmq.so.5.1.2
    zeromq.files += $$PWD/../libzmq-bin/lib/libzmq.so.5
    zeromq.files += $$PWD/../libzmq-bin/lib/libzmq.la
    zeromq.files += $$PWD/../libzmq-bin/lib/libzmq.a
    INSTALLS += zeromq

    db.path = /home/root
    db.files = $$PWD/../ts.db
    INSTALLS += db
}

win32{
    !android{
        win32: LIBS += -L'C:/Program Files (x86)/ZeroMQ 4.0.4/lib/' -llibzmq-v120-mt-4_0_4
        INCLUDEPATH += 'C:/Program Files (x86)/ZeroMQ 4.0.4/include'
        DEPENDPATH += 'C:/Program Files (x86)/ZeroMQ 4.0.4/include'
    }
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



#macx: LIBS += -L$$PWD/../../../../../usr/lib/libc++.dylib

#INCLUDEPATH += $$PWD/../../../../../usr
#DEPENDPATH += $$PWD/../../../../../usr
