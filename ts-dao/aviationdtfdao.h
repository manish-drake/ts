#ifndef AVIATIONDTFDAO_H
#define AVIATIONDTFDAO_H

#include <memory>
#include <vector>
#include "ts-dao_global.h"
#include "dao.h"
class QSqlDatabase;
class AviationDtf;

class TSDAOSHARED_EXPORT AviationDtfDao : public Dao
{
public:
    void init() const;

    void addAviationDtf(AviationDtf &aviationDtf) const;
    void removeAviationDtf(int id) const;

    AviationDtfDao(QSqlDatabase &database);

    std::unique_ptr<std::vector<std::unique_ptr<AviationDtf> > > aviationDtf(const int snapshotId) const;

     ~AviationDtfDao();
};

#endif // AVIATIONDTFDAO_H
