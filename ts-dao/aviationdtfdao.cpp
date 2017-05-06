#include "aviationdtf.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "aviationdtfdao.h"
#include "datamanager.h"

using namespace std;

AviationDtfDao::AviationDtfDao(QSqlDatabase &database):
    Dao(database)
{

}

void AviationDtfDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("aviation_Dtf")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE aviation_Dtf "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "Snapshot_Id INTEGER,"
                    "Range TEXT,"
                    "Velocity TEXT,"
                    "Cable_Type TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void AviationDtfDao::addAviationDtf(AviationDtf &aviationDtf) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO  aviation_Dtf"
                "(Snapshot_Id, Velocity, Cable_Type) "
                "VALUES (:Snapshot_Id, :Velocity, :Cable_Type)");
    query.prepare(strQuery);
    query.bindValue(":Snapshot_Id", aviationDtf.snapshotId());
    query.bindValue(":Range", aviationDtf.range());
    query.bindValue(":Velocity", aviationDtf.velocity());
    query.bindValue(":Cable_Type", aviationDtf.cableType());
    query.exec();
    aviationDtf.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void AviationDtfDao::removeAviationDtf(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM aviation_Dtf WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<AviationDtf>>> AviationDtfDao:: aviationDtf(const int snapshotId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM Aviation_Dtf "
                "WHERE Aviation_Dtf.Snapshot_Id = %1"
            ).arg(snapshotId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<AviationDtf>>> list(new vector<unique_ptr<AviationDtf>>());

    while (query.next()) {
        unique_ptr<AviationDtf> aviationDtf(
                    new AviationDtf(query.value("Snapshot_Id").toInt(),
                                    query.value("Range").toString(),
                                    query.value("Velocity").toString(),
                                    query.value("Cable_Type").toString()));
        aviationDtf->setId(query.value("ID").toInt());

        list->push_back(move(aviationDtf));
    }
    return list;
}



AviationDtfDao::~AviationDtfDao()
{

}
