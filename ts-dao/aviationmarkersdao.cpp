#include "aviationmarkers.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "aviationmarkersdao.h"
#include "datamanager.h"

using namespace std;

AviationMarkersDao::AviationMarkersDao(QSqlDatabase &database):
    Dao(database)
{

}

void AviationMarkersDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("aviation_Markers")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE aviation_Markers "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "Snapshot_Id INTEGER,"
                    "Position TEXT,"
                    "Name TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void AviationMarkersDao::addAviationMarkers(AviationMarkers &aviationMarkers) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO aviation_Markers "
                "(Snapshot_Id, Position, Name) "
                "VALUES (:Snapshot_Id, :Position, :Name)");
    query.prepare(strQuery);
    query.bindValue(":Snapshot_Id", aviationMarkers.snapshotId());
    query.bindValue(":Position", aviationMarkers.position());
    query.bindValue(":Name", aviationMarkers.name());
    query.exec();
    aviationMarkers.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void AviationMarkersDao::removeAviationMarkers(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM aviation_Markers WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<AviationMarkers>>> AviationMarkersDao:: aviationMarkers(const int snapshotId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM aviation_Markers "
                "WHERE aviation_Markers.Snapshot_Id = %1"
            ).arg(snapshotId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<AviationMarkers>>> list(new vector<unique_ptr<AviationMarkers>>());

    while (query.next()) {
        unique_ptr<AviationMarkers> aviationMarkers(
                    new AviationMarkers(query.value("Snapshot_Id").toInt(),
                                        query.value("Position").toDouble(),
                                        query.value("Name").toString()));
        aviationMarkers->setId(query.value("ID").toInt());

        list->push_back(move(aviationMarkers));
    }
    return list;
}



AviationMarkersDao::~AviationMarkersDao()
{

}
