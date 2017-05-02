#include "resourcenamecoupling.h"

QString ResourceNameCoupling::getPageFromViewId(const int &viewId) const{
    switch (viewId) {
    case 3:
        return "ads-b/ADS-B.qml";
    case 13:
    case 5:
        return "ads-b/ADSB-Scan.qml";
    case 14 ... 19:
    case 6 ... 12:
        return "ads-b/TestDetail.qml";
    case 29 ... 30:
        return "ads-b/Radar.qml";
    case 31 ... 32:
        return "ads-b/Graph.qml";
    case 4:
        return "setup/Setup.qml";
    case 20:
        return "setup/SetupUser.qml";
    case 21:
        return "setup/SetupUserDetail.qml";
    case 33:
        return "setup/SetupAddUser.qml";
    case 22:
        return "setup/SetupDisplay.qml";
    case 23:
        return "setup/SetupGPS.qml";
    case 24:
        return "setup/SetupNetwork.qml";
    case 25:
        return "setup/SetupSystemInfo.qml";
    case 26:
        return "setup/SetupConnection.qml";
    case 27:
        return "setup/SetupManualBit.qml";
    case 34:
        return "antenna/Antenna.qml";
    case 35 ... 36:
        return "antenna/AviationVSWR-CL.qml";
    case 37:
        return "antenna/AviationDTF.qml";
    case 38 ... 41:
        return "antenna/AviationCal.qml";
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

bool ResourceNameCoupling::compare(const int &viewId1, const int &viewId2) const
{
    return (this->getPageFromViewId(viewId1) == this->getPageFromViewId(viewId2));
}
