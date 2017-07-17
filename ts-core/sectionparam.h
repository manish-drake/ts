#ifndef SECTIONPARAM_H
#define SECTIONPARAM_H

#include "ts-core_global.h"
#include <QString>

class TSCORESHARED_EXPORT SectionParam
{

public:
    int id() const;
    void setId(int id);

    QString name() const;
    void setName(const QString &name);

    int sectionGroupId() const;
    void setSectionGroupId(const int &sectionGroupId);

    explicit SectionParam(const QString &name = "", const int sectionGroupId = 0);
    SectionParam() = default;
    ~SectionParam();
private:
    int m_id = 0;
    QString m_name;
    int m_sectionGroupId = 0;
};

#endif // SECTIONPARAM_H
