#ifndef AVIATIONMARKERSDAO_H
#define AVIATIONMARKERSDAO_H

#include <memory>
#include <vector>
#include "ts-dao_global.h"
#include "dao.h"
class QSqlDatabase;
class AviationMarkers;

class TSDAOSHARED_EXPORT AviationMarkersDao : public Dao
{
public:
    void init() const;

    void addAviationMarkers(AviationMarkers &aviationMarkers) const;
    void removeAviationMarkers(int id) const;

    AviationMarkersDao(QSqlDatabase &database);

    std::unique_ptr<std::vector<std::unique_ptr<AviationMarkers> > > aviationMarkers(const int snapshotId) const;

     ~AviationMarkersDao();
};

#endif // AVIATIONMARKERSDAO_H
