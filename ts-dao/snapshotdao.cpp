#include "snapshot.h"

#include <QSqldatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "snapshotdao.h"
#include "datamanager.h"

using namespace std;

SnapshotDao::SnapshotDao(QSqlDatabase &database):
    Dao{database}
{

}

void SnapshotDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("snapshots")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE snapshots "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "dtSnapshot DATETIME,"
                    "[user] TEXT,"
                    "[data] TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void SnapshotDao::addSnapshot(Snapshot &snapshot) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO snapshots "
                "(dtSnapshot, [user], [data]) "
                "VALUES (:dtSnapshot, :[user], :[data])");
    query.prepare(strQuery);
    query.bindValue(":dtSnapshot", snapshot.dtSnapshot());
    query.bindValue(":[user]", snapshot.user());
    query.bindValue(":[data]", snapshot.data());
    query.exec();
    snapshot.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void SnapshotDao::removeSnapshot(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM snapshot WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

int SnapshotDao::getIntOrDefault(const QSqlQuery &query, const QString &col, const int defaultVal) const
{
    if(query.isNull(col)){
        return defaultVal;
    } else {
        return query.value("ID").toInt();
    }
}

unique_ptr<vector<unique_ptr<Snapshot>>> SnapshotDao:: snapshots() const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM snapshots "
            );

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Snapshot>>> list(new vector<unique_ptr<Snapshot>>());

    while (query.next()) {
        unique_ptr<Snapshot> snapshot(
                    new Snapshot(query.value("dtSnapshot").toDateTime(),
                                 query.value("[user]").toString(),
                                 query.value("[data]").toString()));
        snapshot->setId(query.value("ID").toInt());

        list->push_back(move(snapshot));
    }
    return list;
}



SnapshotDao::~SnapshotDao()
{

}
