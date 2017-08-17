#include "qtestparams.h"


QTestParams::QTestParams(const QString &key, const QString &value1, const QString &unit1, const QString &value2, const QString &unit2, const QString &value3, const QString &unit3, int row, int col, int rowSpan, int colSpan, const QString &keyStyle, const QString &value1Style, const QString &unit1Style, const QString &value2Style, const QString &unit2Style, const QString &value3Style, const QString &unit3Style, QObject *parent):
    QObject(parent),
    m_key{key},
    m_value1{value1},
    m_unit1{unit1},
    m_value2{value2},
    m_unit2{unit2},
    m_value3{value3},
    m_unit3{unit3},
    m_keyStyle{keyStyle},
    m_value1Style{value1Style},
    m_unit1Style{unit1Style},
    m_value2Style{value2Style},
    m_unit2Style{unit2Style},
    m_value3Style{value3Style},
    m_unit3Style{unit3Style},
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

QString QTestParams::value1() const
{
    return this->m_value1;
}

QString QTestParams::unit1() const
{
    return this->m_unit1;
}

QString QTestParams::value2() const
{
    return this->m_value2;
}

QString QTestParams::unit2() const
{
    return this->m_unit2;
}

QString QTestParams::value3() const
{
    return this->m_value3;
}

QString QTestParams::unit3() const
{
    return this->m_unit3;
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

QString QTestParams::value1Style() const
{
    return m_value1Style;
}

QString QTestParams::unit1Style() const
{
    return m_unit1Style;
}

QString QTestParams::value2Style() const
{
    return m_value2Style;
}

QString QTestParams::unit2Style() const
{
    return m_unit2Style;
}

QString QTestParams::value3Style() const
{
    return m_value3Style;
}

QString QTestParams::unit3Style() const
{
    return m_unit3Style;
}

QTestParams::~QTestParams()
{

}
