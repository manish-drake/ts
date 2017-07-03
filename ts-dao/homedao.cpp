#include "homedao.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "home.h"
#include "datamanager.h"

using namespace std;

HomeDao::HomeDao(QSqlDatabase &database):
    Dao(database)
{

}

void HomeDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("home")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE home "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "name TEXT,"
                    "sectionID INTEGER)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void HomeDao::addHome(Home &home) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO home "
                "(name, sectionID) "
                "VALUES (:name, :sectionID)");
    query.prepare(strQuery);
    query.bindValue(":name", home.name());
    query.bindValue(":sectionID", home.sectionId());
    query.exec();
    home.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void HomeDao::removeHome(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM home WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<Home>>> HomeDao::homeTests(const int sectionId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * "
                "FROM home "
                "WHERE home.sectionID = %1"
            ).arg(sectionId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Home>>> list(new vector<unique_ptr<Home>>());

    while (query.next()) {
        unique_ptr<Home> home(
                    new Home(query.value("name").toString(),
                             query.value("sectionID").toInt()));
        home->setId(query.value("ID").toInt());
        list->push_back(move(home));
    }
    return list;
}

HomeDao::~HomeDao()
{
}
