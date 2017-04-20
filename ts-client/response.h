#ifndef RESPONSE_H
#define RESPONSE_H

#include <zmq.hpp>
#include <QString>

class Response
{
public:
    static Response receive(zmq::socket_t&);
    QString string() const;
private:
    Response();
    QString m_string;
};

#endif // RESPONSE_H
