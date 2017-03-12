#include "datamanager.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>




DataManager &DataManager::instance()
{
    static DataManager singelton;
    return singelton;
}

DataManager::~DataManager()
{
    m_database->close();
    delete m_database;
}

DataManager::DataManager(const QString &path)
    :m_database(new QSqlDatabase(QSqlDatabase::addDatabase("QSQLITE")))
{
    m_database->setDatabaseName(path);
    m_database->open();
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
