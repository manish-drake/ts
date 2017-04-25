#include "qtestparams.h"


QTestParams::QTestParams(const QString &key, const QString &value, const QString &unit, int row, int col, int rowSpan, int colSpan, const QString &keyStyle, const QString &valueStyle, const QString &unitStyle, QObject *parent):
    QObject(parent),
    m_key{key},
    m_value{value},
    m_unit{unit},
    m_keyStyle{keyStyle},
    m_valueStyle{valueStyle},
    m_unitStyle{unitStyle},
    m_row{row},
    m_col{col},
    m_rowSpan{rowSpan},
    m_colSpan{colSpan}
{

}

QString QTestParams::key() const
{
    return this->m_key;
}

QString QTestParams::value() const
{
    return this->m_value;
}

QString QTestParams::unit() const
{
    return this->m_unit;
}

int QTestParams::row() const
{
    return this->m_row;
}

int QTestParams::col() const
{
    return this->m_col;
}

int QTestParams::rowSpan() const
{
    return this->m_rowSpan;
}

int QTestParams::colSpan() const
{
    return this->m_colSpan;
}

QString QTestParams::keyStyle() const
{
    return m_keyStyle;
}

QString QTestParams::valueStyle() const
{
    return m_valueStyle;
}

QString QTestParams::unitStyle() const
{
    return m_unitStyle;
}

QTestParams::~QTestParams()
{

}
