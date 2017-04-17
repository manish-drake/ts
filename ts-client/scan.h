#ifndef SCAN_H
#define SCAN_H
#include <zmq.hpp>
#include "session.h"
#include <QTimer>
#include <memory>
#include <functional>
#include <QDebug>


class Scan
{
public:
    bool toggle();
    Scan(zmq::context_t &ctx, const std::string &endpoint);
    void onMessageReceivedHandler(std::function<void (const QString&)> callback);
private:
    const int POLLING_INTERVAL = 1000;
    void start();
    void stop();
    Session m_session;
    std::unique_ptr<QTimer> timer;
    void timeout();
    std::function<void (const QString&)> m_callback;
    bool m_isScanning;
};

#endif // SCAN_H
