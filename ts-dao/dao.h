#ifndef DAO_H
#define DAO_H

#include "ts-dao_global.h"


class QSqlDatabase;

class TSDAOSHARED_EXPORT Dao
{
public:
    Dao(QSqlDatabase &database);
    virtual void init() const = 0;
    virtual ~Dao();
protected:
    QSqlDatabase &m_database;
};

#endif // DAO_H
