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

    if(!m_database.tables().contains("aviationMarkers")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE aviationMarkers "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "snapshotId INTEGER,"
                    "position TEXT,"
                    "name TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void AviationMarkersDao::addAviationMarkers(AviationMarkers &aviationMarkers) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO aviationMarkers "
                "(snapshotId, position, name) "
                "VALUES (:snapshotId, :position, :name)");
    query.prepare(strQuery);
    query.bindValue(":snapshotId", aviationMarkers.snapshotId());
    query.bindValue(":position", aviationMarkers.position());
    query.bindValue(":name", aviationMarkers.name());
    query.exec();
    aviationMarkers.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void AviationMarkersDao::removeAviationMarkers(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM aviationMarkers WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<AviationMarkers>>> AviationMarkersDao:: aviationMarkers(const int snapshotId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM aviationMarkers "
                "WHERE aviationMarkers.snapshotId = %1"
            ).arg(snapshotId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<AviationMarkers>>> list(new vector<unique_ptr<AviationMarkers>>());

    while (query.next()) {
        unique_ptr<AviationMarkers> aviationMarkers(
                    new AviationMarkers(query.value("snapshotId").toInt(),
                                        query.value("position").toDouble(),
                                        query.value("name").toString()));
        aviationMarkers->setId(query.value("ID").toInt());

        list->push_back(move(aviationMarkers));
    }
    return list;
}



AviationMarkersDao::~AviationMarkersDao()
{

}
