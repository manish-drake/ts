#ifndef NAVIGATIONMODEL_H
#define NAVIGATIONMODEL_H

#include <QObject>
#include "ts-model_global.h"


class TSMODELSHARED_EXPORT NavigationModel : public QObject
{
    Q_OBJECT
public:
    explicit NavigationModel(QObject *parent = 0);

    Q_PROPERTY(QString currentView READ currentView WRITE setCurrentView NOTIFY currentViewChanged)
    Q_INVOKABLE QString getViewName(const int viewId) const;

    QString currentView() const;
    void setCurrentView(const QString currentView);
signals:
    void currentViewChanged(const QString currentView);
public slots:
private:
    QString m_currentView;
};

#endif // NAVIGATIONMODEL_H
