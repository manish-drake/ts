#ifndef LINK_H
#define LINK_H

#include "ts-core_global.h"

class TSCORESHARED_EXPORT Link
{
public:
    int targetViewId() const;
    Link(const int targetViewId);
private:
    int m_targetViewId;
};

#endif // LINK_H
