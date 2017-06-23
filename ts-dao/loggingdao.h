#ifndef LOGGINGDAO_H
#define LOGGINGDAO_H

#include <memory>
#include <vector>
#include "ts-dao_global.h"
#include "dao.h"
#include "logging.h"
class QSqlDatabase;


class TSDAOSHARED_EXPORT LoggingDao : public Dao
{
public:    
    void init() const;

    void addLogging(Logging &logging) const;
    void removeLogging(int id) const;

    LoggingDao(QSqlDatabase &database);

    std::unique_ptr<std::vector<std::unique_ptr<Logging> > > logs() const;

    ~LoggingDao();
};

#endif // LOGGINGDAO_H
