#include "datamanager.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QDir>




DataManager &DataManager::instance()
{
    static DataManager singelton;
    return singelton;
}

std::shared_ptr<const SectionDao> DataManager::sectionDao() const
{
    auto daoPtr = this->daoRegistry["section"];
    auto sectionDaoPtr = std::dynamic_pointer_cast<SectionDao>(daoPtr);
    return  sectionDaoPtr;
}

std::shared_ptr<const TestDao> DataManager::testDao() const
{
    auto daoPtr = this->daoRegistry["test"];
    auto testDaoPtr = std::dynamic_pointer_cast<TestDao>(daoPtr);
    return  testDaoPtr;
}

std::shared_ptr<const SummaryDao> DataManager::summaryDao() const
{
    auto daoPtr = this->daoRegistry["summary"];
    auto summaryDaoPtr = std::dynamic_pointer_cast<SummaryDao>(daoPtr);
    return  summaryDaoPtr;
}

std::shared_ptr<const TestParamDao> DataManager::testParamDao() const
{
    auto daoPtr = this->daoRegistry["testparam"];
    auto testParamDaoPtr = std::dynamic_pointer_cast<TestParamDao>(daoPtr);
    return  testParamDaoPtr;
}

std::shared_ptr<const ViewDao> DataManager::viewDao() const
{
    auto daoPtr = this->daoRegistry["view"];
    auto viewDaoPtr = std::dynamic_pointer_cast<ViewDao>(daoPtr);
    return  viewDaoPtr;
}

std::shared_ptr<const NavigationDao> DataManager::navigationDao() const
{
    auto daoPtr = this->daoRegistry["navigation"];
    auto navigationDaoPtr = std::dynamic_pointer_cast<NavigationDao>(daoPtr);
    return  navigationDaoPtr;
}

DataManager::~DataManager()
{
    m_database->close();
}

DataManager::DataManager(const QString &path):
    m_database(new QSqlDatabase(QSqlDatabase::addDatabase("QSQLITE")))
{
    m_database->setDatabaseName(path);

    bool openStatus = m_database->open();
    qDebug() << "Database connection: " << (openStatus ? "OK" : "Error");

    this->createRegistry();

    for(auto key: daoRegistry.keys()){
        auto dao = daoRegistry[key];
        dao->init();
    }
}

void DataManager::createRegistry()
{
    daoRegistry.insert("section",
                       std::shared_ptr<Dao>(new SectionDao(*m_database)));
    daoRegistry.insert("test",
                       std::shared_ptr<Dao>(new TestDao(*m_database)));
    daoRegistry.insert("summary",
                       std::shared_ptr<Dao>(new SummaryDao(*m_database)));
    daoRegistry.insert("testparam",
                       std::shared_ptr<Dao>(new TestParamDao(*m_database)));
    daoRegistry.insert("view",
                       std::shared_ptr<Dao>(new ViewDao(*m_database)));
    daoRegistry.insert("navigation",
                       std::shared_ptr<Dao>(new NavigationDao(*m_database)));
}

void DataManager::debugQuery(const QSqlQuery& query)
{
    if (query.lastError().type() == QSqlError::ErrorType::NoError) {
        qDebug() << "Query OK:"  << query.lastQuery();
    } else {
        qWarning() << "Query KO:" << query.lastError().text();
        qWarning() << "Query text:" << query.lastQuery();
    }
}

void DataManager::deleteExitingDBFile()
{
    QDir dir;
    dir.remove(DB_FILE);
}



