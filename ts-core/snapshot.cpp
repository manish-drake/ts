#include "snapshot.h"
#include <QDebug>

int Snapshot::id() const
{
    return this->m_id;
}

void Snapshot::setId(const int id)
{
    this->m_id = id;
}

QDateTime Snapshot::dtSnapshot() const
{
    return this->m_dtSnapshot;
}

void Snapshot::setDtSnapshot(const QDateTime &dtSnapshot)
{
    this->m_dtSnapshot = dtSnapshot;
}

QString Snapshot::user() const
{
    return this->m_user;
}

void Snapshot::setUser(const QString &user)
{
    this->m_user = user;
}

QString Snapshot::data() const
{
    return this->m_data;
}

void Snapshot::setData(const QString &data)
{
    this->m_data = data;
}

QList<int> Snapshot::getDataList()
{
    QList<int> intList;
    auto stringList = m_data.split(",");
    qDebug() << m_data;
    qDebug() << stringList.length();
    std::transform(stringList.begin(), stringList.end(), std::back_inserter(intList),
                   [](QString s){return s.toInt();});
    return intList;
}

Snapshot::Snapshot(const QDateTime &dtSnapshot, const QString &user, const QString &data):
    m_id {0},
    m_dtSnapshot{dtSnapshot},
    m_user{user},
    m_data{data}
{

}

Snapshot::~Snapshot()
{

}
