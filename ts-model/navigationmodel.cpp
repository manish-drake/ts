#include "navigationmodel.h"
#include <QDebug>
#include <QUrl>
#include <datamanager.h>

NavigationModel::NavigationModel(QObject *parent) :
    QObject(parent),
    m_db(DataManager::instance()),
    m_currentView{2/*Home*/},
    m_isSideMenuAvailable{true},
    m_isHeaderAvailable{true},
    m_navigations{m_db.navigationDao()->navigations("Global")}
{

}

void NavigationModel::onLoaded(const QString &str) const
{
    qDebug() << str;
}

int NavigationModel::getTargetView(const QString &link, const int &linkId) const
{
    for(auto const &navPtr: *m_navigations){
        if((navPtr->link() == link) && (navPtr->linkId() == linkId)){
            int view(navPtr->targetViewId());

            if(view <= 1) continue;

            return view;
        }
    }
    return 1;
}

int NavigationModel::currentView() const
{
    return this->m_currentView;
}

void NavigationModel::setCurrentView(const int &currentView)
{
    if(this->m_currentView != currentView){

        qInfo() << "Current view: " << currentView;

        this->m_currentView = currentView;

        emit this->currentViewChanged(currentView);

        this->m_navigations = m_db.navigationDao()->navigations(currentView);

        this->evaluteCurrentView();
    }
}

void NavigationModel::setCurrentView(const int &currentView, const QVariant &navParam)
{
    this->m_navigationParameter = navParam;
    this->setCurrentView(currentView);
}

bool NavigationModel::isSideMenuAvailable()
{
    return m_isSideMenuAvailable;
}

void NavigationModel::setIsSideMenuAvailable(const bool &isSideMenuAvailable)
{
    if(m_isSideMenuAvailable != isSideMenuAvailable){
        m_isSideMenuAvailable = isSideMenuAvailable;
        emit isSideMenuAvailableChanged();
    }
}

bool NavigationModel::isHeaderAvailable()
{
    return m_isHeaderAvailable;
}

void NavigationModel::setIsHeaderAvailable(const bool &isHeaderAvailable)
{
    if(m_isHeaderAvailable != isHeaderAvailable){
        m_isHeaderAvailable = isHeaderAvailable;
        emit isHeaderAvailableChanged();
    }
}

QVariant NavigationModel::navigationParameter() const
{
    return this->m_navigationParameter;
}

void NavigationModel::evaluteCurrentView()
{
    switch (this->m_currentView)
    {
    case 0 ... 4:
    case 34:
    case 41:
        setIsSideMenuAvailable(true);
        break;
    default:
        setIsSideMenuAvailable(false);
        break;
    }
    switch (this->m_currentView)
    {
    case 1:
        break;
    case 5:
    case 6 ... 12:
    case 14 ... 19:
    case 29 ... 32:
    case 35 ... 37:
    case 39 ... 40:
    case 42 ... 51:
        setIsHeaderAvailable(false);
        break;
    default:
        setIsHeaderAvailable(true);
        break;
    }
}


