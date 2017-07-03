#ifndef HOMEDAO_H
#define HOMEDAO_H


#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class Home;
class QSqlDatabase;

class TSDAOSHARED_EXPORT HomeDao: public Dao
{
public:
    HomeDao(QSqlDatabase &database);
    void init() const;

    void addHome(Home &home) const;
    void removeHome(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<Home> > > homeTests(const int sectionId) const;

    ~HomeDao();
};
#endif // HOMEDAO_H
