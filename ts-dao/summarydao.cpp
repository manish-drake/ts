#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "summarydao.h"
#include "datamanager.h"
#include "summary.h"
#include "testparam.h"
using UP_TP = std::unique_ptr<TestParam>;
using VEC_UP_TP = std::vector<UP_TP>;
using UP_VEC_UP_TP = std::unique_ptr<VEC_UP_TP>;

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
                    "col INTEGER,"
                    "colSpan INTEGER,"
                    "style TEXT)");
        query.exec(strQuery);
        DataManager::debugQuery(query);
    }
}

void SummaryDao::addSummary(Summary &summary) const
{
    QSqlQuery query(m_database);
    const QString strQuery(
                "INSERT INTO summaries "
                "(name, testID, pageIdx, ordr, col, colSpan, style) "
                "VALUES (:name, :testID, :pageIdx, :ordr, :col, :colSpan, :style)");
    query.prepare(strQuery);
    query.bindValue(":name", summary.name());
    query.bindValue(":testID", summary.testId());
    query.bindValue(":pageIdx", summary.index());
    query.bindValue(":ordr", summary.order());
    query.bindValue(":col", summary.col());
    query.bindValue(":colSpan", summary.colSpan());
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
                "SELECT summaries.ID as sID, summaries.name as sName, "
                "summaries.testID, summaries.pageIdx, "
                "summaries.ordr, summaries.col as sCol, "
                "summaries.colSpan as sColSpan, summaries.style as sStyle, "
                "testparams.ID as tID, testparams.name as tName, "
                "testparams.summaryID, testparams.key, "
                "testparams.val1, testparams.unit1, testparams.val2, "
                "testparams.unit2,testparams.val3, testparams.unit3, "
                "testparams.row, testparams.col as tCol, "
                "testparams.rowSpan, testparams.colSpan as tColSpan, "
                "testparams.style as tStyle "
                "FROM summaries "
                "INNER JOIN testparams "
                "ON summaries.ID = testparams.summaryID "
                "WHERE summaries.testID = %1 "
                "AND summaries.pageIdx = %2 "
                "ORDER BY summaryID")
            .arg(testId)
            .arg(index);

    query.exec(strQuery);
    DataManager::debugQuery(query);

    unique_ptr<vector<unique_ptr<Summary>>> list(new vector<unique_ptr<Summary>>());

    int temp_id = 0;
    std::map<int, UP_VEC_UP_TP> summaryTestParams;
    while (query.next()) {
        int inLoop_id = query.value("sID").toInt();

        if(temp_id != inLoop_id) {
            temp_id = inLoop_id;
            summaryTestParams.insert(std::pair<int, UP_VEC_UP_TP>(inLoop_id,UP_VEC_UP_TP(new VEC_UP_TP())));

            unique_ptr<Summary> summary(
                        new Summary(query.value("sName").toString(),
                                    query.value("testID").toInt(),
                                    query.value("pageIdx").toInt(),
                                    query.value("ordr").toInt(),
                                    query.value("sCol").toInt(),
                                    query.value("sColSpan").toInt(),
                                    query.value("sStyle").toInt()));
            summary->setId(query.value("sID").toInt());

            list->push_back(move(summary));
        }

        UP_TP testParam(
                    new TestParam{
                        query.value("tName").toString(),
                        inLoop_id,
                        query.value("key").toString(),
                        query.value("val1").toString(),
                        query.value("unit1").toString(),
                        query.value("val2").toString(),
                        query.value("unit2").toString(),
                        query.value("val3").toString(),
                        query.value("unit3").toString(),
                        query.value("row").toInt(),
                        query.value("tCol").toInt(),
                        query.value("rowSpan").toInt(),
                        query.value("tColSpan").toInt(),
                        query.value("tStyle").toString()
                    });

        testParam->setId(query.value("tID").toInt());
        summaryTestParams[inLoop_id]->push_back(std::move(testParam));
    }
    for(auto &up_sum: *list){
        up_sum->setTestParams(summaryTestParams[up_sum->id()]);
    }
    return list;
}

SummaryDao::~SummaryDao()
{

}
