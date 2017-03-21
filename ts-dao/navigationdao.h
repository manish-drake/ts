#ifndef NAVIGATIONDAO_H
#define NAVIGATIONDAO_H

#include "ts-dao_global.h"
#include "dao.h"
class QSqlDatabase;
class Navigation;

class TSDAOSHARED_EXPORT NavigationDao : public Dao
{
public:
    void init() const;

    void addNavigation(Navigation &navigation) const;
    void removeNavigation(int id) const;

    NavigationDao(QSqlDatabase &database);

    ~NavigationDao();
};

#endif // NAVIGATIONDAO_H
