#include "sectionparamdao.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "sectionparam.h"
#include "datamanager.h"

using namespace std;

SectionParamDao::SectionParamDao(QSqlDatabase &database):
    Dao(database)
{

}

void SectionParamDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("sectionparams")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE sectionparams "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "name TEXT,"
                    "sectionGroupId INTEGER)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void SectionParamDao::addSectionParam(SectionParam &sectionParam) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO sectionparams "
                "(name, sectionGroupId) "
                "VALUES (:name, :sectionGroupId)");
    query.prepare(strQuery);
    query.bindValue(":name", sectionParam.name());
    query.bindValue(":sectionGroupId", sectionParam.sectionGroupId());
    query.exec();
    sectionParam.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void SectionParamDao::removeSectionParam(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM sectionparams WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

int SectionParamDao::getIntOrDefault(const QSqlQuery &query, const QString &col, const int defaultVal) const
{
    if(query.isNull(col)){
        return defaultVal;
    } else {
        return query.value("ID").toInt();
    }
}

unique_ptr<vector<unique_ptr<SectionParam>>> SectionParamDao::sectionParams() const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * FROM sectionparams "
                "WHERE sectionparams.sectionGroupId = 1");

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<SectionParam>>> list(new vector<unique_ptr<SectionParam>>());

    while (query.next()) {
        unique_ptr<SectionParam> sectionParam(
                    new SectionParam(query.value("name").toString(),
                                     query.value("sectionGroupId").toInt()));
        sectionParam->setId(query.value("ID").toInt());

        list->push_back(move(sectionParam));
    }
    return list;
}



SectionParamDao::~SectionParamDao()
{

}
