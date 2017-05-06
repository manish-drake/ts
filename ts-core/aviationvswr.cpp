#include "aviationvswr.h"

int AviationVswr::id() const
{
    return this->m_id;
}

void AviationVswr::setId(const int id)
{
    this->m_id = id;
}

int AviationVswr::snapshotId() const
{
    return this->m_snapshotId;
}

void AviationVswr::setSnapshotId(const int snapshotId)
{
    this->m_snapshotId = snapshotId;
}

QString AviationVswr::range() const
{
    return this->m_range;
}

void AviationVswr::setRange(const QString range)
{
    this->m_range = range;
}

QString AviationVswr::bandRange() const
{
    return this->m_bandRange;
}

void AviationVswr::setBandRange(const QString bandRange)
{
    this->m_bandRange = bandRange;
}

QString AviationVswr::bandName() const
{
    return this->m_bandName;
}

void AviationVswr::setBandName(const QString bandName)
{
    this->m_bandName = bandName;
}

AviationVswr::AviationVswr(const int snapshotId, const QString range, const QString bandRange, const QString bandName):
    m_id {0},
    m_snapshotId{snapshotId},
    m_range{range},
    m_bandRange{bandRange},
    m_bandName{bandName}
{

}

AviationVswr::~AviationVswr()
{

}
