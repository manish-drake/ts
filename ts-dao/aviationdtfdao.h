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
    typedef std::unique_ptr<std::vector<std::unique_ptr<AviationDtf> > > up_vec_up_avdtf;
    void addAviationDtf(AviationDtf &aviationDtf) const;
    void removeAviationDtf(int id) const;

    AviationDtfDao(QSqlDatabase &database);

    up_vec_up_avdtf aviationDtf(const int snapshotId) const;

     ~AviationDtfDao();
};

#endif // AVIATIONDTFDAO_H
