#include "controlnavigationmodel.h"

ControlNavigationModel::ControlNavigationModel() : QObject(), m_pin{getRandomPIN()}
{ }


int ControlNavigationModel::pin() const
{
    return this->m_pin;
}

void ControlNavigationModel::generatePIN(const int &pin)
{
    this->m_pin = getRandomPIN();
    emit this->pinChanged();
}

ControlNavigationModel::~ControlNavigationModel()
{

}
