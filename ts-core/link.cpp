#include "link.h"

int Link::targetViewId() const
{
    return this->m_targetViewId;
}

Link::Link(const int targetViewId):
    m_targetViewId{targetViewId}
{

}
