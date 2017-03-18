#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include <QHash>

#include "ts-dao_global.h"
#include "section.h"
#include "sectiondao.h"
#include "testdao.h"
#include "dao.h"

class QSqlDatabase;
class QSqlQuery;

const QString DB_FILE = "c:/git/qt/ts/ts.db";

class TSDAOSHARED_EXPORT DataManager
{
public:
    static void debugQuery(const QSqlQuery& query);
    static void deleteExitingDBFile();
    static DataManager &instance();
    std::shared_ptr<const SectionDao> sectionDao() const;
    std::shared_ptr<const TestDao> testDao() const;
    ~DataManager();

protected:
    DataManager(const QString &path = DB_FILE);
    DataManager &operator = (const DataManager &rhs);
private:
    std::unique_ptr<QSqlDatabase> m_database;
    QHash<QString, std::shared_ptr<Dao>> daoRegistry;
    void createRegistry();
};


#endif // DATAMANAGER_H
