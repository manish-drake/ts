#ifndef SECTION_H
#define SECTION_H

#include "ts-core_global.h"
#include <QString>
#include <memory>
#include <vector>

class SectionParam;
using up_vec_up_sec = std::unique_ptr<std::vector<std::unique_ptr<SectionParam> > >;

class TSCORESHARED_EXPORT Section
{

public:
    int id() const;
    void setId(int id);

    QString sectionGroup() const;
    void setSectionGroup(const QString &sectionGroup);

    const up_vec_up_sec &sectionParams() const;
    void setSectionParams(up_vec_up_sec &sectionParams);

    explicit Section(const QString &sectionGroup = "");
    Section() = default;
    ~Section();
private:
    int m_id = 0;
    QString m_sectionGroup;
    up_vec_up_sec m_sectionParams;
};

#endif // SECTION_H
