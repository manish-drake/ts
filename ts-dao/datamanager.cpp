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



