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
                    "snapshotId INTEGER,"
                    "Range TEXT,"
                    "bandRange TEXT,"
                    "bandName TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void AviationVswrDao::addAviationVswr(AviationVswr &aviationVswr) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO  aviation_Vswr"
                "(snapshotId, Range, bandRange, bandName) "
                "VALUES (:snapshotId, :Range, :bandRange, bandName)");
    query.prepare(strQuery);
    query.bindValue(":snapshotId", aviationVswr.snapshotId());
    query.bindValue(":Range", aviationVswr.range());
    query.bindValue(":bandRange", aviationVswr.bandRange());
    query.bindValue(":bandName", aviationVswr.bandName());
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
                "WHERE aviation_Vswr.snapshotId = %1"
            ).arg(snapshotId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<AviationVswr>>> list(new vector<unique_ptr<AviationVswr>>());

    while (query.next()) {
        unique_ptr<AviationVswr> aviationVswr(
                    new AviationVswr(query.value("snapshotId").toInt(),
                                 query.value("Range").toString(),
                                 query.value("bandRange").toString(),
                                 query.value("bandName").toString()));
        aviationVswr->setId(query.value("ID").toInt());

        list->push_back(move(aviationVswr));
    }
    return list;
}



AviationVswrDao::~AviationVswrDao()
{

}
