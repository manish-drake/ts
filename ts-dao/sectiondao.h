#ifndef SECTIONDAO_H
#define SECTIONDAO_H

#include <vector>
#include <memory>

class Section;
class QSqlDatabase;


class SectionDao
{
public:
    SectionDao(QSqlDatabase &database);
    void init() const;

    void addSection(Section &section) const;

    std::unique_ptr<std::vector<std::unique_ptr<Section> > > sections() const;
private:
    QSqlDatabase &m_database;
};

#endif // SECTIONDAO_H
