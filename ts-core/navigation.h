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

    ~Navigation();

private:
    int m_id;
    int m_viewId;
    QString m_link;
    int m_linkId;
    int m_targetViewId;
};

#endif // NAVIGATION_H
