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
    //    const snapshot *snapshotPtr = &snapshot;

    //    unique_ptr<snapshot> newsnapshot(snapshotPtr);
    snapshotDao->addSnapshot(snapshot);
    endInsertRows();
    this->m_snapshots->push_back(unique_ptr<Snapshot>(&snapshot));
    return index(row, 0);
}

void SnapshotModel::addAviationVswr(const QDateTime dtSnapshot, const QString user, const QString data, const double position, const QString name, const QString range, const QString bandRange, const QString bandName)
{
    Snapshot snapshot;
    snapshot.setDtSnapshot(dtSnapshot);
    snapshot.setUser(user);
    snapshot.setData(data);
    addSnapshot(snapshot);

    AviationMarkers aviMarkers;
    aviMarkers.setPostion(position);
    aviMarkers.setName(name);
    AviationMarkersModel aviMarkersModel;
    aviMarkersModel.addAviationMarkers(aviMarkers);

    AviationVswr vswr;
    vswr.setRange(range);
    vswr.setBandRange(bandRange);
    vswr.setBandName(bandName);
    AviationVswrModel aviVswrModel;
    aviVswrModel.addAviationVswr(vswr);
}

void SnapshotModel::addAviationCl(const QDateTime dtSnapshot, const QString user, const QString data, const double position, const QString name, const QString range, const QString bandRange, const QString bandName)
{
    Snapshot snapshot;
    snapshot.setDtSnapshot(dtSnapshot);
    snapshot.setUser(user);
    snapshot.setData(data);
    addSnapshot(snapshot);

    AviationMarkers aviMarkers;
    aviMarkers.setPostion(position);
    aviMarkers.setName(name);
    AviationMarkersModel aviMarkersModel;
    aviMarkersModel.addAviationMarkers(aviMarkers);

    AviationCl cableType;
    cableType.setRange(range);
    cableType.setBandRange(bandRange);
    cableType.setBandName(bandName);
    AviationClModel aviClModel;
    aviClModel.addAviationCl(cableType);
}

void SnapshotModel::addAviationDtf(const QDateTime dtSnapshot, const QString user, const QString data, const double position, const QString name, const QString range, const QString velocity, const QString cableType)
{
    Snapshot snapshot;
    snapshot.setDtSnapshot(dtSnapshot);
    snapshot.setUser(user);
    snapshot.setData(data);
    addSnapshot(snapshot);

    AviationMarkers aviMarkers;
    aviMarkers.setPostion(position);
    aviMarkers.setName(name);
    AviationMarkersModel aviMarkersModel;
    aviMarkersModel.addAviationMarkers(aviMarkers);

    AviationDtf dtf;
    dtf.setRange(range);
    dtf.setVelocity(velocity);
    dtf.setCableType(cableType);
    AviationDtfModel aviDtfModel;
    aviDtfModel.addAviationDtf(dtf);
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
    hash.insert(Roles::UserRole, "[user]");
    hash.insert(Roles::DataRole, "[data]");
    return hash;
}

SnapshotModel::~SnapshotModel()
{

}

void SnapshotModel::qualifyByView(const int view)
{

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
