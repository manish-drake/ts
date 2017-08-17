#include "test.h"

Test::Test(const QString &name, const int sectionId, const int isFavourite):
    m_id{0},
    m_name{name},
    m_sectionId{sectionId},
    m_isFavourite{isFavourite}
{

}

int Test::id() const
{
    return m_id;
}

void Test::setId(const int id)
{
    m_id = id;
}

QString Test::name() const
{
    return m_name;
}

void Test::setName(const QString &name)
{
    m_name = name;
}

int Test::sectionId() const
{
    return m_sectionId;
}

void Test::setSectionId(int sectionId)
{
    m_sectionId = sectionId;
}

int Test::isFavourite() const
{
    return m_isFavourite;
}

void Test::setIsFavourite(int isFavourite)
{
    m_isFavourite = isFavourite;
}


