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
        case 2:
            return "ADS-B";
        case 4:
            return "ADSB-Scan";
        case 1:
        default:
            return "Global";
            break;
        }
    }
};

#endif // RESOURCENAMECOUPLING_H
