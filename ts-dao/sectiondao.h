#ifndef SECTIONDAO_H
#define SECTIONDAO_H

#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class Section;
class QSqlDatabase;
class QSqlQuery;

class TSDAOSHARED_EXPORT SectionDao: public Dao
{
public:
    SectionDao(QSqlDatabase &database);
    void init() const;

    void addSection(Section &section) const;
    void removeSection(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<Section> > > sections(const int viewId = 1) const;
    
    ~SectionDao();
private:
    int getIntOrDefault(const QSqlQuery &query, const QString &col, const int defaultVal) const ;
};
#endif // SECTIONDAO_H
