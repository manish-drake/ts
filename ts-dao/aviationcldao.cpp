#include "aviationcl.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "aviationcldao.h"
#include "datamanager.h"

using namespace std;

AviationClDao::AviationClDao(QSqlDatabase &database):
    Dao(database)
{

}

void AviationClDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("aviation_Cable_loss")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE aviation_Cable_loss "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "Snapshot_Id INTEGER,"
                    "Range TEXT,"
                    "Band_Range TEXT,"
                    "Band_Name TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void AviationClDao::addAviationCl(AviationCl &aviationCl) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO  aviation_Cable_loss"
                "(Snapshot_Id, Range, Band_Range, Band_Name) "
                "VALUES (:Snapshot_Id, :Range, :Band_Range, Band_Name)");
    query.prepare(strQuery);
    query.bindValue(":Snapshot_Id", aviationCl.snapshotId());
    query.bindValue(":Range", aviationCl.range());
    query.bindValue(":Band_Range", aviationCl.bandRange());
    query.bindValue(":Band_Name", aviationCl.bandName());
    query.exec();
    aviationCl.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void AviationClDao::removeAviationCl(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM aviation_Cable_loss WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<AviationCl>>> AviationClDao:: aviationCl(const int snapshotId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM aviation_Cable_loss "
                "WHERE aviation_Cable_loss.Snapshot_Id = %1"
            ).arg(snapshotId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<AviationCl>>> list(new vector<unique_ptr<AviationCl>>());

    while (query.next()) {
        unique_ptr<AviationCl> aviationCl(
                    new AviationCl(query.value("Snapshot_Id").toInt(),
                                 query.value("Range").toString(),
                                 query.value("Band_Range").toString(),
                                 query.value("Band_Name").toString()));
        aviationCl->setId(query.value("ID").toInt());

        list->push_back(move(aviationCl));
    }
    return list;
}



AviationClDao::~AviationClDao()
{

}
