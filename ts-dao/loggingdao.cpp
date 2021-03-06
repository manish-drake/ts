#include "loggingdao.h"

#include <QDebug>
#include <QSqlQuery>
#include <QVariant>

#include "datamanager.h"


using namespace std;

void LoggingDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("logs")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE logs "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "dtLog DATETIME,"
                    "msgType INTEGER,"
                    "data TEXT,"
                    "file TEXT,"
                    "line INTEGER,"
                    "function TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void LoggingDao::addLogging(Logging &logging) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO  logs"
                "(dtLog, msgType, data, file, line, function) "
                "VALUES (:dtLog, :msgType, :data, :file, :line, :function)");
    query.prepare(strQuery);
    query.bindValue(":dtLog", logging.dtLog());
    query.bindValue(":msgType", logging.msgType());
    query.bindValue(":data", logging.data());
    query.bindValue(":file", logging.file());
    query.bindValue(":line", logging.line());
    query.bindValue(":function", logging.function());
    query.exec();
    logging.setId(query.lastInsertId().toInt());

//    DataManager::debugQuery(query);
}

void LoggingDao::removeLogging(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM logs WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

LoggingDao::LoggingDao(QSqlDatabase &database):
    Dao{database}
{

}

unique_ptr<vector<unique_ptr<Logging>>> LoggingDao:: logs() const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT ID, dtLog, data "
                "FROM logs "
                );

    query.exec(strQuery);
//    DataManager::debugQuery(query);
//    int num = query.size();
    unique_ptr<vector<unique_ptr<Logging>>> list(new vector<unique_ptr<Logging>>());

    while (query.next()) {
        unique_ptr<Logging> logging(
                    new Logging(query.value("dtLog").toDateTime(),
                                /*query.value("msgType").toInt()*/0,
                                query.value("data").toString(),
                                /*query.value("file").toString()*/"",
                                /*query.value("line").toInt()*/0,
                                /*query.value("function").toString()*/""));
        logging->setId(query.value("ID").toInt());

        list->push_back(move(logging));
    }
    return list;
}



LoggingDao::~LoggingDao()
{

}
