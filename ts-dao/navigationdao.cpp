#include "navigationdao.h"
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
#include "datamanager.h"
#include "navigation.h"
#include "navigationdao.h"

using namespace std;

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
                    "viewID INTEGER,"
                    "link TEXT,"
                    "linkID INTEGER,"
                    "targetViewID INTEGER)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void NavigationDao::addNavigation(Navigation &navigation) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO navigation "
                "(viewID, link, linkID, targetViewID) "
                "VALUES (:viewID, :link, :linkID, :targetViewID)");
    query.prepare(strQuery);
    query.bindValue(":viewID", navigation.viewId());
    query.bindValue(":link", navigation.link());
    query.bindValue(":linkID", navigation.linkId());
    query.bindValue(":targetViewID", navigation.targetViewId());
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

std::unique_ptr<std::vector<std::unique_ptr<Navigation> > >
NavigationDao::navigations(const int currentViewId) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT navigation.* "
                "FROM navigation "
                "WHERE navigation.viewID = %1"
            ).arg(currentViewId);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Navigation>>> list(new vector<unique_ptr<Navigation>>());

    while (query.next()) {
        unique_ptr<Navigation> navigationPtr(
                    new Navigation(query.value("viewID").toInt(),
                                   query.value("link").toString(),
                                   query.value("linkID").toInt(),
                                   query.value("targetViewID").toInt()));
        navigationPtr->setId(query.value("ID").toInt());

        list->push_back(move(navigationPtr));
    }
    return list;
}

std::unique_ptr<std::vector<std::unique_ptr<Navigation> > >
NavigationDao::navigations(const QString currentView) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT navigation.* "
                "FROM navigation "
                "INNER JOIN views "
                "ON navigation.viewID = views.ID "
                "WHERE views.name = '%1' "
                "OR views.name = 'Global'"
            ).arg(currentView);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Navigation>>> list(new vector<unique_ptr<Navigation>>());

    while (query.next()) {
        unique_ptr<Navigation> navigationPtr(
                    new Navigation(query.value("viewID").toInt(),
                                   query.value("link").toString(),
                                   query.value("linkID").toInt(),
                                   query.value("targetViewID").toInt()));
        navigationPtr->setId(query.value("ID").toInt());

        list->push_back(move(navigationPtr));
    }
    return list;
}
NavigationDao::~NavigationDao()
{

}
