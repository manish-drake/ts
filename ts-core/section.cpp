#include "section.h"
#include "sectionparam.h"


int Section::id() const
{
    return this->m_id;
}

void Section::setId(int id)
{
    this->m_id = id;
}

QString Section::sectionGroup() const
{
    return this->m_sectionGroup;
}

void Section::setSectionGroup(const QString &sectionGroup)
{
    this->m_sectionGroup = sectionGroup;
}



const up_vec_up_sec &Section::sectionParams() const
{
    return this->m_sectionParams;
}

void Section::setSectionParams(up_vec_up_sec &sectionParams)
{
    this->m_sectionParams = std::move(sectionParams);
}

Section::Section(const QString &sectionGroup):
    m_id{0},
    m_sectionGroup{sectionGroup}
{
}

Section::~Section()
{

}
