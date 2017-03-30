#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "summarydao.h"
#include "datamanager.h"
#include "summary.h"

using namespace std;

SummaryDao::SummaryDao(QSqlDatabase &database):
    Dao(database)
{

}

void SummaryDao::init() const
{
    if(!m_database.isOpen()){
        qDebug() << "Failed to open the database";
        return;
    }

    if(!m_database.tables().contains("summaries")) {
        QSqlQuery query(m_database);
        const QString strQuery(
                    "CREATE TABLE summaries "
                    "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "name TEXT,"
                    "testID INTEGER,"
                    "pageIdx INTEGER,"
                    "ordr INTEGER,"
                    "style INTEGER)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void SummaryDao::addSummary(Summary &summary) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO summaries "
                "(name, testID, pageIdx, ordr, style) "
                "VALUES (:name, :testID, :pageIdx, :ordr, :style)");
    query.prepare(strQuery);
    query.bindValue(":name", summary.name());
    query.bindValue(":testID", summary.testId());
    query.bindValue(":pageIdx", summary.index());
    query.bindValue(":ordr", summary.order());
    query.bindValue(":style", summary.style());
    query.exec();
    summary.setId(query.lastInsertId().toInt());

    DataManager::debugQuery(query);
}

void SummaryDao::removeSummary(int id) const
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM summaries WHERE id = (:id)");
    query.bindValue(":id", id);
    query.exec();
    DataManager::debugQuery(query);
}

unique_ptr<vector<unique_ptr<Summary>>> SummaryDao::summaries(const int testId, const int index) const
{
    QSqlQuery query(m_database);
    const QString strQuery = QString(
                "SELECT * FROM summaries "
                "WHERE summaries.testID = %1 "
                "AND summaries.pageIdx = %2")
            .arg(testId)
            .arg(index);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Summary>>> list(new vector<unique_ptr<Summary>>());

    while (query.next()) {
        unique_ptr<Summary> summary(
                    new Summary(query.value("name").toString(),
                                query.value("testID").toInt(),
                                query.value("pageIdx").toInt(),
                                query.value("ordr").toInt(),
                                query.value("style").toInt()));
        summary->setId(query.value("ID").toInt());
        list->push_back(move(summary));
    }
    return list;
}

SummaryDao::~SummaryDao()
{

}
