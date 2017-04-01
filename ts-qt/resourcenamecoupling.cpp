#include "resourcenamecoupling.h"

QString ResourceNameCoupling::getPageFromViewId(int viewId){
    switch (viewId) {
    case 3:
        return "ADS-B.qml";
    case 5:
        return "ADSB-Scan.qml";
    case 6 ... 12:
        return "ADSB-Pages.qml";
    case 4:
        return "Setup.qml";
    case 20://Setup-User
        return "";
    case 21://Setup-User-EditUser
        return "";
    case 22:
        return "SetupDisplay.qml";
    case 23:
        return "SetupGPS.qml";
    case 24:
        return "SetupNetwork.qml";
    case 25:
        return "SetupSystemInfo.qml";
    case 26:
        return "SetupConnectionDetail.qml";
    case 1:
    default:
        return "Global.qml";
    }
}

ResourceNameCoupling::ResourceNameCoupling()
{

}
