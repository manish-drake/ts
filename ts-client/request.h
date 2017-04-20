#ifndef REQUEST_H
#define REQUEST_H

#include <QString>
#include <zmq.hpp>

class Request
{
    virtual std::string message() const;
public:
    void send(zmq::socket_t &sock);
    zmq::message_t zmqMessage() const;
protected:
    Request();
};

#endif // REQUEST_H
