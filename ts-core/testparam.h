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

    QString val1() const;
    void setVal1(const QString &val1);

    QString val2() const;
    void setVal2(const QString &val2);

    QString val3() const;
    void setVal3(const QString &val3);

    QString unit1() const;
    void setUnit1(const QString &unit1);

    QString unit2() const;
    void setUnit2(const QString &unit2);

    QString unit3() const;
    void setUnit3(const QString &unit3);

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
              const QString &val1,
              const QString &unit1,
              const QString &val2,
              const QString &unit2,
              const QString &val3,
              const QString &unit3,
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
    QString m_val1;
    QString m_unit1;
    QString m_val2;
    QString m_unit2;
    QString m_val3;
    QString m_unit3;
    int m_row = 0;
    int m_col = 0;
    int m_rowSpan = 1;
    int m_colSpan = 1;
    QString m_style;
};

#endif // TESTPARAM_H
