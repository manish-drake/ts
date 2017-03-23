#ifndef SUMMARY_H
#define SUMMARY_H

#include <QString>
#include "ts-core_global.h"


class TSCORESHARED_EXPORT Summary
{
public:
    int id() const;
    void setId(const int id);

    QString name() const;
    void setName(const QString &name);

    int testId() const;
    void setTestId(int id);

    int index() const;
    void setIndex(const int index);

    int order() const;
    void setOrder(const int order);

    int style() const;
    void setStyle(const int style);

    Summary(const QString &name, const int testId, const int index, const int order, const int style);
private:
    int m_id;
    QString m_name;
    int m_testId;
    int m_index;
    int m_order;
    int m_style;
};

#endif // SUMMARY_H