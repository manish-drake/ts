#include "navigationmodel.h"
#include <QDebug>
#include <QUrl>
#include <datamanager.h>

NavigationModel::NavigationModel(QObject *parent) :
    QObject(parent),
    m_db(DataManager::instance()),
    m_currentView{"Global"},
    m_navigations{m_db.navigationDao()->navigations("Global")}
{

}

QString NavigationModel::getViewName(const int viewId) const
{
    switch (viewId) {
    case 3:
        return "ADS-B";
    case 4:
        return "ADSB-Scan";
    case 1:
    default:
        return "Global";
    }
}

void NavigationModel::onLoaded(const QString &str) const
{
    qDebug() << str;
}

const QString NavigationModel::getTargetView(const QString link, const int linkId) const
{
    for(auto const &navPtr: *m_navigations){
        if((navPtr->link() == link) && (navPtr->linkId() == linkId)){
            QString view(getViewName(navPtr->targetViewId()));

            if(view == "Global") continue;

            return view;
        }
    }
    return "Global";
}

QString NavigationModel::currentView() const
{
    return this->m_currentView;
}

void NavigationModel::setCurrentView(const QString currentView)
{
    if(this->m_currentView != currentView){
        this->m_navigations = m_db.navigationDao()->navigations(currentView);
        this->m_currentView = currentView;        

        emit this->currentViewChanged(currentView);
    }
}

