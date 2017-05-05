#include "dummygraphdata.h"

void dummygraphdata::refresh()
{
    setPoints(getRandPointsList());
}

dummygraphdata::dummygraphdata(QObject *parent) :
    QObject(parent),
    m_points{getRandPointsList()}
{
    this->startTimer(1000);
}


QList<int> dummygraphdata::points()
{
    return m_points;
}

void dummygraphdata::setPoints(QList<int> points)
{
    m_points = points;

    emit pointsChanged(points);
}

void dummygraphdata::timerEvent(QTimerEvent *event)
{
    refresh();
}
