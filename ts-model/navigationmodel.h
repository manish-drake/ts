#ifndef NAVIGATIONMODEL_H
#define NAVIGATIONMODEL_H

#include <QObject>
#include "ts-model_global.h"
#include <memory>
#include "navigation.h"
#include <QVariant>

class DataManager;


class TSMODELSHARED_EXPORT NavigationModel : public QObject
{
    Q_OBJECT
public:
    explicit NavigationModel(QObject *parent = 0);

    Q_PROPERTY(int currentView READ currentView WRITE setCurrentView NOTIFY currentViewChanged)
    Q_PROPERTY(QVariant navigationParameter READ navigationParameter)
    Q_PROPERTY(bool isSideMenuAvailable READ isSideMenuAvailable WRITE setIsSideMenuAvailable NOTIFY isSideMenuAvailableChanged)
    Q_PROPERTY(bool isHeaderAvailable READ isHeaderAvailable WRITE setIsHeaderAvailable NOTIFY isHeaderAvailableChanged)


    Q_INVOKABLE int getTargetView(const QString &link, const int &linkId = 0) const;
    Q_INVOKABLE void setCurrentView(const int &currentView, const QVariant &navParam);
    Q_INVOKABLE void onLoaded(const QString &str) const;

    int currentView() const;
    void setCurrentView(const int &currentView);

    bool isSideMenuAvailable();
    void setIsSideMenuAvailable(const bool &isSideMenuAvailable);
    bool isHeaderAvailable();
    void setIsHeaderAvailable(const bool &isHeaderAvailable);

    QVariant navigationParameter() const;

    void evaluteCurrentView();

signals:
    void currentViewChanged(const int &currentView);
    void isSideMenuAvailableChanged();
    void isHeaderAvailableChanged();
public slots:

private:
    DataManager &m_db;
    int m_currentView;
    bool m_isSideMenuAvailable;
    bool m_isHeaderAvailable;
    QVariant m_navigationParameter;
    std::unique_ptr<std::vector<std::unique_ptr<Navigation>>> m_navigations;
};

#endif // NAVIGATIONMODEL_H
