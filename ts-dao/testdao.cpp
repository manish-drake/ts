#include "testdao.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "test.h"
#include "datamanager.h"

using namespace std;

TestDao::TestDao(QSqlDatabase &database):
    Dao(database)
{

}

void TestDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("tests")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE tests "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "name TEXT,"
                    "sectionID INTEGER)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void TestDao::addTest(Test &test) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO tests "
                "(name, sectionID) "
                "VALUES (:name, :sectionID)");
    query.prepare(strQuery);
    query.bindValue(":name", test.name());
    query.bindValue(":sectionID", test.sectionId());
    query.exec();
    test.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void TestDao::removeTest(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM tests WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<Test>>> TestDao::tests() const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "SELECT * FROM tests ");

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Test>>> list(new vector<unique_ptr<Test>>());

    while (query.next()) {
        unique_ptr<Test> test(
                    new Test(query.value("name").toString(),
                             query.value("sectionID").toInt()));
        test->setId(query.value("ID").toInt());
        list->push_back(move(test));
    }
    return list;
}

TestDao::~TestDao()
{

}
