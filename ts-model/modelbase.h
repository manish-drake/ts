#ifndef MODELBASE_H
#define MODELBASE_H

#include <QObject>
#include <QAbstractListModel>

class ModelBase : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ModelBase(QObject *parent = 0);

signals:

protected:
    virtual void qualifyByView(const int view) = 0;
    virtual int getRowIndexByID(const int id) const = 0;
    bool setDataByID(const int &ID, const QVariant &value, int role);

public slots:
    void currentViewChanged(const int &currentView);
public:
    virtual ~ModelBase();
};
#endif // MODELBASE_H
