#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "dao.h"
#include "datamanager.h"

Dao::Dao(QSqlDatabase &database)
    :m_database(database)
{

}

Dao::~Dao()
{

}

uint Dao::beginExecAsync(const QSqlQuery &query)const
{
//    auto token = QDateTime::currentDateTime().toTime_t();
//    /*m_tokenedQuery =*/ TokenedQuery(token, query);
//    return token;
}

int Dao::endExecAsync(int token) const
{
//    if(m_tokenedQuery.equals(token)){
//         QSqlQuery query(m_database);
//         query.exec(m_tokenedQuery.m_sql);
//         DataManager::debugQuery(query);
//    }
}


