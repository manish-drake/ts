#ifndef TESTPARAMDAO_H
#define TESTPARAMDAO_H


#include <vector>
#include <memory>

#include "ts-dao_global.h"

#include "dao.h"

class TestParam;
class QSqlDatabase;

class TSDAOSHARED_EXPORT TestParamDao: public Dao
{
public:
    TestParamDao(QSqlDatabase &database);
    void init() const;

    void addTestParam(TestParam &testParam) const;
    void removeTestParam(int id) const;

    std::unique_ptr<std::vector<std::unique_ptr<TestParam> > > testParams() const;

    ~TestParamDao();
};

#endif // TESTPARAMDAO_H
