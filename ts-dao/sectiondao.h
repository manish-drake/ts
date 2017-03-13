#ifndef SECTIONDAO_H
#define SECTIONDAO_H

#include "ts-dao_global.h"
#include <vector>
#include <memory>

class Section;
class QSqlDatabase;


class TSDAOSHARED_EXPORT SectionDao
{
public:
    SectionDao(QSqlDatabase &database);
    void init() const;

    void addSection(Section &section) const;
    void removeSection(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<Section> > > sections() const;
    
    ~SectionDao();
private:
    QSqlDatabase &m_database;
};

#endif // SECTIONDAO_H
