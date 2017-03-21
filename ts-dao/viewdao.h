#ifndef VIEWDAO_H
#define VIEWDAO_H

#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class View;
class QSqlDatabase;

class TSDAOSHARED_EXPORT ViewDao: public Dao
{
public:
    ViewDao(QSqlDatabase &database);
    void init() const;

    void addView(View &view) const;
    void removeView(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<View> > > views() const;

    ~ViewDao();
};
#endif // VIEWDAO_H
