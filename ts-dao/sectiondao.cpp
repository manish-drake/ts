#include "sectiondao.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "section.h"
#include "datamanager.h"
#include "sectionparam.h"

using UP_SEC = std::unique_ptr<SectionParam>;
using VEC_UP_SEC = std::vector<UP_SEC>;
using UP_VEC_UP_SEC = std::unique_ptr<VEC_UP_SEC>;

using namespace std;

SectionDao::SectionDao(QSqlDatabase &database):
    Dao(database)
{

}

void SectionDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("sections")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE sections "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "sectionGroup TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void SectionDao::addSection(Section &section) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO sections "
                "(sectionGroup) "
                "VALUES (:sectionGroup)");
    query.prepare(strQuery);
    query.bindValue(":sectionGroup", section.sectionGroup());
    query.exec();
    section.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void SectionDao::removeSection(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM sections WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

int SectionDao::getIntOrDefault(const QSqlQuery &query, const QString &col, const int defaultVal) const
{
    if(query.isNull(col)){
        return defaultVal;
    } else {
        return query.value("ID").toInt();
    }
}

unique_ptr<vector<unique_ptr<Section>>> SectionDao::sections() const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT sections.ID as secID, sections.sectionGroup, "
                "sectionparams.ID as spID, sectionparams.name, "
                "sectionparams.sectionGroupID "
                "FROM sections INNER JOIN sectionparams "
                "ON sections.ID = sectionparams.sectionGroupID "
                );

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Section>>> list(new vector<unique_ptr<Section>>());

    int temp_id = 0;
    std::map<int, UP_VEC_UP_SEC> secSectionParams;
    while (query.next()) {
        int inLoop_id = query.value("secID").toInt();

        if(temp_id != inLoop_id) {
            temp_id = inLoop_id;
            secSectionParams.insert(std::pair<int, UP_VEC_UP_SEC>(inLoop_id,UP_VEC_UP_SEC(new VEC_UP_SEC())));

            unique_ptr<Section> section(
                    new Section(query.value("sectionGroup").toString()));
        section->setId(query.value("secID").toInt());

        list->push_back(move(section));
    }
        UP_SEC sectionParam(
                    new SectionParam{
                        query.value("name").toString(),
                        inLoop_id
                    });

        sectionParam->setId(query.value("spID").toInt());
        secSectionParams[inLoop_id]->push_back(std::move(sectionParam));
    }
    for(auto &up_sec: *list){
        up_sec->setSectionParams(secSectionParams[up_sec->id()]);
    }
    return list;
}



SectionDao::~SectionDao()
{

}
