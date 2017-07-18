#ifndef SETUP_H
#define SETUP_H

#include <zmq.hpp>
#include <QJsonArray>
#include "session.h"


class Setup
{
public:
    Setup(zmq::context_t &ctx, const QString &endpoint);
    void changeEndpoint(const QString &newEndpoint);
    void onMessageReceivedHandler(std::function<void (const QJsonArray&)> callback);
    void listUsers();
    void addUser(int &userID, const QString &name);
private:
    Session m_session;
    std::function<void (const QJsonArray&)> m_callback;
};
QJsonArray parseMessage(const QString &msg);

#endif // SETUP_H
