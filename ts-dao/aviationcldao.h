#ifndef AVIATIONCLDAO_H
#define AVIATIONCLDAO_H

#include <memory>
#include <vector>
#include "ts-dao_global.h"
#include "dao.h"
class QSqlDatabase;
class AviationCl;

class TSDAOSHARED_EXPORT AviationClDao : public Dao
{
public:
    void init() const;
    using up_vec_up_avcl = std::unique_ptr<std::vector<std::unique_ptr<AviationCl> > >;
    void addAviationCl(AviationCl &aviationCl) const;
    void removeAviationCl(int id) const;

    AviationClDao(QSqlDatabase &database);

    up_vec_up_avcl aviationCls(const int snapshotId) const;

     ~AviationClDao();
};

#endif // AVIATIONCLDAO_H
