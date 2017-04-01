#include "navigationmodel.h"
#include <QDebug>
#include <QUrl>
#include <datamanager.h>

NavigationModel::NavigationModel(QObject *parent) :
    QObject(parent),
    m_db(DataManager::instance()),
    m_currentView{1/*Global*/},
    m_navigations{m_db.navigationDao()->navigations("Global")}
{

}

void NavigationModel::onLoaded(const QString &str) const
{
    qDebug() << str;
}


int NavigationModel::getTargetView(const QString link, const int linkId) const
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

void NavigationModel::setCurrentView(const int currentView)
{
    if(this->m_currentView != currentView){

        qDebug() << "Current view: " << currentView;

        this->m_currentView = currentView;
        emit this->currentViewChanged(currentView);

        this->m_navigations = m_db.navigationDao()->navigations(currentView);
        this->m_navigationParameter = QVariant();
    }
}
void NavigationModel::setCurrentView(const int currentView, QVariant navParam)
{
    this->setCurrentView(currentView);
    this->m_navigationParameter = navParam;
}

QVariant NavigationModel::navigationParameter()
{
    return this->m_navigationParameter;
}


