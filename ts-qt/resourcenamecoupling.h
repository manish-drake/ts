#ifndef RESOURCENAMECOUPLING_H
#define RESOURCENAMECOUPLING_H
#include <QObject>
#include <QHash>
class ResourceNameCoupling:public QObject
{
    Q_OBJECT
public:
    ResourceNameCoupling();
    Q_INVOKABLE QString getPageFromViewId(int viewId);
};
#endif // RESOURCENAMECOUPLING_H
