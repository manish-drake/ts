#ifndef CONTROLSTYLES_H
#define CONTROLSTYLES_H

#include <QHash>
#include <QVariant>

class ControlStyles
{
public:
    static ControlStyles instance();
    QHash<const char*, QVariant> getStyleForType(const int styleId, const QString typeName);
protected:
    ControlStyles();
private:
    QHash<int, QHash<QString, QHash<const char*, QVariant>>> m_repository;
    QHash<QString, QHash<const char*, QVariant>> AddStyle0();
    QHash<const char*, QVariant> AddStyleText0();
    QHash<QString, QHash<const char*, QVariant>> AddStyle1();
    QHash<const char*, QVariant> AddStyleText1();
};

#endif // CONTROLSTYLES_H
