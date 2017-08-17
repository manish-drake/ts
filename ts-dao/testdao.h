#ifndef TESTDAO_H
#define TESTDAO_H

#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class Test;
class QSqlDatabase;

class TSDAOSHARED_EXPORT TestDao: public Dao
{
public:
    TestDao(QSqlDatabase &database);
    void init() const;

    void addTest(Test &test) const;
    void removeTest(int id) const;
    void editTest(int id, int isFavourite) const;

    std::unique_ptr<std::vector<std::unique_ptr<Test> > > tests(const int sectionId) const;    
    std::unique_ptr<std::vector<std::unique_ptr<Test> > > homeTests() const;

    ~TestDao();
};

#endif // TESTDAO_H
