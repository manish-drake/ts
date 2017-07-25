#include "resourcenamecoupling.h"

QString ResourceNameCoupling::getPageFromViewId(const int &viewId) const{
    switch (viewId) {
    case 3:
        return "tests/TestGroup.qml";
    case 13:
    case 5:
        return "tests/DetailAircraft.qml";
    case 14 ... 19:
    case 6 ... 12:
        return "tests/DetailSummary.qml";
    case 29 ... 30:
        return "tests/DetailRadar.qml";
    case 31 ... 32:
        return "tests/DetailGraph.qml";
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
    case 35:
        return "antenna/AviationVSWR.qml";
    case 36:
        return "antenna/AviationCableLoss.qml";
    case 37:
        return "antenna/AviationDTF.qml";
    case 38:
        return "AppLogs.qml";
    case 39:
        return "tests/DetailLanding.qml";
    case 40:
        return "antenna/AviLanding.qml";
    case 41:
        return "tests/TransponderLanding.qml";
    case 42:
        return "tests/TransponderSummary.qml";
    case 2:
        return "Home.qml";
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
