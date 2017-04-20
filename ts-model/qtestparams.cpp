#include "qtestparams.h"


QTestParams::QTestParams(QString key, QString value, QString unit, int row, int col, int rowSpan, int colSpan, int style, QObject *parent):
    QObject(parent),
    m_key{key},
    m_value{value},
    m_unit{unit},
    m_row{row},
    m_col{col},
    m_rowSpan{rowSpan},
    m_colSpan{colSpan},
    m_style{style}
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

int QTestParams::style() const
{
    return this->m_style;
}

QTestParams::~QTestParams()
{

}
