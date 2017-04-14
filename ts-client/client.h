#ifndef CLIENT_H
#define CLIENT_H

#include "ts-client_global.h"
#include <QString>

class TSCLIENTSHARED_EXPORT Client
{

public:
    Client(const QString &serverIP);
private:
    QString m_serverIP;
};

#endif // CLIENT_H
