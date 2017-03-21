#include "viewdao.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "view.h"
#include "datamanager.h"

using namespace std;

ViewDao::ViewDao(QSqlDatabase &database):
    Dao(database)
{

}

void ViewDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("views")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE views "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "name TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void ViewDao::addView(View &view) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO views "
                "(name) "
                "VALUES (:name)");
    query.prepare(strQuery);
    query.bindValue(":name", view.name());
    query.exec();
    view.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}


void ViewDao::removeView(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM views WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<View>>> ViewDao::views() const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "SELECT * FROM views ");

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<View>>> list(new vector<unique_ptr<View>>());

    while (query.next()) {
        unique_ptr<View> view(new View(query.value("name").toString()));
        view->setId(query.value("ID").toInt());
        list->push_back(move(view));
    }
    return list;
}

ViewDao::~ViewDao()
{

}
