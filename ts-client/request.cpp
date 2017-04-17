#include "request.h"


std::string Request::message()
{
    return "";
}

void Request::send(zmq::socket_t &sock)
{
    sock.send(zmqMessage());
}

zmq::message_t Request::zmqMessage()
{
    auto sz = message().size();
    zmq::message_t request (sz);
    std::string msg = message();
    memcpy (request.data (), msg.data(), sz);
    return request;
}

Request::Request()
{

}
