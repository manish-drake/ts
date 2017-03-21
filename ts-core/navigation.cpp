#include "navigation.h"

int Navigation::id() const
{
    return this->m_id;
}

void Navigation::setId(const int id)
{
    this->m_id = id;
}

int Navigation::linkId() const
{
    return this->m_linkId;
}

void Navigation::setLinkId(const int id)
{
    this->m_linkId = id;
}

int Navigation::fromViewId() const
{
    return this->m_fromViewId;
}

void Navigation::setFromViewId(const int id)
{
    this->m_fromViewId = id;
}

int Navigation::toViewId() const
{
    return this->m_toViewId;
}

void Navigation::setToViewId(const int id)
{
    this->m_toViewId = id;
}

Navigation::Navigation(const int linkId, const int fromViewId, const int toViewId):
    m_id {0},
    m_linkId{linkId},
    m_fromViewId{fromViewId},
    m_toViewId{toViewId}
{

}
