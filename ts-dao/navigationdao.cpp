#include "navigationdao.h"
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
#include "datamanager.h"
#include "navigation.h"
#include "navigationdao.h"


void NavigationDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("navigation")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE navigation "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "link TEXT,"
                    "linkID INTEGER,"
                    "fromViewID INTEGER,"
                    "toViewID INTEGER)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void NavigationDao::addNavigation(Navigation &navigation) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO navigation "
                "(link, linkID, fromViewID, toViewID) "
                "VALUES (:link, :linkID, :fromViewID, :toViewID)");
    query.prepare(strQuery);
    query.bindValue(":link", navigation.link());
    query.bindValue(":linkID", navigation.linkId());
    query.bindValue(":fromViewID", navigation.fromViewId());
    query.bindValue(":toViewID", navigation.toViewId());
    query.exec();
    navigation.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void NavigationDao::removeNavigation(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM navigation WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();

    DataManager::debugQuery(query);
}

NavigationDao::NavigationDao(QSqlDatabase &database):
    Dao{database}
{

}

NavigationDao::~NavigationDao()
{

}
