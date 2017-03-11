#ifndef SECTION_H
#define SECTION_H

#include "ts-core_global.h"
#include <QString>

class TSCORESHARED_EXPORT Section
{

public:
    int id();
    void setId(int id);

    QString name();
    void setName(QString name);

    Section();
    ~Section();
private:
    int m_id;
    QString m_name;
};

#endif // SECTION_H
