#ifndef SUMMARY_H
#define SUMMARY_H

#include <QString>
#include "ts-core_global.h"
#include <memory>
#include <vector>

class TestParam;


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

    const std::unique_ptr<std::vector<std::unique_ptr<TestParam> > > &testParams() const;
    void setTestParams(std::unique_ptr<std::vector<std::unique_ptr<TestParam> > > &testParams);

    Summary(const QString &name, const int testId, const int index, const int order, const int style);
    ~Summary();
private:
    int m_id;
    QString m_name;
    int m_testId;
    int m_index;
    int m_order;
    int m_style;
    std::unique_ptr<std::vector<std::unique_ptr<TestParam>>> m_testParams;
};

#endif // SUMMARY_H
