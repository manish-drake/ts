#include "navigationmodel.h"

NavigationModel::NavigationModel(QObject *parent) :
    QObject(parent),
    m_currentView{"Global"}
{

}

QString NavigationModel::getViewName(const int viewId) const
{
    switch (viewId) {
    case 0:
        return "Main";
    default:
        return "Global";
    }
}

QString NavigationModel::currentView() const
{
    return this->m_currentView;
}

void NavigationModel::setCurrentView(const QString currentView)
{
    if(this->m_currentView != currentView){
        this->m_currentView = currentView;
        emit this->currentViewChanged(currentView);
    }
}
