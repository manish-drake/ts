#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "dao.h"
#include "datamanager.h"

Dao::Dao(QSqlDatabase &database)
    :m_database(database)
{

}


