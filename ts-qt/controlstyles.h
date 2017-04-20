#ifndef CONTROLSTYLES_H
#define CONTROLSTYLES_H

#include <QHash>
#include <QVariant>

class ControlStyles
{
public:
    static ControlStyles instance();
    QHash<const char*, QVariant> getStyleForType(const int &styleId, const QString &typeName);
protected:
    ControlStyles();
private:
    QHash<int, QHash<QString, QHash<const char*, QVariant>>> m_repository;
    QHash<QString, QHash<const char*, QVariant>> AddStyle0();
    QHash<const char*, QVariant> AddStyleText0();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl100();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE100();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl200();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE200();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl300();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE300();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl400();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE400();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl500();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE500();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl600();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE600();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl700();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE700();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl800();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE800();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl900();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE900();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1000();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1000();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1100();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1100();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1200();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1200();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1300();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1300();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1400();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1400();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1500();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1500();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1600();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1600();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1700();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1700();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1800();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1800();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl1900();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE1900();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl2000();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE2000();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl2100();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE2100();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl2200();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE2200();
    QHash<QString, QHash<const char*, QVariant>> AddStyleCompositeControl2300();
    QHash<const char*, QVariant> AddStyleCompositeControl_QMLTYPE2300();
};

QString &validateTypeName(QString &);
#endif // CONTROLSTYLES_H
