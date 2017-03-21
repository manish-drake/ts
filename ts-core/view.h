#ifndef VIEW_H
#define VIEW_H

#include "ts-core_global.h"
#include <QString>


class TSCORESHARED_EXPORT View
{

public:
    int id() const;
    void setId(int id);

    QString name() const;
    void setName(QString name);

    View(const QString &name);
    ~View();
private:
    int m_id;
    QString m_name;
};

#endif // VIEW_H
