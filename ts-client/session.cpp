#include "session.h"
#include "request.h"
#include "response.h"
#include <zmq.hpp>


Session::Session(zmq::context_t &ctx, const std::string &endpoint):
    m_endpoint{endpoint},
    m_socket(ctx, ZMQ_REQ)
{
}

bool Session::open()
{
    m_socket.connect(this->m_endpoint);
    return true;
}

Response Session::request(std::unique_ptr<Request> request)
{
    request->send(m_socket);

    return Response::receive(m_socket);
}

void Session::dispose()
{

}
