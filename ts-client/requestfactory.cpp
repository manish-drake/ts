#include "requestfactory.h"
#include "request.h"

class BeginScan : public Request
{
public:
    BeginScan() : Request() {}
public:
    std::string message() const override
    {
        return "{\"request\":{\"version\":2,\"message\":8193,\"params\":{\"distance\":100,\"output\":\"antenna-a\"}}}";
    }
};
class Scan : public Request
{
public:
    Scan() {}
public:
    std::string message() const override
    {
        return "{\"request\": {\"version\":2,\"message\":8196,\"params\": { } } }";
    }
};
class EndScan : public Request
{
public:
    EndScan() {}
public:
    std::string message() const override
    {
        return "{\"request\":{\"version\":2,\"message\":8194,\"params\":{}}}";
    }
};

//VSWR
class BeginScanVswrIls : public Request
{
public:
    BeginScanVswrIls() {}

private:
    std::string message() const override
    {
        return "{\"request\":{\"version\":2,\"message\":8194,\"params\":{}}}";
    }
};

class BeginScanVsrwMb : public Request
{
public:
    BeginScanVsrwMb() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanVsrwVhfNavCom : public Request
{
public:
    BeginScanVsrwVhfNavCom() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanVsrwGs : public Request
{
public:
    BeginScanVsrwGs() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanVsrwUhfCom : public Request
{
public:
    BeginScanVsrwUhfCom() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanVsrwAtc : public Request
{
public:
    BeginScanVsrwAtc() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanVsrwXpndr : public Request
{
public:
    BeginScanVsrwXpndr() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanVsrwFull : public Request
{
public:
    BeginScanVsrwFull() {}
private:
    std::string message() const override { return ""; }
};
class ScanVsrwIls : public Request
{
public:
    ScanVsrwIls() {}
private:
    std::string message() const override { return ""; }
};
class ScanVsrwMb : public Request
{
public:
    ScanVsrwMb() {}
private:
    std::string message() const override { return ""; }
};
class ScanVsrwVhfNavCom : public Request
{
public:
    ScanVsrwVhfNavCom() {}
private:
    std::string message() const override { return ""; }
};
class ScanVsrwGs : public Request
{
public:
    ScanVsrwGs() {}
private:
    std::string message() const override { return ""; }
};
class ScanVsrwUhfCom : public Request
{
public:
    ScanVsrwUhfCom() {}
private:
    std::string message() const override { return ""; }
};
class ScanVsrwAtc : public Request
{
public:
    ScanVsrwAtc() {}
private:
    std::string message() const override { return ""; }
};
class ScanVsrwXpndr : public Request
{
public:
    ScanVsrwXpndr() {}
private:
    std::string message() const override { return ""; }
};
class ScanVsrwFull : public Request
{
public:
    ScanVsrwFull() {}
private:
    std::string message() const override { return ""; }
};
class EndScanVsrwIls : public Request
{
public:
    EndScanVsrwIls() {}
private:
    std::string message() const override { return ""; }
};
class EndScanVsrwMb : public Request
{
public:
    EndScanVsrwMb() {}
private:
    std::string message() const override { return ""; }
};
class EndScanVsrwVhfNavCom : public Request
{
public:
    EndScanVsrwVhfNavCom() {}
private:
    std::string message() const override { return ""; }
};
class EndScanVsrwGs : public Request
{
public:
    EndScanVsrwGs() {}
private:
    std::string message() const override { return ""; }
};
class EndScanVsrwUhfCom : public Request
{
public:
    EndScanVsrwUhfCom() {}
private:
    std::string message() const override { return ""; }
};
class EndScanVsrwAtc : public Request
{
public:
    EndScanVsrwAtc() {}
private:
    std::string message() const override { return ""; }
};
class EndScanVsrwXpndr : public Request
{
public:
    EndScanVsrwXpndr() {}
private:
    std::string message() const override { return ""; }
};
class EndScanVsrwFull : public Request
{
public:
    EndScanVsrwFull() {}
private:
    std::string message() const override { return ""; }
};

//LOSS
class BeginScanLossIls : public Request
{
public:
    BeginScanLossIls() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanLossMb : public Request
{
public:
    BeginScanLossMb() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanLossVhfNavCom : public Request
{
public:
    BeginScanLossVhfNavCom() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanLossGs : public Request
{
public:
    BeginScanLossGs() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanLossUhfCom : public Request
{
public:
    BeginScanLossUhfCom() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanLossAtc : public Request
{
public:
    BeginScanLossAtc() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanLossXpndr : public Request
{
public:
    BeginScanLossXpndr() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanLossFull : public Request
{
public:
    BeginScanLossFull() {}
private:
    std::string message() const override { return ""; }
};
class ScanLossIls : public Request
{
public:
    ScanLossIls() {}
private:
    std::string message() const override { return ""; }
};
class ScanLossMb : public Request
{
public:
    ScanLossMb() {}
private:
    std::string message() const override { return ""; }
};
class ScanLossVhfNavCom : public Request
{
public:
    ScanLossVhfNavCom() {}
private:
    std::string message() const override { return ""; }
};
class ScanLossGs : public Request
{
public:
    ScanLossGs() {}
private:
    std::string message() const override { return ""; }
};
class ScanLossUhfCom : public Request
{
public:
    ScanLossUhfCom() {}
private:
    std::string message() const override { return ""; }
};
class ScanLossAtc : public Request
{
public:
    ScanLossAtc() {}
private:
    std::string message() const override { return ""; }
};
class ScanLossXpndr : public Request
{
public:
    ScanLossXpndr() {}
private:
    std::string message() const override { return ""; }
};
class ScanLossFull : public Request
{
public:
    ScanLossFull() {}
private:
    std::string message() const override { return ""; }
};
class EndScanLossIls : public Request
{
public:
    EndScanLossIls() {}
private:
    std::string message() const override { return ""; }
};
class EndScanLossMb : public Request
{
public:
    EndScanLossMb() {}
private:
    std::string message() const override { return ""; }
};
class EndScanLossVhfNavCom : public Request
{
public:
    EndScanLossVhfNavCom() {}
private:
    std::string message() const override { return ""; }
};
class EndScanLossGs : public Request
{
public:
    EndScanLossGs() {}
private:
    std::string message() const override { return ""; }
};
class EndScanLossUhfCom : public Request
{
public:
    EndScanLossUhfCom() {}
private:
    std::string message() const override { return ""; }
};
class EndScanLossAtc : public Request
{
public:
    EndScanLossAtc() {}
private:
    std::string message() const override { return ""; }
};
class EndScanLossXpndr : public Request
{
public:
    EndScanLossXpndr() {}
private:
    std::string message() const override { return ""; }
};
class EndScanLossFull : public Request
{
public:
    EndScanLossFull() {}
private:
    std::string message() const override { return ""; }
};

//DTF
class BeginScanDtfReSolid : public Request
{
public:
    BeginScanDtfReSolid() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanDtfPeFoam : public Request
{
public:
    BeginScanDtfPeFoam() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanDtfTeflon : public Request
{
public:
    BeginScanDtfTeflon() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanDtfTeflonfoam : public Request
{
public:
    BeginScanDtfTeflonfoam() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanDtfUser : public Request
{
public:
    BeginScanDtfUser() {}
private:
    std::string message() const override { return ""; }
};
class ScanDtfReSolid : public Request
{
public:
    ScanDtfReSolid() {}
private:
    std::string message() const override { return ""; }
};
class ScanDtfPeFoam : public Request
{
public:
    ScanDtfPeFoam() {}
private:
    std::string message() const override { return ""; }
};
class ScanDtfTeflon : public Request
{
public:
    ScanDtfTeflon() {}
private:
    std::string message() const override { return ""; }
};
class ScanDtfTeflonfoam : public Request
{
public:
    ScanDtfTeflonfoam() {}
private:
    std::string message() const override { return ""; }
};
class ScanDtfUser : public Request
{
public:
    ScanDtfUser() {}
private:
    std::string message() const override { return ""; }
};
class EndScanDtfReSolid : public Request
{
public:
    EndScanDtfReSolid() {}
private:
    std::string message() const override { return ""; }
};
class EndScanDtfPeFoam : public Request
{
public:
    EndScanDtfPeFoam() {}
private:
    std::string message() const override { return ""; }
};
class EndScanDtfTeflon : public Request
{
public:
    EndScanDtfTeflon() {}
private:
    std::string message() const override { return ""; }
};
class EndScanDtfTeflonfoam : public Request
{
public:
    EndScanDtfTeflonfoam() {}
private:
    std::string message() const override { return ""; }
};
class EndScanDtfUser : public Request
{
public:
    EndScanDtfUser() {}
private:
    std::string message() const override { return ""; }
};

//CAL
class BeginScanCalShort : public Request
{
public:
    BeginScanCalShort() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanCalOpen : public Request
{
public:
    BeginScanCalOpen() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanCalLoad : public Request
{
public:
    BeginScanCalLoad() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanCalThru : public Request
{
public:
    BeginScanCalThru() {}
private:
    std::string message() const override { return ""; }
};
class BeginScanCalPrevCal : public Request
{
public:
    BeginScanCalPrevCal() {}
private:
    std::string message() const override { return ""; }
};
class ScanCalShort : public Request
{
public:
    ScanCalShort() {}
private:
    std::string message() const override { return ""; }
};
class ScanCalOpen : public Request
{
public:
    ScanCalOpen() {}
private:
    std::string message() const override { return ""; }
};
class ScanCalLoad : public Request
{
public:
    ScanCalLoad() {}
private:
    std::string message() const override { return ""; }
};
class ScanCalThru : public Request
{
public:
    ScanCalThru() {}
private:
    std::string message() const override { return ""; }
};
class ScanCalPrevCal : public Request
{
public:
    ScanCalPrevCal() {}
private:
    std::string message() const override { return ""; }
};
class EndScanCalShort : public Request
{
public:
    EndScanCalShort() {}
private:
    std::string message() const override { return ""; }
};
class EndScanCalOpen : public Request
{
public:
    EndScanCalOpen() {}
private:
    std::string message() const override { return ""; }
};
class EndScanCalLoad : public Request
{
public:
    EndScanCalLoad() {}
private:
    std::string message() const override { return ""; }
};
class EndScanCalThru : public Request
{
public:
    EndScanCalThru() {}
private:
    std::string message() const override { return ""; }
};
class EndScanCalPrevCal : public Request
{
public:
    EndScanCalPrevCal() {}
private:
    std::string message() const override { return ""; }
};


//SETUP
class SetupListUsers: public Request
{
public:
    SetupListUsers(){}
private:
    std::string message() const override {
        return "{\"request\":{\"version\":2,\"message\":16392,\"params\":{}} }";
    }
};

class SetupAddUser: public Request
{
public:
    SetupAddUser(){}
    SetupAddUser(int &userID, const QString &name, const int &language, const QString &email, const bool &emailSavedTests):
        m_userID{userID},
        m_name{name},
        m_language{language},
        m_email{email},
        m_emailSavedTests{emailSavedTests}{}
private:
    int m_userID = 0;
    QString m_name;
    int m_language;
    QString m_email;
    bool m_emailSavedTests;
    std::string message() const override {
        return "{\"request\": {\"message\":16394,\"source\":\"qt\",\"params\":{\"email\":\"chris.laganga@gmail.com\",\"email-results\":true,\"user-name\":\"Chris\"}}}";
    }
};

RequestFactory RequestFactory::instance()
{
    static RequestFactory singleton;
    return singleton;
}

std::unique_ptr<Request> RequestFactory::createBeginScan() const
{
    return std::unique_ptr<Request>(new BeginScan());
}

std::unique_ptr<Request> RequestFactory::createScan() const
{
    return std::unique_ptr<Request>(new Scan());
}

std::unique_ptr<Request> RequestFactory::createEndScan() const
{
    return std::unique_ptr<Request>(new EndScan());
}
//VSWR
std::unique_ptr<Request> RequestFactory::createBeginScanVsrwIls() const { return std::unique_ptr<Request>(new BeginScanVswrIls()); }
std::unique_ptr<Request> RequestFactory::createBeginScanVsrwMb() const { return std::unique_ptr<Request>(new BeginScanVsrwMb()); }
std::unique_ptr<Request> RequestFactory::createBeginScanVsrwVhfNavCom() const { return std::unique_ptr<Request>(new BeginScanVsrwVhfNavCom()); }
std::unique_ptr<Request> RequestFactory::createBeginScanVsrwGs() const { return std::unique_ptr<Request>(new BeginScanVsrwGs()); }
std::unique_ptr<Request> RequestFactory::createBeginScanVsrwUhfCom() const { return std::unique_ptr<Request>(new BeginScanVsrwUhfCom()); }
std::unique_ptr<Request> RequestFactory::createBeginScanVsrwAtc() const { return std::unique_ptr<Request>(new BeginScanVsrwAtc()); }
std::unique_ptr<Request> RequestFactory::createBeginScanVsrwXpndr() const { return std::unique_ptr<Request>(new BeginScanVsrwXpndr()); }
std::unique_ptr<Request> RequestFactory::createBeginScanVsrwFull() const { return std::unique_ptr<Request>(new BeginScanVsrwFull()); }
std::unique_ptr<Request> RequestFactory::createScanVsrwIls() const { return std::unique_ptr<Request>(new ScanVsrwIls()); }
std::unique_ptr<Request> RequestFactory::createScanVsrwMb() const { return std::unique_ptr<Request>(new ScanVsrwMb()); }
std::unique_ptr<Request> RequestFactory::createScanVsrwVhfNavCom() const { return std::unique_ptr<Request>(new ScanVsrwVhfNavCom()); }
std::unique_ptr<Request> RequestFactory::createScanVsrwGs() const { return std::unique_ptr<Request>(new ScanVsrwGs()); }
std::unique_ptr<Request> RequestFactory::createScanVsrwUhfCom() const { return std::unique_ptr<Request>(new ScanVsrwUhfCom()); }
std::unique_ptr<Request> RequestFactory::createScanVsrwAtc() const { return std::unique_ptr<Request>(new ScanVsrwAtc()); }
std::unique_ptr<Request> RequestFactory::createScanVsrwXpndr() const { return std::unique_ptr<Request>(new ScanVsrwXpndr()); }
std::unique_ptr<Request> RequestFactory::createScanVsrwFull() const { return std::unique_ptr<Request>(new ScanVsrwFull()); }
std::unique_ptr<Request> RequestFactory::createEndScanVsrwIls() const { return std::unique_ptr<Request>(new EndScanVsrwIls()); }
std::unique_ptr<Request> RequestFactory::createEndScanVsrwMb() const { return std::unique_ptr<Request>(new EndScanVsrwMb()); }
std::unique_ptr<Request> RequestFactory::createEndScanVsrwVhfNavCom() const { return std::unique_ptr<Request>(new EndScanVsrwVhfNavCom()); }
std::unique_ptr<Request> RequestFactory::createEndScanVsrwGs() const { return std::unique_ptr<Request>(new EndScanVsrwGs()); }
std::unique_ptr<Request> RequestFactory::createEndScanVsrwUhfCom() const { return std::unique_ptr<Request>(new EndScanVsrwUhfCom()); }
std::unique_ptr<Request> RequestFactory::createEndScanVsrwAtc() const { return std::unique_ptr<Request>(new EndScanVsrwAtc()); }
std::unique_ptr<Request> RequestFactory::createEndScanVsrwXpndr() const { return std::unique_ptr<Request>(new EndScanVsrwXpndr()); }
std::unique_ptr<Request> RequestFactory::createEndScanVsrwFull() const { return std::unique_ptr<Request>(new EndScanVsrwFull()); }

//LOSS
std::unique_ptr<Request> RequestFactory::createBeginScanLossIls() const { return std::unique_ptr<Request>(new BeginScanLossIls()); }
std::unique_ptr<Request> RequestFactory::createBeginScanLossMb() const { return std::unique_ptr<Request>(new BeginScanLossMb()); }
std::unique_ptr<Request> RequestFactory::createBeginScanLossVhfNavCom() const { return std::unique_ptr<Request>(new BeginScanLossVhfNavCom()); }
std::unique_ptr<Request> RequestFactory::createBeginScanLossGs() const { return std::unique_ptr<Request>(new BeginScanLossGs()); }
std::unique_ptr<Request> RequestFactory::createBeginScanLossUhfCom() const { return std::unique_ptr<Request>(new BeginScanLossUhfCom()); }
std::unique_ptr<Request> RequestFactory::createBeginScanLossAtc() const { return std::unique_ptr<Request>(new BeginScanLossAtc()); }
std::unique_ptr<Request> RequestFactory::createBeginScanLossXpndr() const { return std::unique_ptr<Request>(new BeginScanLossXpndr()); }
std::unique_ptr<Request> RequestFactory::createBeginScanLossFull() const { return std::unique_ptr<Request>(new BeginScanLossFull()); }
std::unique_ptr<Request> RequestFactory::createScanLossIls() const { return std::unique_ptr<Request>(new ScanLossIls()); }
std::unique_ptr<Request> RequestFactory::createScanLossMb() const { return std::unique_ptr<Request>(new ScanLossMb()); }
std::unique_ptr<Request> RequestFactory::createScanLossVhfNavCom() const { return std::unique_ptr<Request>(new ScanLossVhfNavCom()); }
std::unique_ptr<Request> RequestFactory::createScanLossGs() const { return std::unique_ptr<Request>(new ScanLossGs()); }
std::unique_ptr<Request> RequestFactory::createScanLossUhfCom() const { return std::unique_ptr<Request>(new ScanLossUhfCom()); }
std::unique_ptr<Request> RequestFactory::createScanLossAtc() const { return std::unique_ptr<Request>(new ScanLossAtc()); }
std::unique_ptr<Request> RequestFactory::createScanLossXpndr() const { return std::unique_ptr<Request>(new ScanLossXpndr()); }
std::unique_ptr<Request> RequestFactory::createScanLossFull() const { return std::unique_ptr<Request>(new ScanLossFull()); }
std::unique_ptr<Request> RequestFactory::createEndScanLossIls() const { return std::unique_ptr<Request>(new EndScanLossIls()); }
std::unique_ptr<Request> RequestFactory::createEndScanLossMb() const { return std::unique_ptr<Request>(new EndScanLossMb()); }
std::unique_ptr<Request> RequestFactory::createEndScanLossVhfNavCom() const { return std::unique_ptr<Request>(new EndScanLossVhfNavCom()); }
std::unique_ptr<Request> RequestFactory::createEndScanLossGs() const { return std::unique_ptr<Request>(new EndScanLossGs()); }
std::unique_ptr<Request> RequestFactory::createEndScanLossUhfCom() const { return std::unique_ptr<Request>(new EndScanLossUhfCom()); }
std::unique_ptr<Request> RequestFactory::createEndScanLossAtc() const { return std::unique_ptr<Request>(new EndScanLossAtc()); }
std::unique_ptr<Request> RequestFactory::createEndScanLossXpndr() const { return std::unique_ptr<Request>(new EndScanLossXpndr()); }
std::unique_ptr<Request> RequestFactory::createEndScanLossFull() const { return std::unique_ptr<Request>(new EndScanLossFull()); }

//DTF
std::unique_ptr<Request> RequestFactory::createBeginScanDtfReSolid() const { return std::unique_ptr<Request>(new BeginScanDtfReSolid()); }
std::unique_ptr<Request> RequestFactory::createBeginScanDtfPeFoam() const { return std::unique_ptr<Request>(new BeginScanDtfPeFoam()); }
std::unique_ptr<Request> RequestFactory::createBeginScanDtfTeflon() const { return std::unique_ptr<Request>(new BeginScanDtfTeflon()); }
std::unique_ptr<Request> RequestFactory::createBeginScanDtfTeflonfoam() const { return std::unique_ptr<Request>(new BeginScanDtfTeflonfoam()); }
std::unique_ptr<Request> RequestFactory::createBeginScanDtfUser() const { return std::unique_ptr<Request>(new BeginScanDtfUser()); }
std::unique_ptr<Request> RequestFactory::createScanDtfReSolid() const { return std::unique_ptr<Request>(new ScanDtfReSolid()); }
std::unique_ptr<Request> RequestFactory::createScanDtfPeFoam() const { return std::unique_ptr<Request>(new ScanDtfPeFoam()); }
std::unique_ptr<Request> RequestFactory::createScanDtfTeflon() const { return std::unique_ptr<Request>(new ScanDtfTeflon()); }
std::unique_ptr<Request> RequestFactory::createScanDtfTeflonfoam() const { return std::unique_ptr<Request>(new ScanDtfTeflonfoam()); }
std::unique_ptr<Request> RequestFactory::createScanDtfUser() const { return std::unique_ptr<Request>(new ScanDtfUser()); }
std::unique_ptr<Request> RequestFactory::createEndScanDtfReSolid() const { return std::unique_ptr<Request>(new EndScanDtfReSolid()); }
std::unique_ptr<Request> RequestFactory::createEndScanDtfPeFoam() const { return std::unique_ptr<Request>(new EndScanDtfPeFoam()); }
std::unique_ptr<Request> RequestFactory::createEndScanDtfTeflon() const { return std::unique_ptr<Request>(new EndScanDtfTeflon()); }
std::unique_ptr<Request> RequestFactory::createEndScanDtfTeflonfoam() const { return std::unique_ptr<Request>(new EndScanDtfTeflonfoam()); }
std::unique_ptr<Request> RequestFactory::createEndScanDtfUser() const { return std::unique_ptr<Request>(new EndScanDtfUser()); }

//CAL
std::unique_ptr<Request> RequestFactory::createBeginScanCalShort() const { return std::unique_ptr<Request>(new BeginScanCalShort()); }
std::unique_ptr<Request> RequestFactory::createBeginScanCalOpen() const { return std::unique_ptr<Request>(new BeginScanCalOpen()); }
std::unique_ptr<Request> RequestFactory::createBeginScanCalLoad() const { return std::unique_ptr<Request>(new BeginScanCalLoad()); }
std::unique_ptr<Request> RequestFactory::createBeginScanCalThru() const { return std::unique_ptr<Request>(new BeginScanCalThru()); }
std::unique_ptr<Request> RequestFactory::createBeginScanCalPrevCal() const { return std::unique_ptr<Request>(new BeginScanCalPrevCal()); }
std::unique_ptr<Request> RequestFactory::createScanCalShort() const { return std::unique_ptr<Request>(new ScanCalShort()); }
std::unique_ptr<Request> RequestFactory::createScanCalOpen() const { return std::unique_ptr<Request>(new ScanCalOpen()); }
std::unique_ptr<Request> RequestFactory::createScanCalLoad() const { return std::unique_ptr<Request>(new ScanCalLoad()); }
std::unique_ptr<Request> RequestFactory::createScanCalThru() const { return std::unique_ptr<Request>(new ScanCalThru()); }
std::unique_ptr<Request> RequestFactory::createScanCalPrevCal() const { return std::unique_ptr<Request>(new ScanCalPrevCal()); }
std::unique_ptr<Request> RequestFactory::createEndScanCalShort() const { return std::unique_ptr<Request>(new EndScanCalShort()); }
std::unique_ptr<Request> RequestFactory::createEndScanCalOpen() const { return std::unique_ptr<Request>(new EndScanCalOpen()); }
std::unique_ptr<Request> RequestFactory::createEndScanCalLoad() const { return std::unique_ptr<Request>(new EndScanCalLoad()); }
std::unique_ptr<Request> RequestFactory::createEndScanCalThru() const { return std::unique_ptr<Request>(new EndScanCalThru()); }
std::unique_ptr<Request> RequestFactory::createEndScanCalPrevCal() const { return std::unique_ptr<Request>(new EndScanCalPrevCal()); }


//SETUP
std::unique_ptr<Request> RequestFactory::createSetupListUsers() const
{
    return std::unique_ptr<Request>(new SetupListUsers());
}

std::unique_ptr<Request> RequestFactory::createSetupAddUser(int &userID, const QString &name, const int &language, const QString &email, const bool &emailSavedTests) const
{
    return std::unique_ptr<Request>(new SetupAddUser(userID, name, language, email, emailSavedTests));
}

RequestFactory::RequestFactory()
{
}
