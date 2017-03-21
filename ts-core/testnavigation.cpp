#include "testnavigation.h"
#include <QString>


QString TestNavigation::link() const
{
    return "Test";
}

TestNavigation::TestNavigation(const int sectionId, const int fromViewId, const int toViewId):
    Navigation {sectionId, fromViewId, toViewId}
{

}
