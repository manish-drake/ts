#ifndef AVIATIONMARKERSMODEL_H
#define AVIATIONMARKERSMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include <aviationmarkers.h>
#include <datamanager.h>

#include "ts-model_global.h"
#include "modelbase.h"

class TSMODELSHARED_EXPORT AviationMarkersModel: public ModelBase
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        SnapshotIDRole,
        PositionRole,
        NameRole
    };

    AviationMarkersModel(QObject *parent = 0);

    QModelIndex addAviationMarkers(const double position, const QString &name, const int snapshotID);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;


    ~AviationMarkersModel();
signals:
private:
    int getRowIndexByID(const int id) const override;
    void qualifyByView(const int view) override;

    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<AviationMarkers>>> m_aviationMarkers;
};

#endif // AVIATIONMARKERSMODEL_H
