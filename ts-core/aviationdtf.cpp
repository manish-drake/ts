#include "aviationdtf.h"

int AviationDtf::id() const
{
    return this->m_id;
}

void AviationDtf::setId(const int id)
{
    this->m_id = id;
}

int AviationDtf::snapshotId() const
{
    return this->m_snapshotId;
}

void AviationDtf::setSnapshotId(const int snapshotId)
{
    this->m_snapshotId = snapshotId;
}

QString AviationDtf::range() const
{
    return this->m_range;
}

void AviationDtf::setRange(const QString &range)
{
    this->m_range = range;
}

QString AviationDtf::velocity() const
{
    return this->m_velocity;
}

void AviationDtf::setVelocity(const QString &velocity)
{
    this->m_velocity = velocity;
}

QString AviationDtf::cableType() const
{
    return this->m_cableType;
}

void AviationDtf::setCableType(const QString &cableType)
{
    this->m_cableType = cableType;
}

AviationDtf::AviationDtf(const int snapshotId, const QString &range, const QString &velocity, const QString &cableType):
    m_id {0},
    m_snapshotId{snapshotId},
    m_range{range},
    m_velocity{velocity},
    m_cableType{cableType}
{

}

AviationDtf::~AviationDtf()
{

}
