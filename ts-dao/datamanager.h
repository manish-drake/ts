#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include "ts-dao_global.h"
#include "section.h"
#include "sectiondao.h"

class QSqlDatabase;
class QSqlQuery;

const QString DB_FILE = "d:/git/ts/ts.db";

class TSDAOSHARED_EXPORT DataManager
{
public:
    static void debugQuery(const QSqlQuery& query);
    static void deleteExitingDBFile();
    static DataManager &instance();

    ~DataManager();

protected:
    DataManager(const QString &path = DB_FILE);
    DataManager &operator = (const DataManager &rhs);
private:
    std::unique_ptr<QSqlDatabase> m_database;
public:
    const SectionDao sectionDao;
};

#endif // DATAMANAGER_H
