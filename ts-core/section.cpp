#include "section.h"


int Section::id() const
{
    return this->m_id;
}

void Section::setId(int id)
{
    this->m_id = id;
}

QString Section::name() const
{
    return this->m_name;
}

void Section::setName(const QString &name)
{
    this->m_name = name;
}

int Section::sectionGroupId() const
{
    return this->m_sectionGroupId;
}

void Section::setSectionGroupId(const int &sectionGroupId)
{
    this->m_sectionGroupId = sectionGroupId;
}

Section::Section(const QString &name, const int sectionGroupId):
    m_id{0},
    m_name{name},
    m_sectionGroupId{sectionGroupId}
{
}

Section::~Section()
{

}
