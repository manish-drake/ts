#ifndef SCAN_H
#define SCAN_H
#include <zmq.hpp>
#include "session.h"
#include <QTimer>
#include <memory>
#include <functional>
#include <QDebug>
#include <QJsonArray>


class Scan
{
public:
    bool isScanning() const;
    Scan(zmq::context_t &ctx, const std::string &endpoint);
    void onMessageReceivedHandler(std::function<void (const QJsonArray&)> callback);
    void start();
    void stop();
    void changeEndpoint(const QString &newEndpoint);
private:
    const int POLLING_INTERVAL = 1000;
    Session m_session;
    std::unique_ptr<QTimer> timer;
    void timeout();
    std::function<void (const QJsonArray&)> m_callback;
    bool m_isScanning;
};
QJsonArray parseMessage(const QString &msg);

#endif // SCAN_H
