#include "requestfactory.h"
#include "request.h"

class BeginScan: public Request
{
public:
    BeginScan():Request() {}
public:
    std::string message() override{
        return "{\"request\":{\"version\":2,\"message\":8193,\"params\":{\"distance\":100,\"output\":\"antenna-a\"}}}";
    }
};
class Scan: public Request
{
public:
    Scan() {}
public:
    std::string message() override{
        return "{\"request\": {\"version\":2,\"message\":8196,\"params\": { } } }";
    }
};
class EndScan: public Request
{
public:
    EndScan() {}
public:
    std::string message() override{
        return "{\"request\":{\"version\":2,\"message\":8194,\"params\":{}}}";
    }
};


RequestFactory RequestFactory::instance()
{
    static RequestFactory singleton;
    return singleton;
}

std::unique_ptr<Request> RequestFactory::createBeginScan()
{
    return std::unique_ptr<Request>(new BeginScan());
}

std::unique_ptr<Request> RequestFactory::createScan()
{
    return std::unique_ptr<Request>(new Scan());
}

std::unique_ptr<Request> RequestFactory::createEndScan()
{
    return std::unique_ptr<Request>(new EndScan());
}

RequestFactory::RequestFactory()
{

}
