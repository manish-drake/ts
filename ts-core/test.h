#ifndef TEST_H
#define TEST_H

#include <QString>
#include "ts-core_global.h"
#include "link.h"


class TSCORESHARED_EXPORT Test: public Link
{
public:
    int id() const;
    void setId(const int id);

    QString name() const;
    void setName(const QString &name);

    int sectionId() const;
    void setSectionId(int id);

    Test(const QString &name, const int sectionId);
private:
    int m_id;
    QString m_name;
    int m_sectionId;
};

#endif // TEST_H
