#include "sectiongroupdao.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "sectiongroup.h"
#include "datamanager.h"
#include "section.h"

using UP_SEC = std::unique_ptr<Section>;
using VEC_UP_SEC = std::vector<UP_SEC>;
using UP_VEC_UP_SEC = std::unique_ptr<VEC_UP_SEC>;

using namespace std;

SectionGroupDao::SectionGroupDao(QSqlDatabase &database):
    Dao(database)
{

}

void SectionGroupDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("sectiongroups")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE sectiongroups "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "name TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void SectionGroupDao::addSectionGroup(SectionGroup &sectionGroup) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO sectiongroups "
                "(name) "
                "VALUES (:name)");
    query.prepare(strQuery);
    query.bindValue(":name", sectionGroup.name());
    query.exec();
    sectionGroup.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void SectionGroupDao::removeSectionGroup(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM sectiongroups WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

int SectionGroupDao::getIntOrDefault(const QSqlQuery &query, const QString &col, const int defaultVal) const
{
    if(query.isNull(col)){
        return defaultVal;
    } else {
        return query.value("ID").toInt();
    }
}

unique_ptr<vector<unique_ptr<SectionGroup>>> SectionGroupDao::sectionGroups() const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT sectiongroups.ID as sgID, sectiongroups.name as sgName, "
                "sections.ID as secID, sections.name as secName, "
                "sections.sectionGroupID "
                "FROM sectiongroups INNER JOIN sections "
                "ON sectiongroups.ID = sections.sectionGroupID "
                );

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<SectionGroup>>> list(new vector<unique_ptr<SectionGroup>>());

    int temp_id = 0;
    std::map<int, UP_VEC_UP_SEC> grpSections;
    while (query.next()) {
        int inLoop_id = query.value("sgID").toInt();

        if(temp_id != inLoop_id) {
            temp_id = inLoop_id;
            grpSections.insert(std::pair<int, UP_VEC_UP_SEC>(inLoop_id,UP_VEC_UP_SEC(new VEC_UP_SEC())));

            unique_ptr<SectionGroup> sectiongrp(
                    new SectionGroup(query.value("sgName").toString()));
        sectiongrp->setId(query.value("sgID").toInt());

        list->push_back(move(sectiongrp));
    }
        UP_SEC section(
                    new Section{
                        query.value("secName").toString(),
                        inLoop_id
                    });

        section->setId(query.value("secID").toInt());
        grpSections[inLoop_id]->push_back(std::move(section));
    }
    for(auto &up_sec: *list){
        up_sec->setSections(grpSections[up_sec->id()]);
    }
    return list;
}



SectionGroupDao::~SectionGroupDao()
{

}
