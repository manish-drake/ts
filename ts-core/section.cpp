#include "section.h"


int Section::id() const
{
    return this->m_id;
}

QString Section::name() const
{
    return this->m_name;
}

void Section::setName(const QString &name)
{
    this->m_name = name;
}

void Section::setId(int id)
{
    this->m_id = id;
}

Section::Section(const QString &name):
    m_id{0},
    m_name{name}
{
}

Section::~Section()
{

}
