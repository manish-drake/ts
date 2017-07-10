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

    //VSWR
    std::unique_ptr<Request> createBeginScanVsrwIls() const;
    std::unique_ptr<Request> createBeginScanVsrwMb() const;
    std::unique_ptr<Request> createBeginScanVsrwVhfNavCom() const;
    std::unique_ptr<Request> createBeginScanVsrwGs() const;
    std::unique_ptr<Request> createBeginScanVsrwUhfCom() const;
    std::unique_ptr<Request> createBeginScanVsrwAtc() const;
    std::unique_ptr<Request> createBeginScanVsrwXpndr() const;
    std::unique_ptr<Request> createBeginScanVsrwFull() const;
    std::unique_ptr<Request> createScanVsrwIls() const;
    std::unique_ptr<Request> createScanVsrwMb() const;
    std::unique_ptr<Request> createScanVsrwVhfNavCom() const;
    std::unique_ptr<Request> createScanVsrwGs() const;
    std::unique_ptr<Request> createScanVsrwUhfCom() const;
    std::unique_ptr<Request> createScanVsrwAtc() const;
    std::unique_ptr<Request> createScanVsrwXpndr() const;
    std::unique_ptr<Request> createScanVsrwFull() const;
    std::unique_ptr<Request> createEndScanVsrwIls() const;
    std::unique_ptr<Request> createEndScanVsrwMb() const;
    std::unique_ptr<Request> createEndScanVsrwVhfNavCom() const;
    std::unique_ptr<Request> createEndScanVsrwGs() const;
    std::unique_ptr<Request> createEndScanVsrwUhfCom() const;
    std::unique_ptr<Request> createEndScanVsrwAtc() const;
    std::unique_ptr<Request> createEndScanVsrwXpndr() const;
    std::unique_ptr<Request> createEndScanVsrwFull() const;

    //LOSS
    std::unique_ptr<Request> createBeginScanLossIls() const;
    std::unique_ptr<Request> createBeginScanLossMb() const;
    std::unique_ptr<Request> createBeginScanLossVhfNavCom() const;
    std::unique_ptr<Request> createBeginScanLossGs() const;
    std::unique_ptr<Request> createBeginScanLossUhfCom() const;
    std::unique_ptr<Request> createBeginScanLossAtc() const;
    std::unique_ptr<Request> createBeginScanLossXpndr() const;
    std::unique_ptr<Request> createBeginScanLossFull() const;
    std::unique_ptr<Request> createScanLossIls() const;
    std::unique_ptr<Request> createScanLossMb() const;
    std::unique_ptr<Request> createScanLossVhfNavCom() const;
    std::unique_ptr<Request> createScanLossGs() const;
    std::unique_ptr<Request> createScanLossUhfCom() const;
    std::unique_ptr<Request> createScanLossAtc() const;
    std::unique_ptr<Request> createScanLossXpndr() const;
    std::unique_ptr<Request> createScanLossFull() const;
    std::unique_ptr<Request> createEndScanLossIls() const;
    std::unique_ptr<Request> createEndScanLossMb() const;
    std::unique_ptr<Request> createEndScanLossVhfNavCom() const;
    std::unique_ptr<Request> createEndScanLossGs() const;
    std::unique_ptr<Request> createEndScanLossUhfCom() const;
    std::unique_ptr<Request> createEndScanLossAtc() const;
    std::unique_ptr<Request> createEndScanLossXpndr() const;
    std::unique_ptr<Request> createEndScanLossFull() const;

    //DTF
    std::unique_ptr<Request> createBeginScanDtfReSolid() const;
    std::unique_ptr<Request> createBeginScanDtfPeFoam() const;
    std::unique_ptr<Request> createBeginScanDtfTeflon() const;
    std::unique_ptr<Request> createBeginScanDtfTeflonfoam() const;
    std::unique_ptr<Request> createBeginScanDtfUser() const;
    std::unique_ptr<Request> createScanDtfReSolid() const;
    std::unique_ptr<Request> createScanDtfPeFoam() const;
    std::unique_ptr<Request> createScanDtfTeflon() const;
    std::unique_ptr<Request> createScanDtfTeflonfoam() const;
    std::unique_ptr<Request> createScanDtfUser() const;
    std::unique_ptr<Request> createEndScanDtfReSolid() const;
    std::unique_ptr<Request> createEndScanDtfPeFoam() const;
    std::unique_ptr<Request> createEndScanDtfTeflon() const;
    std::unique_ptr<Request> createEndScanDtfTeflonfoam() const;
    std::unique_ptr<Request> createEndScanDtfUser() const;

    //CAL
    std::unique_ptr<Request> createBeginScanCalShort() const;
    std::unique_ptr<Request> createBeginScanCalOpen() const;
    std::unique_ptr<Request> createBeginScanCalLoad() const;
    std::unique_ptr<Request> createBeginScanCalThru() const;
    std::unique_ptr<Request> createBeginScanCalPrevCal() const;
    std::unique_ptr<Request> createScanCalShort() const;
    std::unique_ptr<Request> createScanCalOpen() const;
    std::unique_ptr<Request> createScanCalLoad() const;
    std::unique_ptr<Request> createScanCalThru() const;
    std::unique_ptr<Request> createScanCalPrevCal() const;
    std::unique_ptr<Request> createEndScanCalShort() const;
    std::unique_ptr<Request> createEndScanCalOpen() const;
    std::unique_ptr<Request> createEndScanCalLoad() const;
    std::unique_ptr<Request> createEndScanCalThru() const;
    std::unique_ptr<Request> createEndScanCalPrevCal() const;

    //SETUP
    std::unique_ptr<Request> createSetupListUsers() const;

private:
    RequestFactory();
};

#endif // REQUESTFACTORY_H
