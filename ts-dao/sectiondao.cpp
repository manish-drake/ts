#include "sectiondao.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "section.h"
#include "datamanager.h"

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
                    "name TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void SectionDao::addSection(Section &section) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO sections "
                "(name) "
                "VALUES (:name)");
    query.prepare(strQuery);
    query.bindValue(":name", section.name());
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
                "SELECT * "
                "FROM sections "
            );

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Section>>> list(new vector<unique_ptr<Section>>());

    while (query.next()) {
        unique_ptr<Section> section(
                    new Section(query.value("name").toString()));
        section->setId(query.value("ID").toInt());

        list->push_back(move(section));
    }
    return list;
}



SectionDao::~SectionDao()
{

}
