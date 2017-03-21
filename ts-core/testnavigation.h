#ifndef TESTNAVIGATION_H
#define TESTNAVIGATION_H


#include "navigation.h"

class TSCORESHARED_EXPORT TestNavigation : public Navigation
{
public:
    QString link () const;
    TestNavigation(const int testId, const int fromViewId, const int toViewId);
};

#endif // TESTNAVIGATION_H
