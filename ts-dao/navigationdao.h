#ifndef NAVIGATIONDAO_H
#define NAVIGATIONDAO_H

#include "dao.h"
class QSqlDatabase;
class Navigation;

class NavigationDao : public Dao
{
public:
    void init() const;

    void addNavigation(Navigation &navigation) const;
    void removeNavigation(int id) const;

    NavigationDao(QSqlDatabase &database);
};

#endif // NAVIGATIONDAO_H
