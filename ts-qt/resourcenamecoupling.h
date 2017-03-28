#ifndef RESOURCENAMECOUPLING_H
#define RESOURCENAMECOUPLING_H
#include <QObject>
#include <QHash>
class ResourceNameCoupling:public QObject
{
    Q_OBJECT
public:
    ResourceNameCoupling();
    QString getPageFromView(QString viewName);
private:
    QHash<QString, QString> resourceRegistry;
};

#endif // RESOURCENAMECOUPLING_H
