#include "navigation.h"

int Navigation::id() const
{
    return this->m_id;
}

void Navigation::setId(const int id)
{
    this->m_id = id;
}

QString Navigation::link() const
{
    return this->m_link;
}

void Navigation::setLink(const QString &link)
{
    this->m_link = link;
}

int Navigation::linkId() const
{
    return this->m_linkId;
}

void Navigation::setLinkId(const int id)
{
    this->m_linkId = id;
}

int Navigation::viewId() const
{
    return this->m_viewId;
}

void Navigation::setFromViewId(const int id)
{
    this->m_viewId = id;
}

int Navigation::targetViewId() const
{
    return this->m_targetViewId;
}

void Navigation::setToViewId(const int id)
{
    this->m_targetViewId = id;
}

Navigation::Navigation(const int viewId, const QString &link, const int linkId, const int targetViewId):
    m_id {0},
    m_viewId{viewId},
    m_link{link},
    m_linkId{linkId},
    m_targetViewId{targetViewId}
{

}

Navigation::~Navigation()
{

}
