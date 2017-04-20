#ifndef CONTROLS_H
#define CONTROLS_H

#include <QObject>
#include <qqml.h>
#include "controlsattachedtype.h"


class Controls : public QObject
{
    Q_OBJECT
public:
    explicit Controls(QObject *parent = 0);
    static ControlsAttachedType *qmlAttachedProperties(QObject *object) ;
signals:

public slots:
private:

};

QML_DECLARE_TYPEINFO(Controls, QML_HAS_ATTACHED_PROPERTIES)

#endif // CONTROLS_H
