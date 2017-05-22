#ifndef TESTPARAM_H
#define TESTPARAM_H

#include <QString>
#include "ts-core_global.h"


class TSCORESHARED_EXPORT TestParam
{
public:
    int id() const;
    void setId(const int id);

    QString name() const;
    void setName(const QString &name);

    int summaryId() const;
    void setSummaryId(int id);

    QString key() const;
    void setKey(const QString &key);

    QString val() const;
    void setVal(const QString &val);

    QString unit() const;
    void setUnit(const QString &unit);

    int row() const;
    void setRow(const int row);

    int col() const;
    void setCol(const int col);

    int rowSpan() const;
    void setRowSpan(const int row);

    int colSpan() const;
    void setColSpan(const int col);

    QString style() const;
    void setStyle(const QString &style);



    TestParam(const QString &name,
              const int summaryId,
              const QString &key,
              const QString &val,
              const QString &unit,
              const int row,
              const int col,
              const int rowSpan = 1,
              const int colSpan = 1,
              const QString &style="");
    TestParam() = default;
private:
    int m_id = 0;
    QString m_name;
    int m_summaryId = 0;
    QString m_key;
    QString m_val;
    QString m_unit;
    int m_row = 0;
    int m_col = 0;
    int m_rowSpan = 1;
    int m_colSpan = 1;
    QString m_style;
};

#endif // TESTPARAM_H
