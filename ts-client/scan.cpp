#include "scan.h"
#include "session.h"
#include "requestfactory.h"
#include "response.h"
#include "request.h"


void Scan::start()
{
    this->m_session.open();
    this->m_session.request(RequestFactory::instance().createBeginScan());

    timer=std::unique_ptr<QTimer>(new QTimer());
    QObject::connect(&(*timer), &QTimer::timeout, [this](){this->timeout();});
    timer->start(POLLING_INTERVAL);
}

void Scan::stop()
{
    this->m_session.request(RequestFactory::instance().createEndScan());
    timer->stop();
}

bool Scan::toggle()
{
    if(this->m_isScanning){
        this->m_isScanning = false;
        this->stop();
    } else {
        this->start();
        this->m_isScanning = true;
    }

    return this->m_isScanning;
}

Scan::Scan(zmq::context_t &ctx , const std::string &endpoint):
    m_session{ctx, endpoint},
    m_isScanning{false}
{

}

void Scan::onMessageReceivedHandler(std::function<void (const QString&)> callback)
{
    this->m_callback = callback;
}

void Scan::timeout()
{
    auto response = this->m_session.request(RequestFactory::instance().createScan()).string();
    if(this->m_callback){
        this->m_callback(response);
    }
}

