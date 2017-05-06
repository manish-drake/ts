#ifndef AVIATIONDTF_H
#define AVIATIONDTF_H

#include "ts-core_global.h"
#include <QString>

class TSCORESHARED_EXPORT AviationDtf
{
public:
    int id() const;
    void setId(const int id);

    int snapshotId() const;
    void setSnapshotId(const int snapshotId);

    QString range() const;
    void setRange(const QString range);

    QString velocity() const;
    void setVelocity(const QString velocity);

    QString cableType() const;
    void setCableType(const QString cableType);

    AviationDtf(const int snapshotId, const QString range, const QString velocity,const QString cableType);

    ~AviationDtf();

private:
    int m_id;
    int m_snapshotId;
    QString m_range;
    QString m_velocity;
    QString m_cableType;
};

#endif // AVIATIONDTF_H
