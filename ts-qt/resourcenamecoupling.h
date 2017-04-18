#ifndef RESOURCENAMECOUPLING_H
#define RESOURCENAMECOUPLING_H
#include <QObject>
#include <QHash>
class ResourceNameCoupling:public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE QString getPageFromViewId(const int &viewId) const;
    static ResourceNameCoupling &instance();
    bool compare(const int &viewId1, const int &viewId2) const;
protected:
    ResourceNameCoupling();
};
#endif // RESOURCENAMECOUPLING_H
