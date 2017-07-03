#ifndef HOME_H
#define HOME_H


#include <QString>
#include "ts-core_global.h"


class TSCORESHARED_EXPORT Home
{
public:
    int id() const;
    void setId(const int id);

    QString name() const;
    void setName(const QString &name);

    int sectionId() const;
    void setSectionId(int id);

    Home(const QString &name, const int sectionId);
    Home() = default;
private:
    int m_id = 0;
    QString m_name;
    int m_sectionId = 0;
};


#endif // HOME_H
