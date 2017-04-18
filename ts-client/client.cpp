#include "client.h"
#include <zmq.hpp>
#include <QTimer>
#include "session.h"
#include "request.h"
#include "requestfactory.h"
#include "response.h"
#include <QTimer>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>
#include <QJsonArray>

using namespace zmq;

Client::Client(const std::string &endpoint, QObject *parent) :
    QObject(parent),
    m_up_scanResults{new JsonArrayModel()},
    m_ctx{1},
    m_scan{m_ctx, endpoint}
{
}

bool Client::toggleScan(){
    if(this->m_scan.toggle()){
        this->m_scan.onMessageReceivedHandler([this](const QString &message){
            this->parseMessage(message);
        });
        return true;
    }
    else {
        return false;
    }
}


void Client::parseMessage(const QString &msg)
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
            setScanResults(JsonArrayModel::fromQJsonArray(results));
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
}


JsonArrayModel *Client::scanResults() const
{
    return this->m_up_scanResults.get();
}

void Client::setScanResults(std::unique_ptr<JsonArrayModel> model)
{

    this->m_up_scanResults = std::move(model);
    emit this->scanResultsChanged(this->m_up_scanResults.get());
}
