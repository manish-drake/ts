#ifndef NAVIGATION_H
#define NAVIGATION_H

#include "ts-core_global.h"

class TSCORESHARED_EXPORT Navigation
{
public:
    int id() const;
    void setId(const int id);

    virtual QString link() const = 0;

    int linkId() const;
    void setLinkId(const int id);

    int fromViewId() const;
    void setFromViewId(const int id);

    int toViewId() const;
    void setToViewId(const int id);

    Navigation(const int linkId, const int fromViewId, const int toViewId);

private:
    int m_id;
    int m_linkId;
    int m_fromViewId;
    int m_toViewId;
};

#endif // NAVIGATION_H
