#include "response.h"
#include "QDebug"

Response Response::receive(zmq::socket_t &sock)
{
    zmq::message_t reply;
    sock.recv (&reply);
    Response resp;
    resp.m_string = (char*)reply.data();
    qDebug() << resp.m_string;
    return resp;
}

QString Response::string() const
{
    return this->m_string;
}

Response::Response():
    m_string{""}
{

}
