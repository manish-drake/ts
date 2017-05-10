#ifndef AVIATIONVSWRMODEL_H
#define AVIATIONVSWRMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include <aviationvswr.h>
#include <datamanager.h>

#include "ts-model_global.h"
#include "modelbase.h"

class TSMODELSHARED_EXPORT AviationVswrModel: public ModelBase
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        SnapshotIDRole,
        RangeRole,
        BandRangeRole,
        BandNameRole
    };

    AviationVswrModel(QObject *parent = 0);

    QModelIndex addAviationVswr(AviationVswr &aviationVswr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;


    ~AviationVswrModel();
signals:
private:
    void qualifyByView(const int view) override;

    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<AviationVswr>>> m_aviationVswr;
  };

#endif // AVIATIONVSWRMODEL_H
