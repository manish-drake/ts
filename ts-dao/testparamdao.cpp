#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "testparamdao.h"
#include "datamanager.h"
#include "testparam.h"

using namespace std;

TestParamDao::TestParamDao(QSqlDatabase &database):
    Dao(database)
{

}

void TestParamDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("testparams")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE testparams "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "name TEXT,"
                    "summaryID INTEGER,"
                    "key TEXT,"
                    "val TEXT,"
                    "unit TEXT,"
                    "row INTEGER,"
                    "col INTEGER,"
                    "style INTEGER)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void TestParamDao::addTestParam(TestParam &testParam) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO testparams "
                "(name, summaryID, key, val, unit, row, col, style) "
                "VALUES (:name, :summaryID, :key, :val, :unit, :row, :col, :style)");
    query.prepare(strQuery);
    query.bindValue(":name", testParam.name());
    query.bindValue(":summaryID", testParam.summaryId());
    query.bindValue(":key", testParam.key());
    query.bindValue(":val", testParam.val());
    query.bindValue(":unit", testParam.unit());
    query.bindValue(":row", testParam.row());
    query.bindValue(":col", testParam.col());
    query.bindValue(":style", testParam.style());
    query.exec();
    testParam.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void TestParamDao::removeTestParam(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM testparams WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<TestParam>>> TestParamDao::testParams() const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "SELECT * FROM testparams ");

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<TestParam>>> list(new vector<unique_ptr<TestParam>>());

    while (query.next()) {
        unique_ptr<TestParam> testParam(
                    new TestParam(query.value("name").toString(),
                                  query.value("summaryID").toInt(),
                                  query.value("key").toString(),
                                  query.value("val").toString(),
                                  query.value("unit").toString(),
                                  query.value("row").toInt(),
                                  query.value("col").toInt(),
                                  query.value("style").toInt()));
        testParam->setId(query.value("ID").toInt());
        list->push_back(move(testParam));
    }
    return list;
}

TestParamDao::~TestParamDao()
{

}
