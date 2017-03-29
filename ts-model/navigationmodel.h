#ifndef NAVIGATIONMODEL_H
#define NAVIGATIONMODEL_H

#include <QObject>
#include "ts-model_global.h"
#include <memory>
#include "navigation.h"

class DataManager;


class TSMODELSHARED_EXPORT NavigationModel : public QObject
{
    Q_OBJECT
public:
    explicit NavigationModel(QObject *parent = 0);

    Q_PROPERTY(int currentView READ currentView WRITE setCurrentView NOTIFY currentViewChanged)
    Q_INVOKABLE int getTargetView(const QString link, const int linkId = 0) const;

    Q_INVOKABLE void onLoaded(const QString &str) const;

    int currentView() const;
    void setCurrentView(const int currentView);
signals:
    void currentViewChanged(const int currentView);
public slots:

private:
    DataManager &m_db;
    int m_currentView;
    std::unique_ptr<std::vector<std::unique_ptr<Navigation>>> m_navigations;
};

#endif // NAVIGATIONMODEL_H
