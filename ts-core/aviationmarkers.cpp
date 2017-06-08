#include "aviationmarkers.h"

int AviationMarkers::id() const
{
    return this->m_id;
}

void AviationMarkers::setId(const int id)
{
    this->m_id = id;
}

int AviationMarkers::snapshotId() const
{
    return this->m_snapshotId;
}

void AviationMarkers::setSnapshotId(const int snapshotId)
{
    this->m_snapshotId = snapshotId;
}

double AviationMarkers::position() const
{
    return this->m_position;
}

void AviationMarkers::setPostion(const double position)
{
    this->m_position = position;
}

QString AviationMarkers::name() const
{
    return this->m_name;
}

void AviationMarkers::setName(const QString &name)
{
    this->m_name = name;
}

AviationMarkers::AviationMarkers(const int snapshotId, const double position, const QString &name):
    m_id {0},
    m_snapshotId{snapshotId},
    m_position{position},
    m_name{name}
{

}

AviationMarkers::~AviationMarkers()
{

}
