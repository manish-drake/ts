#include "aviationcl.h"

int AviationCl::id() const
{
    return this->m_id;
}

void AviationCl::setId(const int id)
{
    this->m_id = id;
}

int AviationCl::snapshotId() const
{
    return this->m_snapshotId;
}

void AviationCl::setSnapshotId(const int snapshotId)
{
    this->m_snapshotId = snapshotId;
}

QString AviationCl::range() const
{
    return this->m_range;
}

void AviationCl::setRange(const QString &range)
{
    this->m_range = range;
}

QString AviationCl::bandRange() const
{
    return this->m_bandRange;
}

void AviationCl::setBandRange(const QString &bandRange)
{
    this->m_bandRange = bandRange;
}

QString AviationCl::bandName() const
{
    return this->m_bandName;
}

void AviationCl::setBandName(const QString &bandName)
{
    this->m_bandName = bandName;
}

AviationCl::AviationCl(const int snapshotId, const QString &range, const QString &bandRange, const QString &bandName):
    m_id {0},
    m_snapshotId{snapshotId},
    m_range{range},
    m_bandRange{bandRange},
    m_bandName{bandName}
{

}

AviationCl::~AviationCl()
{

}
