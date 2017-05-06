#ifndef AVIATIONVSWRDAO_H
#define AVIATIONVSWRDAO_H

#include <memory>
#include <vector>
#include "ts-dao_global.h"
#include "dao.h"

class QSqlDatabase;
class AviationVswr;

class TSDAOSHARED_EXPORT AviationVswrDao : public Dao
{
public:
    void init() const;

    void addAviationVswr(AviationVswr &aviationVswr) const;
    void removeAviationVswr(int id) const;

    AviationVswrDao(QSqlDatabase &database);

    std::unique_ptr<std::vector<std::unique_ptr<AviationVswr> > > aviationVswr(const int snapshotId) const;

     ~AviationVswrDao();
};

#endif // AVIATIONVSWRDAO_H
