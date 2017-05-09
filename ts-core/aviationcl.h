#ifndef AVIATIONCL_H
#define AVIATIONCL_H

#include "ts-core_global.h"
#include <QString>

class TSCORESHARED_EXPORT AviationCl
{
public:
    int id() const;
    void setId(const int id);

    int snapshotId() const;
    void setSnapshotId(const int snapshotId);

    QString range() const;
    void setRange(const QString range);

    QString bandRange() const;
    void setBandRange(const QString bandRange);

    QString bandName() const;
    void setBandName(const QString bandName);

    AviationCl(const int snapshotId, const QString range, const QString bandRange,const QString bandName);

    ~AviationCl();

private:
    int m_id;
    int m_snapshotId;
    QString m_range;
    QString m_bandRange;
    QString m_bandName;
};

#endif // AVIATIONCL_H