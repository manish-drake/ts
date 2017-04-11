TEMPLATE = app

QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    databuilder.cpp \
    resourcenamecoupling.cpp \
    controls.cpp \
    controlsattachedtype.cpp \
    controlstyles.cpp

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
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ts-core/release/ -lts-core
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ts-core/debug/ -lts-core
else:unix: LIBS += -L$$OUT_PWD/../ts-core/ -lts-core

INCLUDEPATH += $$PWD/../ts-core
DEPENDPATH += $$PWD/../ts-core

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
    controls.h \
    controlsattachedtype.h \
    controlstyles.h
