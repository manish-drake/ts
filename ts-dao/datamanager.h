#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include <QHash>

#include "ts-dao_global.h"
#include "section.h"
#include "sectiondao.h"
#include "testdao.h"
#include "summarydao.h"
#include "testparamdao.h"
#include "viewdao.h"
#include "navigationdao.h"

#include "snapshotdao.h"
#include "aviationmarkersdao.h"
#include "aviationvswrdao.h"
#include "aviationcldao.h"
#include "aviationdtfdao.h"
#include "loggingdao.h"

#include "dao.h"

class QSqlDatabase;
class QSqlQuery;

const QString DB_FILE = "c:/git/qt/ts/ts.db";

class TSDAOSHARED_EXPORT DataManager
{
public:
    static void debugQuery(const QSqlQuery &query) ;
    static void deleteExitingDBFile();
    static DataManager &instance();
    std::shared_ptr<const SectionDao> sectionDao() const;
    std::shared_ptr<const TestDao> testDao() const;
    std::shared_ptr<const SummaryDao> summaryDao() const;
    std::shared_ptr<const TestParamDao> testParamDao() const;
    std::shared_ptr<const ViewDao> viewDao() const;
    std::shared_ptr<const NavigationDao> navigationDao() const;

    std::shared_ptr<const SnapshotDao> snapshotDao() const;
    std::shared_ptr<const AviationMarkersDao> aviationMarkersDao() const;
    std::shared_ptr<const AviationVswrDao> aviationVswrDao() const;
    std::shared_ptr<const AviationClDao> aviationClDao() const;
    std::shared_ptr<const AviationDtfDao> aviationDtfDao() const;
    std::shared_ptr<const LoggingDao> loggingDao() const;
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
