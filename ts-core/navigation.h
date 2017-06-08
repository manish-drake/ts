#ifndef NAVIGATION_H
#define NAVIGATION_H

#include "ts-core_global.h"
#include <QString>

class TSCORESHARED_EXPORT Navigation
{
public:
    int id() const;
    void setId(const int id);

    QString link() const;
    void setLink(const QString &link);

    int linkId() const;
    void setLinkId(const int id);

    int viewId() const;
    void setFromViewId(const int id);

    int targetViewId() const;
    void setToViewId(const int id);

    Navigation(const int viewId, const QString &link, const int linkId, const int targetViewId);
    Navigation() = default;
    ~Navigation();

private:
    int m_id = 0;
    int m_viewId = 0;
    QString m_link;
    int m_linkId = 0;
    int m_targetViewId = 0;
};

#endif // NAVIGATION_H
