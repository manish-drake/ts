#ifndef AVIATIONSNAPSHOTDAO_H
#define AVIATIONSNAPSHOTDAO_H


#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class Snapshot;
class QSqlDatabase;
class QSqlQuery;

class TSDAOSHARED_EXPORT SnapshotDao: public Dao
{
public:
    SnapshotDao(QSqlDatabase &database);
    void init() const;

    void addSnapshot(Snapshot &snapshotDao) const;
    void removeSnapshot(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<Snapshot> > > snapshots() const;

    ~SnapshotDao();
private:
    int getIntOrDefault(const QSqlQuery &query, const QString &col, const int defaultVal) const ;
};
#endif // AVIATIONSNAPSHOTDAO_H
