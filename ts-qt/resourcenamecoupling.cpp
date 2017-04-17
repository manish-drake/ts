#include "resourcenamecoupling.h"

QString ResourceNameCoupling::getPageFromViewId(const int &viewId){
    switch (viewId) {
    case 3:
        return "ADS-B.qml";
    case 13:
    case 5:
        return "ADSB-Scan.qml";
    case 14 ... 19:
    case 6 ... 12:        
        return "TestDetail.qml";
    case 29 ... 30:
        return "Radar.qml";
    case 31 ... 32:
        return "Graph.qml";
    case 4:
        return "Setup.qml";
    case 20:
        return "SetupUser.qml";
    case 21:
        return "SetupUserDetail.qml";
    case 33:
        return "SetupAddUser.qml";
    case 22:
        return "SetupDisplay.qml";
    case 23:
        return "SetupGPS.qml";
    case 24:
        return "SetupNetwork.qml";
    case 25:
        return "SetupSystemInfo.qml";
    case 26:
        return "SetupConnection.qml";
    case 27:
        return "SetupManualBit.qml";
    case 1:
    default:
        return "Global.qml";
    }
}

ResourceNameCoupling &ResourceNameCoupling::instance()
{
    static ResourceNameCoupling singelton;
    return  singelton;
}

ResourceNameCoupling::ResourceNameCoupling()
{

}

bool ResourceNameCoupling::compare(const int &viewId1, const int &viewId2)
{
    return (this->getPageFromViewId(viewId1) == this->getPageFromViewId(viewId2));
}
