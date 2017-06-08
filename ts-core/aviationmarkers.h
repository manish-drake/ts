#ifndef AVIATIONMARKERS_H
#define AVIATIONMARKERS_H

#include "ts-core_global.h"
#include <QString>

class TSCORESHARED_EXPORT AviationMarkers
{
public:
    int id() const;
    void setId(const int id);

    int snapshotId() const;
    void setSnapshotId(const int snapshotId);

    double position() const;
    void setPostion(const double position);

    QString name() const;
    void setName(const QString &name);

    AviationMarkers(const int snapshotId, const double position, const QString &name);
    AviationMarkers() = default;
    ~AviationMarkers();

private:
    int m_id = 0;
    int m_snapshotId = 0;
    double m_position;
    QString m_name;
};

#endif // AVIATIONMARKERS_H
