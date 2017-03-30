#include "resourcenamecoupling.h"

QString ResourceNameCoupling::getPageFromViewId(int viewId){
    switch (viewId) {
    case 3:
        return "ADS-B.qml";
    case 5:
        return "ADSB-Scan.qml";
    case 6 ... 12:
        return "ADSB-Pages.qml";
    case 1:
    default:
        return "Global.qml";
    }
}

ResourceNameCoupling::ResourceNameCoupling()
{

}
