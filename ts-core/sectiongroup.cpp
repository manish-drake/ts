#include "sectiongroup.h"
#include "section.h"


int SectionGroup::id() const
{
    return this->m_id;
}

void SectionGroup::setId(int id)
{
    this->m_id = id;
}

QString SectionGroup::name() const
{
    return this->m_name;
}

void SectionGroup::setName(const QString &name)
{
    this->m_name = name;
}

const up_vec_up_sec &SectionGroup::sections() const
{
    return this->m_sections;
}

void SectionGroup::setSections(up_vec_up_sec &sections)
{
    this->m_sections = std::move(sections);
}

SectionGroup::SectionGroup(const QString &name):
    m_id{0},
    m_name{name}
{
}

SectionGroup::~SectionGroup()
{

}
