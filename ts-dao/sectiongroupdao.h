#ifndef SECTIONGROUPDAO_H
#define SECTIONGROUPDAO_H

#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class SectionGroup;
class QSqlDatabase;
class QSqlQuery;

class TSDAOSHARED_EXPORT SectionGroupDao: public Dao
{
public:
    SectionGroupDao(QSqlDatabase &database);
    void init() const;

    void addSectionGroup(SectionGroup &sectionGroup) const;
    void removeSectionGroup(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<SectionGroup> > > sectionGroups() const;
    
    ~SectionGroupDao();
private:
    int getIntOrDefault(const QSqlQuery &query, const QString &col, const int defaultVal) const ;
};
#endif // SECTIONGROUPDAO_H
