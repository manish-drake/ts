#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include "ts-dao_global.h"
#include "section.h"

class QSqlDatabase;
class QSqlQuery;

const QString DB_FILE = "ts.db";

class TSDAOSHARED_EXPORT DataManager
{
public:
    static void debugQuery(const QSqlQuery& query);

    static DataManager &instance();
    ~DataManager();
protected:
    DataManager(const QString &path = DB_FILE);
    DataManager &operator = (const DataManager &rhs);
private:
    QSqlDatabase *m_database;
};

#endif // DATAMANAGER_H
