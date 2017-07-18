#ifndef SETUPMODEL_H
#define SETUPMODEL_H

#include <QObject>

#include <user.h>

#include "ts-model_global.h"

class TSMODELSHARED_EXPORT SetupModel: public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(User* newUser READ newUser CONSTANT)
    Q_INVOKABLE void createNewUser();
    Q_INVOKABLE void addNewUser();
    SetupModel();
signals:
private:
    User *newUser();
    User *m_newUser;
};

#endif // SETUPMODEL_H
