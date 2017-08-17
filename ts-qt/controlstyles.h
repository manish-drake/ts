#ifndef CONTROLSTYLES_H
#define CONTROLSTYLES_H

#include <QHash>
#include <QVariant>

class ControlStyles
{
public:
    static ControlStyles instance();
    QHash<const char*, QVariant> getStyleForType(const QString &styleId, const QString &typeName) const;
protected:
    ControlStyles();
private:
    QHash<QString, QHash<QString, QHash<const char*, QVariant>>> m_repository;
    QHash<QString, QHash<const char*, QVariant>> AddStyle_l0();
    QHash<const char*, QVariant> QQuickText_l0();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_l10();
    QHash<const char*, QVariant> QQuickText_l10();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_l20();
    QHash<const char*, QVariant> QQuickText_l20();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_l30();
    QHash<const char*, QVariant> QQuickText_l30();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_l40();
    QHash<const char*, QVariant> QQuickText_l40();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_l50();
    QHash<const char*, QVariant> QQuickText_l50();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_l60();
    QHash<const char*, QVariant> QQuickText_l60();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_l70();
    QHash<const char*, QVariant> QQuickText_l70();


    QHash<QString, QHash<const char*, QVariant>> AddStyle_v10();
    QHash<const char*, QVariant> QQuickText_v10();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v20();
    QHash<const char*, QVariant> QQuickText_v20();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v30();
    QHash<const char*, QVariant> QQuickText_v30();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v40();
    QHash<const char*, QVariant> QQuickText_v40();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v50();
    QHash<const char*, QVariant> QQuickText_v50();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v60();
    QHash<const char*, QVariant> QQuickText_v60();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v60r();
    QHash<const char*, QVariant> QQuickText_v60r();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v70();
    QHash<const char*, QVariant> QQuickText_v70();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v80();
    QHash<const char*, QVariant> QQuickText_v80();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_v90();
    QHash<const char*, QVariant> QQuickText_v90();
//    QHash<QString, QHash<const char*, QVariant>> AddStyle_v100();
//    QHash<const char*, QVariant> QQuickText_v100();

    QHash<QString, QHash<const char*, QVariant>> AddStyle_u10();
    QHash<const char*, QVariant> QQuickText_u10();
    QHash<QString, QHash<const char*, QVariant>> AddStyle_u20();
    QHash<const char*, QVariant> QQuickText_u20();

};

QString &validateTypeName(QString &);
#endif // CONTROLSTYLES_H
