#include "qsectionparams.h"

QSectionParams::QSectionParams(const QString &name, QObject *parent):
    QObject(parent),
    m_name{name}
{

}

QString QSectionParams::name() const
{
    return this->m_name;
}

QSectionParams::~QSectionParams()
{

}
