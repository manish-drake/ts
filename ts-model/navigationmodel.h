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

    Q_PROPERTY(QString currentView READ currentView WRITE setCurrentView NOTIFY currentViewChanged)
    Q_INVOKABLE QString getViewName(const int viewId) const;
    Q_INVOKABLE void onLoaded(const QString &str) const;
    Q_INVOKABLE const QString getTargetView(const QString link, const int linkId = 0) const;

    QString currentView() const;
    void setCurrentView(const QString currentView);
signals:
    void currentViewChanged(const QString currentView);
public slots:

private:
    DataManager &m_db;
    QString m_currentView;
    std::unique_ptr<std::vector<std::unique_ptr<Navigation>>> m_navigations;
};

#endif // NAVIGATIONMODEL_H
