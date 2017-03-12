#include "section.h"


int Section::id()
{
    return this->m_id;
}

QString Section::name()
{
    return this->m_name;
}

void Section::setName(QString name)
{
    this->m_name = name;
}
void Section::setId(int id)
{
    this->m_id = id;
}

Section::Section()
{
}

Section::~Section()
{

}
