#ifndef TEST_H
#define TEST_H

#include <QString>
#include "ts-core_global.h"


class TSCORESHARED_EXPORT Test
{
public:
    int id() const;
    void setId(const int id);

    QString name() const;
    void setName(const QString &name);

    int sectionId() const;
    void setSectionId(int id);

    int isFavourite() const;
    void setIsFavourite(int isFavourite);

    Test(const QString &name, const int sectionId, const int isFavourite);
    Test() = default;
private:
    int m_id = 0;
    QString m_name;
    int m_sectionId = 0;
    int m_isFavourite = 0;
};

#endif // TEST_H
