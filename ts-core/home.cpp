#include "home.h"

Home::Home(const QString &name, const int sectionId):
    m_id{0},
    m_name{name},
    m_sectionId{sectionId}
{

}

int Home::id() const
{
    return m_id;
}

void Home::setId(const int id)
{
    m_id = id;
}

QString Home::name() const
{
    return m_name;
}

void Home::setName(const QString &name)
{
    m_name = name;
}

int Home::sectionId() const
{
    return m_sectionId;
}

void Home::setSectionId(int sectionId)
{
    m_sectionId = sectionId;
}
