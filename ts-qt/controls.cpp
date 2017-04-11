#include "controls.h"

Controls::Controls(QObject *parent) : QObject(parent)
{

}

ControlsAttachedType *Controls::qmlAttachedProperties(QObject *object)
{
    return new ControlsAttachedType(object);
}
