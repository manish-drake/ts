#ifndef SECTIONGROUP_H
#define SECTIONGROUP_H

#include "ts-core_global.h"
#include <QString>
#include <memory>
#include <vector>

class Section;
using up_vec_up_sec = std::unique_ptr<std::vector<std::unique_ptr<Section> > >;

class TSCORESHARED_EXPORT SectionGroup
{

public:
    int id() const;
    void setId(int id);

    QString name() const;
    void setName(const QString &name);

    const up_vec_up_sec &sections() const;
    void setSections(up_vec_up_sec &sections);

    explicit SectionGroup(const QString &name = "");
    SectionGroup() = default;
    ~SectionGroup();
private:
    int m_id = 0;
    QString m_name;
    up_vec_up_sec m_sections;
};

#endif // SECTIONGROUP_H
