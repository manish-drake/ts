#include "controlnavigationmodel.h"

ControlNavigationModel::ControlNavigationModel()
{ }

int ControlNavigationModel::generatePIN(const int Min, const int Max)
{
        auto pin = ((qrand() % ((Max + 1) - Min)) + Min);
        return pin;
}

ControlNavigationModel::~ControlNavigationModel()
{

}
