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

Client::Client(QObject *parent) :
    QObject(parent),
    m_up_scanResults{new JsonArrayModel()},
    m_ctx{1},
    m_server{"localhost"},
    m_scan{m_ctx, SERVER},
    m_setup{m_ctx, SERVER}
{
}

bool Client::toggleScan(){
    if(m_scan.isScanning()){
        m_scan.onMessageReceivedHandler(nullptr);
        m_scan.stop();
        return false;
    }
    else {
        this->m_scan.onMessageReceivedHandler([this](const QJsonArray &results){
            this->setScanResults(JsonArrayModel::fromQJsonArray(results));
        });
        m_scan.start();
        return true;
    }
}

bool Client::queryUsers()
{
    this->m_setup.onMessageReceivedHandler([this](const QJsonArray &results){
        this->setScanResults(JsonArrayModel::fromQJsonArray(results));
    });
    m_setup.listUsers();
}

bool Client::addUser(int &userID, const QString &name,const int &language, const QString &email,const bool &emailSavedTests)
{
    this->m_setup.onMessageReceivedHandler([this](const QJsonArray &results){
        this->setScanResults(JsonArrayModel::fromQJsonArray(results));
    });
    this->m_setup.addUser(userID, name, language, email, emailSavedTests);
    return true;
}

void Client::setServer(const QString &server)
{
    if(m_server != server){
        m_server = server;
        m_scan.changeEndpoint("tcp://" + server + ":6000");
        m_setup.changeEndpoint("tcp://" + server + ":6000");
        emit serverChanged();
    }
}

QString Client::server()
{
    return m_server;
}

JsonArrayModel *Client::scanResults() const
{
    return m_up_scanResults.get();
}

void Client::setScanResults(std::unique_ptr<JsonArrayModel> model)
{
    m_up_scanResults = std::move(model);
    emit this->scanResultsChanged(m_up_scanResults.get());
}
