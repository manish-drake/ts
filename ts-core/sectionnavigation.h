#ifndef SECTIONNAVIGATION_H
#define SECTIONNAVIGATION_H

#include "navigation.h"

class TSCORESHARED_EXPORT SectionNavigation : public Navigation
{
public:
    QString link () const;
    SectionNavigation(const int sectionId, const int fromViewId, const int toViewId);
};

#endif // SECTIONNAVIGATION_H
