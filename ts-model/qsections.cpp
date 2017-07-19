#include "qsections.h"

QSections::QSections(const QString &name,int id, QObject *parent):
    QObject(parent),
    m_name{name},
    m_id{id}
{

}

QString QSections::name() const
{
    return this->m_name;
}

int QSections::id() const
{
    return this->m_id;
}

QSections::~QSections()
{

}
