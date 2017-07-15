#include "session.h"
#include "request.h"
#include "response.h"
#include <zmq.hpp>


Session::Session(zmq::context_t &ctx, const QString &endpoint):
    m_endpoint{endpoint},
    m_socket(ctx, ZMQ_REQ)
{
}

bool Session::open()
{
    if(!m_isOpen){
        m_socket.connect(this->m_endpoint.toStdString());
        m_isOpen = true;
    }
    return true;
}

Response Session::request(std::unique_ptr<Request> request)
{
    request->send(m_socket);
    return Response::receive(m_socket);
}

void Session::dispose()
{
    m_socket.disconnect(m_endpoint.toStdString());
    m_isOpen = false;
}

void Session::changeEndpoint(const QString &newEndpoint)
{
    if(m_isOpen){
        m_socket.disconnect(m_endpoint.toStdString());
        m_socket.connect(this->m_endpoint.toStdString());
    }
    m_endpoint = newEndpoint;
}
