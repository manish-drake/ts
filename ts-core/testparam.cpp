#include "testparam.h"

TestParam::TestParam(const QString &name,
                     const int summaryId,
                     const QString key,
                     const QString val,
                     const QString unit,
                     const int row,
                     const int col,
                     const int style):
    m_id{0},
    m_name{name},
    m_summaryId{summaryId},
    m_key{key},
    m_val{val},
    m_unit{unit},
    m_row{row},
    m_col{col},
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

QString TestParam::val() const
{
    return m_val;
}

void TestParam::setVal(const QString &val)
{
    m_val = val;
}

QString TestParam::unit() const
{
    return m_unit;
}

void TestParam::setUnit(const QString &unit)
{
    m_unit = unit;
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

int TestParam::style() const
{
    return this->m_style;
}

void TestParam::setStyle(const int style)
{
    this->m_style = style;
}

