#include "testparam.h"

TestParam::TestParam(const QString &name,
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
                     const int rowSpan,
                     const int colSpan,
                     const QString &style):
    m_id{0},
    m_name{name},
    m_summaryId{summaryId},
    m_key{key},
    m_val1{val1},
    m_unit1{unit1},
    m_val2{val2},
    m_unit2{unit2},
    m_val3{val3},
    m_unit3{unit3},
    m_row{row},
    m_col{col},
    m_rowSpan{rowSpan},
    m_colSpan{colSpan},
    m_style{style}
{

}

int TestParam::id() const
{
    return m_id;
}

void TestParam::setId(const int id)
{
    m_id = id;
}

QString TestParam::name() const
{
    return m_name;
}

void TestParam::setName(const QString &name)
{
    m_name = name;
}

int TestParam::summaryId() const
{
    return m_summaryId;
}

void TestParam::setSummaryId(int summaryId)
{
    m_summaryId = summaryId;
}

QString TestParam::key() const
{
    return m_key;
}

void TestParam::setKey(const QString &key)
{
    m_key = key;
}

QString TestParam::val1() const
{
    return m_val1;
}

void TestParam::setVal1(const QString &val1)
{
    m_val1 = val1;
}

QString TestParam::val2() const
{
    return m_val2;
}

void TestParam::setVal2(const QString &val2)
{
    m_val2 = val2;
}

QString TestParam::val3() const
{
    return m_val3;
}

void TestParam::setVal3(const QString &val3)
{
    m_val3 = val3;
}

QString TestParam::unit1() const
{
    return m_unit1;
}

void TestParam::setUnit1(const QString &unit1)
{
    m_unit1 = unit1;
}

QString TestParam::unit2() const
{
    return m_unit2;
}

void TestParam::setUnit2(const QString &unit2)
{
    m_unit2 = unit2;
}

QString TestParam::unit3() const
{
    return m_unit3;
}

void TestParam::setUnit3(const QString &unit3)
{
    m_unit3 = unit3;
}

int TestParam::row() const
{
    return  this->m_row;
}

void TestParam::setRow(const int row)
{
    this->m_row = row;
}

int TestParam::col() const
{
    return this->m_col;
}

void TestParam::setCol(const int col)
{
    this->m_col = col;
}

int TestParam::rowSpan() const
{
    return  this->m_rowSpan;
}

void TestParam::setRowSpan(const int rowSpan)
{
    this->m_rowSpan = rowSpan;
}

int TestParam::colSpan() const
{
    return this->m_colSpan;
}

void TestParam::setColSpan(const int colSpan)
{
    this->m_colSpan = colSpan;
}

QString TestParam::style() const
{
    return this->m_style;
}

void TestParam::setStyle(const QString &style)
{
    this->m_style = style;
}

