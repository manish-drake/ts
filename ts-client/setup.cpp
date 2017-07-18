#include "setup.h"
#include "requestfactory.h"
#include "response.h"
#include "request.h"
#include <QDebug>
#include <QJsonArray>
#include <exception>
#include <QJsonObject>
#include <QJsonDocument>
#include <functional>

Setup::Setup(zmq::context_t &ctx, const QString &endpoint):
    m_session{ctx, endpoint}
{

}

void Setup::changeEndpoint(const QString &newEndpoint)
{
    m_session.changeEndpoint(newEndpoint);
}

void Setup::onMessageReceivedHandler(std::function<void (const QJsonArray &)> callback)
{
    m_callback = callback;
}

void Setup::listUsers()
{
    m_session.open();
    auto response = this->m_session.request(RequestFactory::instance()
                                            .createSetupListUsers()).string();
    if(m_callback){
        m_callback(parseMessage(response));
    }
}

void Setup::addUser(int &userID, const QString &name)
{
    m_session.open();
    auto response = this->m_session.request(RequestFactory::instance()
                                            .createSetupAddUser(userID, name)).string();
    if(m_callback){
        m_callback(parseMessage(response));
    }
}
