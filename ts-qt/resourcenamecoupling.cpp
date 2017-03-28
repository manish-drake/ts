#include "resourcenamecoupling.h"

ResourceNameCoupling::ResourceNameCoupling()
{
    resourceRegistry.insert("_global", "Global.qml");
    resourceRegistry.insert("_global", "Global.qml");
}

QString ResourceNameCoupling::getResourceNameFromView(QString viewName)
{
    return this->resourceRegistry[viewName];
}
