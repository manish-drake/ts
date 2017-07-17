#include "sectionparam.h"


int SectionParam::id() const
{
    return this->m_id;
}

void SectionParam::setId(int id)
{
    this->m_id = id;
}

QString SectionParam::name() const
{
    return this->m_name;
}

void SectionParam::setName(const QString &name)
{
    this->m_name = name;
}

int SectionParam::sectionGroupId() const
{
    return this->m_sectionGroupId;
}

void SectionParam::setSectionGroupId(const int &sectionGroupId)
{
    this->m_sectionGroupId = sectionGroupId;
}

SectionParam::SectionParam(const QString &name, const int sectionGroupId):
    m_id{0},
    m_name{name},
    m_sectionGroupId{sectionGroupId}
{
}

SectionParam::~SectionParam()
{

}
