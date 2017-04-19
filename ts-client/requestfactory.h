#ifndef REQUESTFACTORY_H
#define REQUESTFACTORY_H
#include <QString>
#include <memory>

class Request;
class RequestFactory
{
public:
    static RequestFactory instance();
    std::unique_ptr<Request> createBeginScan() const;
    std::unique_ptr<Request> createScan() const;
    std::unique_ptr<Request> createEndScan() const;
private:
    RequestFactory();
};

#endif // REQUESTFACTORY_H
