#include "sectionnavigation.h"
#include <QString>


QString SectionNavigation::link() const
{
    return "_section";
}

SectionNavigation::SectionNavigation(const int sectionId, const int viewId, const int targetViewId):
    Navigation {sectionId, viewId, targetViewId}
{

}
