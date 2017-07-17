#ifndef SECTIONPARAMDAO_H
#define SECTIONPARAMDAO_H



#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class SectionParam;
class QSqlDatabase;
class QSqlQuery;

class TSDAOSHARED_EXPORT SectionParamDao: public Dao
{
public:
    SectionParamDao(QSqlDatabase &database);
    void init() const;

    void addSectionParam(SectionParam &sectionParam) const;
    void removeSectionParam(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<SectionParam> > > sectionParams() const;

    ~SectionParamDao();
private:
    int getIntOrDefault(const QSqlQuery &query, const QString &col, const int defaultVal) const ;
};

#endif // SECTIONPARAMDAO_H
