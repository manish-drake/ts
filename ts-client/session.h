#ifndef SESSION_H
#define SESSION_H
#include <QString>
#include <memory>
#include <zmq.hpp>

class Request;
class Response;
class Session
{
public:
    Session(zmq::context_t &ctx, const std::string &endpoint);
    bool open();
    Response request(std::unique_ptr<Request> request);
    void dispose();
    void changeEndpoint(const QString &newEndpoint);
private:
    std::string m_endpoint;
    zmq::socket_t m_socket;
};

#endif // SESSION_H
