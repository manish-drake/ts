#ifndef SECTION_H
#define SECTION_H

#include "ts-core_global.h"
#include <QString>
#include "link.h"

class TSCORESHARED_EXPORT Section: public Link
{

public:
    int id() const;
    void setId(int id);

    QString name() const;
    void setName(QString name);

    explicit Section(const QString &name = "", const int targetViewId = 1);
    ~Section();
private:
    int m_id;
    QString m_name;
};

#endif // SECTION_H
