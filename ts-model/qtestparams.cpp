#include "qtestparams.h"

QTestParams::QTestParams(QObject *parent) //: QObject(parent)
{

}

QString QTestParams::data() const
{
    return this->m_data;
}

void QTestParams::setData(QString data)
{
    this->m_data = data;
//    emit dataChanged(data);
}

QTestParams::~QTestParams()
{

}
