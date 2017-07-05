#include "scan.h"
#include "session.h"
#include "requestfactory.h"
#include "response.h"
#include "request.h"
#include <exception>
#include <QJsonObject>
#include <QJsonDocument>


void Scan::start()
{
    if(m_isScanning){
        throw std::runtime_error("The scan is already in progress.");
    }
    this->m_session.open();
    this->m_session.request(RequestFactory::instance().createBeginScan());

    timer=std::unique_ptr<QTimer>(new QTimer());
    QObject::connect(&(*timer), &QTimer::timeout, [this](){this->timeout();});
    timer->start(POLLING_INTERVAL);
    m_isScanning = true;
}

void Scan::stop()
{
    m_isScanning = false;
    m_session.request(RequestFactory::instance().createEndScan());
    timer->stop();
    m_session.dispose();
}

void Scan::changeEndpoint(const QString &newEndpoint)
{
    m_session.changeEndpoint(newEndpoint);
}


bool Scan::isScanning() const
{   
    return m_isScanning;
}

Scan::Scan(zmq::context_t &ctx , const QString &endpoint):
    m_session{ctx, endpoint},
    m_isScanning{false}
{

}

void Scan::onMessageReceivedHandler(std::function<void (const QJsonArray&)> callback)
{
    m_callback = callback;
}

void Scan::timeout()
{
    auto response = this->m_session.request(RequestFactory::instance().createScan()).string();
    if(m_callback){
        m_callback(parseMessage(response));
    }
}
QJsonArray parseMessage(const QString &msg)
{
    int trim = (msg.at(msg.size()-1).toLatin1() != '\n') ? 12 : 0;

    QString nameT(msg.left(msg.length() - trim));

    QJsonObject obj;


    QJsonDocument doc = QJsonDocument::fromJson(nameT.toUtf8());
    if(!doc.isNull())
    {
        if(doc.isObject())
        {
            obj = doc.object();
            QJsonObject response = obj.value(QString("response")).toObject();
            QJsonObject data = response.value(QString("data")).toObject();

            QJsonArray results = data["results"].toArray();
            return results;
        }
        else
        {
            qDebug() << "Document is not an object" << endl;
        }
    }
    else
    {
        qDebug() << "Invalid JSON...\n" << nameT << endl;
    }
    return QJsonArray();
}

