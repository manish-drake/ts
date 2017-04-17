#ifndef REQUESTFACTORY_H
#define REQUESTFACTORY_H
#include <QString>
#include <memory>

class Request;
class RequestFactory
{
public:
    static RequestFactory instance();
    std::unique_ptr<Request> createBeginScan();
    std::unique_ptr<Request> createScan();
    std::unique_ptr<Request> createEndScan();
private:
    RequestFactory();
};

#endif // REQUESTFACTORY_H
