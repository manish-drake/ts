#include "sectionnavigation.h"
#include <QString>


QString SectionNavigation::link() const
{
    return "Section";
}

SectionNavigation::SectionNavigation(const int sectionId, const int fromViewId, const int toViewId):
    Navigation {sectionId, fromViewId, toViewId}
{

}
