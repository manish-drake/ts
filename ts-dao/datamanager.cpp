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

DataManager::~DataManager()
{
    m_database->close();
}

DataManager::DataManager(const QString &path):
    m_database(new QSqlDatabase(QSqlDatabase::addDatabase("QSQLITE"))),
    sectionDao(*m_database)
{
    m_database->setDatabaseName(path);

    bool openStatus = m_database->open();
    qDebug() << "Database connection: " << (openStatus ? "OK" : "Error");
    sectionDao.init();
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
