#ifndef CONTROLNAVIGATIONMODEL_H
#define CONTROLNAVIGATIONMODEL_H

#include "ts-model_global.h"
#include <QObject>
#include <cstdlib>
#include <ctime>

class TSMODELSHARED_EXPORT ControlNavigationModel: public QObject
{
    Q_OBJECT
public:
    ControlNavigationModel();
    Q_INVOKABLE int generatePIN(const int Min = 1000, const int Max = 9999);
     ~ControlNavigationModel();
};

#endif // CONTROLNAVIGATIONMODEL_H
