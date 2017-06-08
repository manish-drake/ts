#include "snapshotmodel.h"
#include "snapshotdao.h"
#include "aviationmarkersmodel.h"
#include "aviationvswrmodel.h"
#include "aviationclmodel.h"
#include "aviationdtfmodel.h"
using namespace std;

SnapshotModel::SnapshotModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_snapshots(m_db.snapshotDao()->snapshots())
{
}

QModelIndex SnapshotModel::addSnapshot(Snapshot &snapshot)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto snapshotDao = this->m_db.snapshotDao();
    snapshotDao->addSnapshot(snapshot);
    this->m_snapshots->push_back(std::unique_ptr<Snapshot>(new Snapshot(snapshot)));
    endInsertRows();
    return index(row, 0);
}

void SnapshotModel::addAviationVswr(const QDateTime dtSnapshot, const QString user, const QString data, const double position, const QString name, const QString range, const QString bandRange, const QString bandName)
{
    Snapshot snapshot;
    snapshot.setDtSnapshot(dtSnapshot);
    snapshot.setUser(user);
    snapshot.setData(data);
    addSnapshot(snapshot);

    AviationMarkersModel aviMarkersModel;
    aviMarkersModel.addAviationMarkers(position, name, snapshot.id());

    AviationVswrModel aviVswrModel;
    aviVswrModel.addAviationVswr(range, bandRange, bandName, snapshot.id());
}

void SnapshotModel::addAviationCl(const QDateTime dtSnapshot, const QString user, const QString data, const double position, const QString name, const QString range, const QString bandRange, const QString bandName)
{
    Snapshot snapshot;
    snapshot.setDtSnapshot(dtSnapshot);
    snapshot.setUser(user);
    snapshot.setData(data);
    addSnapshot(snapshot);

    AviationMarkersModel aviMarkersModel;
    aviMarkersModel.addAviationMarkers(position, name, snapshot.id());

    AviationClModel aviClModel;
    aviClModel.addAviationCl(range, bandRange, bandName, snapshot.id());
}

void SnapshotModel::addAviationDtf(const QDateTime dtSnapshot, const QString user, const QString data, const double position, const QString name, const QString range, const QString velocity, const QString cableType)
{
    Snapshot snapshot;
    snapshot.setDtSnapshot(dtSnapshot);
    snapshot.setUser(user);
    snapshot.setData(data);
    addSnapshot(snapshot);

    AviationMarkersModel aviMarkersModel;
    aviMarkersModel.addAviationMarkers(position, name, snapshot.id());

    AviationDtfModel aviDtfModel;
    aviDtfModel.addAviationDtf(range, velocity, cableType, snapshot.id());
}

QList<int> SnapshotModel::refData()
{
    return m_refData;
}

void SnapshotModel::setRefData(const QList<int> &data)
{
    if(data != m_refData){
        m_refData = data;
        emit refDataChanged();
    }
}

int SnapshotModel::idx()
{
    return m_idx;
}

void SnapshotModel::setIdx(int idx)
{
    if(m_idx != idx){
        m_idx = idx;
        if(idx<0){
            setRefData(QList<int>());
        }
        else{
            auto data = m_snapshots->at(idx)->getDataList();
            setRefData(data);
        }

        emit idxChanged();
    }
}

int SnapshotModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_snapshots->size();
    return sz;
}

QVariant SnapshotModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const Snapshot &snapshot = *m_snapshots->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return snapshot.id();
        case Roles::DtSnapshotRole:
            return snapshot.dtSnapshot();
        case Roles::UserRole:
            return snapshot.user();
        case Roles::DataRole:
            return snapshot.data();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool SnapshotModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        Snapshot &snapshot = *m_snapshots->at(index.row());
        switch (role) {
        case Roles::DtSnapshotRole:
            snapshot.setDtSnapshot(value.toDateTime());
            break;
        case Roles::UserRole:
            snapshot.setUser(value.toString());
            break;
        case Roles::DataRole:
            snapshot.setData(value.toString());
            break;
        default:
            break;
        }
        emit dataChanged(index, index);
        return true;
    } else {
        return false;
    }
}

bool SnapshotModel::removeRows(int row, int count, const QModelIndex &parent)
{
    if (row < 0
            || row >= rowCount()
            || count < 0
            || (row + count) > rowCount()) {
        return false;
    }
    beginRemoveRows(parent, row, row + count -1);
    int countLeft = count;
    while (countLeft--) {
        const Snapshot &snapshot = *m_snapshots->at(row + countLeft);
        m_db.snapshotDao()->removeSnapshot(snapshot.id());
    }
    m_snapshots->erase(m_snapshots->begin() + row, m_snapshots->begin() + row + count);
    endRemoveRows();
    return true;
}
QHash<int, QByteArray> SnapshotModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::DtSnapshotRole, "dtSnapshot");
    hash.insert(Roles::UserRole, "user");
    hash.insert(Roles::DataRole, "data");
    return hash;
}

SnapshotModel::~SnapshotModel()
{

}

void SnapshotModel::qualifyByView(const int view)
{
    Q_UNUSED(view)
}

bool SnapshotModel::isIndexValid(const QModelIndex &index) const
{
    int row = index.row();
    if((row < 0)
            || (row >= rowCount())
            || (!index.isValid())){
        return false;
    } else {
        return true;
    }
}
