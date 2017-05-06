#include "aviationvswr.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "aviationvswrdao.h"
#include "datamanager.h"

using namespace std;

AviationVswrDao::AviationVswrDao(QSqlDatabase &database):
    Dao(database)
{

}

void AviationVswrDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("aviation_Vswr")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE aviation_Vswr "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "Snapshot_Id INTEGER,"
                    "Range TEXT,"
                    "Band_Range TEXT,"
                    "Band_Name TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void AviationVswrDao::addAviationVswr(AviationVswr &aviationVswr) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO  aviation_Vswr"
                "(Snapshot_Id, Range, Band_Range, Band_Name) "
                "VALUES (:Snapshot_Id, :Range, :Band_Range, Band_Name)");
    query.prepare(strQuery);
    query.bindValue(":Snapshot_Id", aviationVswr.snapshotId());
    query.bindValue(":Range", aviationVswr.range());
    query.bindValue(":Band_Range", aviationVswr.bandRange());
    query.bindValue(":Band_Name", aviationVswr.bandName());
    query.exec();
    aviationVswr.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void AviationVswrDao::removeAviationVswr(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM aviation_Vswr WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<AviationVswr>>> AviationVswrDao:: aviationVswr(const int snapshotId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM aviation_Vswr "
                "WHERE aviation_Vswr.Snapshot_Id = %1"
            ).arg(snapshotId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<AviationVswr>>> list(new vector<unique_ptr<AviationVswr>>());

    while (query.next()) {
        unique_ptr<AviationVswr> aviationVswr(
                    new AviationVswr(query.value("Snapshot_Id").toInt(),
                                 query.value("Range").toString(),
                                 query.value("Band_Range").toString(),
                                 query.value("Band_Name").toString()));
        aviationVswr->setId(query.value("ID").toInt());

        list->push_back(move(aviationVswr));
    }
    return list;
}



AviationVswrDao::~AviationVswrDao()
{

}
