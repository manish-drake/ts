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

    if(!m_database.tables().contains("aviationDtf")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE aviationDtf "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "snapshotId INTEGER,"
                    "range TEXT,"
                    "velocity TEXT,"
                    "cableType TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void AviationDtfDao::addAviationDtf(AviationDtf &aviationDtf) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO  aviationDtf"
                "(snapshotId, range, velocity, cableType) "
                "VALUES (:snapshotId, :range, :velocity, :cableType)");
    query.prepare(strQuery);
    query.bindValue(":snapshotId", aviationDtf.snapshotId());
    query.bindValue(":range", aviationDtf.range());
    query.bindValue(":velocity", aviationDtf.velocity());
    query.bindValue(":cableType", aviationDtf.cableType());
    query.exec();
    aviationDtf.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void AviationDtfDao::removeAviationDtf(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM aviationDtf WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<AviationDtf>>> AviationDtfDao:: aviationDtf(const int snapshotId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM aviationDtf "
                "WHERE aviationDtf.snapshotId = %1"
            ).arg(snapshotId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<AviationDtf>>> list(new vector<unique_ptr<AviationDtf>>());

    while (query.next()) {
        unique_ptr<AviationDtf> aviationDtf(
                    new AviationDtf(query.value("snapshotId").toInt(),
                                    query.value("range").toString(),
                                    query.value("velocity").toString(),
                                    query.value("cableType").toString()));
        aviationDtf->setId(query.value("ID").toInt());

        list->push_back(move(aviationDtf));
    }
    return list;
}



AviationDtfDao::~AviationDtfDao()
{

}
