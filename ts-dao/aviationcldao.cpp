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

    if(!m_database.tables().contains("aviationCableLoss")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE aviationCableLoss "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "snapshotId INTEGER,"
                    "range TEXT,"
                    "bandRange TEXT,"
                    "bandName TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void AviationClDao::addAviationCl(AviationCl &aviationCl) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO  aviationCableLoss"
                "(snapshotId, range, bandRange, bandName) "
                "VALUES (:snapshotId, :range, :bandRange, :bandName)");
    query.prepare(strQuery);
    query.bindValue(":snapshotId", aviationCl.snapshotId());
    query.bindValue(":range", aviationCl.range());
    query.bindValue(":bandRange", aviationCl.bandRange());
    query.bindValue(":bandName", aviationCl.bandName());
    query.exec();
    aviationCl.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void AviationClDao::removeAviationCl(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM aviationCableLoss WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<AviationCl>>> AviationClDao:: aviationCls(const int snapshotId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM aviationCableLoss "
                "WHERE aviationCableLoss.snapshotId = %1"
            ).arg(snapshotId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<AviationCl>>> list(new vector<unique_ptr<AviationCl>>());

    while (query.next()) {
        unique_ptr<AviationCl> aviationCl(
                    new AviationCl(query.value("snapshotId").toInt(),
                                 query.value("range").toString(),
                                 query.value("bandRange").toString(),
                                 query.value("bandName").toString()));
        aviationCl->setId(query.value("ID").toInt());

        list->push_back(move(aviationCl));
    }
    return list;
}



AviationClDao::~AviationClDao()
{

}
