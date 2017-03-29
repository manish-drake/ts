#ifndef RESOURCENAMECOUPLING_H
#define RESOURCENAMECOUPLING_H
#include <QObject>
#include <QHash>
class ResourceNameCoupling:public QObject
{
    Q_OBJECT
public:
    ResourceNameCoupling(){};
    Q_INVOKABLE QString getPageFromViewId(int viewId){
        switch (viewId) {
        case 3:
            return "ADS-B.qml";
        case 4:
            return "ADSB-Scan.qml";
        case 1:
        default:
            return "Global.qml";
            break;
        }
    }
};

#endif // RESOURCENAMECOUPLING_H
