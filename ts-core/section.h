#ifndef SECTION_H
#define SECTION_H

#include "ts-core_global.h"
#include <QString>

class TSCORESHARED_EXPORT Section
{

public:
    int id() const;
    void setId(int id);

    QString name() const;
    void setName(const QString &name);

    int sectionGroupId() const;
    void setSectionGroupId(const int &sectionGroupId);

    explicit Section(const QString &name = "", const int sectionGroupId = 0);
    Section() = default;
    ~Section();
private:
    int m_id = 0;
    QString m_name;
    int m_sectionGroupId = 0;
};

#endif // SECTION_H
