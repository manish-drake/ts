#ifndef NAVIGATIONDAO_H
#define NAVIGATIONDAO_H

#include <memory>
#include <vector>
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

    std::unique_ptr<std::vector<std::unique_ptr<Navigation> > > navigations(const int currentViewId) const;
    std::unique_ptr<std::vector<std::unique_ptr<Navigation> > > navigations(const QString &currentView) const;

    ~NavigationDao();
};

#endif // NAVIGATIONDAO_H
