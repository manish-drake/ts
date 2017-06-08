#ifndef SNAPSHOTMODEL_H
#define SNAPSHOTMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include <snapshot.h>
#include <datamanager.h>

#include "ts-model_global.h"
#include "modelbase.h"

class TSMODELSHARED_EXPORT SnapshotModel: public ModelBase
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        DtSnapshotRole,UserRole,DataRole
    };

    SnapshotModel(QObject *parent = 0);

    QModelIndex addSnapshot(Snapshot &snapshot);
    Q_PROPERTY(QList<int> refData READ refData WRITE setRefData NOTIFY refDataChanged)
    Q_PROPERTY(int idx READ idx WRITE setIdx NOTIFY idxChanged)

   Q_INVOKABLE void addAviationVswr(const QDateTime dtSnapshot, const QString user, const  QString data,
                         const double position, const QString name,
                         const QString range, const QString bandRange, const QString bandName);

   Q_INVOKABLE void addAviationCl(const QDateTime dtSnapshot, const QString user, const  QString data,
                       const double position, const QString name,
                       const QString range, const QString bandRange, const QString bandName);

   Q_INVOKABLE void addAviationDtf(const QDateTime dtSnapshot, const QString user, const  QString data,
                       const double position, const QString name,
                       const QString range, const QString velocity, const QString cableType);


    QList<int> refData();
    Q_INVOKABLE void setRefData(const QList<int> &data);

    int idx();
    void setIdx(int idx);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;


    ~SnapshotModel();
public slots:

signals:
    void refDataChanged();
    void idxChanged();
private:
    void qualifyByView(const int view) override;

    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    int m_idx = 2;
    DataManager &m_db;
    QList<int> m_refData;
    std::unique_ptr<std::vector<std::unique_ptr<Snapshot>>> m_snapshots;
  };

#endif // SNAPSHOTMODEL_H
