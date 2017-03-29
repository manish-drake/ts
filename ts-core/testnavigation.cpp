#include "testnavigation.h"
#include <QString>


QString TestNavigation::link() const
{
    return "_test";
}

TestNavigation::TestNavigation(const int sectionId, const int viewId, const int targetViewId):
    Navigation {sectionId, viewId, targetViewId}
{

}
