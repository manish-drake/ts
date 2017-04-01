#include "qtestparams.h"


QTestParams::QTestParams(QString data, int row, int col, int rowSpan, int colSpan, QObject *parent):
    QObject(parent),
    m_data{data},
    m_row{row},
    m_col{col},
    m_rowSpan{rowSpan},
    m_colSpan{colSpan}
{

}

QString QTestParams::data() const
{
    return this->m_data;
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

QTestParams::~QTestParams()
{

}
