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

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;


    ~SnapshotModel();
signals:
private:
    void qualifyByView(const int view) override;

    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<Snapshot>>> m_snapshots;
  };

#endif // SNAPSHOTMODEL_H
