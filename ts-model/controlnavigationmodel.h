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
    Q_PROPERTY(int pin READ pin WRITE generatePIN NOTIFY pinChanged)
    Q_INVOKABLE int pin() const;
    Q_INVOKABLE void generatePIN(const int &pin);
     ~ControlNavigationModel();

signals:
    void pinChanged();

private:
    int m_pin;
    int getRandomPIN()
    {
        auto generatedPIN = ((qrand() % ((9999 + 1) - 1111)) + 1111);
        return generatedPIN;
    }
};

#endif // CONTROLNAVIGATIONMODEL_H
