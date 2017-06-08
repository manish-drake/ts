#ifndef SNAPSHOT_H
#define SNAPSHOT_H

#include "ts-core_global.h"
#include <QString>
#include <QDateTime>

class TSCORESHARED_EXPORT Snapshot
{
public:
    int id() const;
    void setId(const int id);

    QDateTime dtSnapshot() const;
    void setDtSnapshot(const QDateTime &dtSnapshot);

    QString user() const;
    void setUser(const QString &user);

    QString data() const;
    void setData(const QString &data);

    QList<int> getDataList();

    Snapshot(const QDateTime &dtSnapshot, const QString &user, const QString &data);
    Snapshot() = default;
    ~Snapshot();

private:
    int m_id = 0;
    QDateTime m_dtSnapshot;
    QString m_user;
    QString m_data;
};

#endif // AVIATIONSNAPSHOT_H
