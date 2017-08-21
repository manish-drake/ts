#ifndef DAO_H
#define DAO_H
#include <QString>
#include <QVariant>
#include "ts-dao_global.h"


class QSqlQuery;
class QSqlDatabase;

class TSDAOSHARED_EXPORT Dao
{
    struct TokenedQuery{
        uint m_token;
        const QString m_sql;
        TokenedQuery(uint token, const QString &sql):
            m_token{token},
            m_sql{sql}
        {
        }
        bool equals(uint other) const {
            return m_token == other;
        }
        TokenedQuery()
        {
        }
        TokenedQuery &operator =(TokenedQuery other) {
            m_token = other.m_token;//std::swap(m_token, other.m_token);
//            std::swap(m_sql, other.m_sql);
            return *this;
        }
    };

public:
    Dao(QSqlDatabase &database);
    virtual void init() const = 0;
    virtual ~Dao();
protected:
    uint beginExecAsync(const QSqlQuery &query) const;
    int endExecAsync(int token) const;
protected:
    QSqlDatabase &m_database;
    TokenedQuery m_tokenedQuery;
};

#endif // DAO_H
