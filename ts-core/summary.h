#ifndef SUMMARY_H
#define SUMMARY_H

#include <QString>
#include "ts-core_global.h"
#include <memory>
#include <vector>

class TestParam;
using up_vec_up_tp = std::unique_ptr<std::vector<std::unique_ptr<TestParam> > >;

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

    const up_vec_up_tp &testParams() const;
    void setTestParams(up_vec_up_tp &testParams);

    Summary(const QString &name, const int testId, const int index, const int order, const int style);
    Summary() = default;
    ~Summary();
private:
    int m_id = 0;
    QString m_name;
    int m_testId = 0;
    int m_index = 0;
    int m_order = 0;
    int m_style = 0;
    up_vec_up_tp m_testParams;
};

#endif // SUMMARY_H
