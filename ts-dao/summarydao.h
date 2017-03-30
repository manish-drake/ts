#ifndef SUMMARYDAO_H
#define SUMMARYDAO_H


#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class Summary;
class QSqlDatabase;

class TSDAOSHARED_EXPORT SummaryDao: public Dao
{
public:
    SummaryDao(QSqlDatabase &database);
    void init() const;

    void addSummary(Summary &summary) const;
    void removeSummary(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<Summary> > > summaries(const int testId, const int index) const;

    ~SummaryDao();
};

#endif // SUMMARYDAO_H
