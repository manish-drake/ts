#include "aviationMarkersmodel.h"
#include "aviationMarkersdao.h"
using namespace std;

AviationMarkersModel::AviationMarkersModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_aviationMarkers(m_db.aviationMarkersDao()-> aviationMarkers(0))
{
}

QModelIndex AviationMarkersModel::addAviationMarkers(const double position, const QString &name, const int snapshotID)
{
    std::unique_ptr<AviationMarkers> un_pt_avMarkers(new AviationMarkers());
    un_pt_avMarkers->setPostion(position);
    un_pt_avMarkers->setName(name);
    un_pt_avMarkers->setSnapshotId(snapshotID);

    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto aviationMarkersDao = this->m_db.aviationMarkersDao();
    aviationMarkersDao->addAviationMarkers(*un_pt_avMarkers);
    endInsertRows();
    this->m_aviationMarkers->push_back(std::move(un_pt_avMarkers));
    return index(row, 0);
}
int AviationMarkersModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_aviationMarkers->size();
    return sz;
}

QVariant AviationMarkersModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const AviationMarkers &aviationMarkers = *m_aviationMarkers->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return aviationMarkers.id();
        case Roles::SnapshotIDRole:
            return aviationMarkers.snapshotId();
        case Roles::PositionRole:
            return aviationMarkers.position();
        case Roles::NameRole:
            return aviationMarkers.name();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool AviationMarkersModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        AviationMarkers &aviationMarkers = *m_aviationMarkers->at(index.row());
        switch (role) {
        case Roles::SnapshotIDRole:
            aviationMarkers.setSnapshotId(value.toInt());
            break;
        case Roles::PositionRole:
            aviationMarkers.setPostion(value.toDouble());
            break;
        case Roles::NameRole:
            aviationMarkers.setName(value.toString());
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

bool AviationMarkersModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const AviationMarkers &aviationMarkers = *m_aviationMarkers->at(row + countLeft);
        m_db.aviationMarkersDao()->removeAviationMarkers(aviationMarkers.id());
    }
    m_aviationMarkers->erase(m_aviationMarkers->begin() + row, m_aviationMarkers->begin() + row + count);
    endRemoveRows();
    return true;
}
QHash<int, QByteArray> AviationMarkersModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::SnapshotIDRole, "snapshotId");
    hash.insert(Roles::PositionRole, "position");
    hash.insert(Roles::NameRole, "name");
    return hash;
}

AviationMarkersModel::~AviationMarkersModel()
{

}

void AviationMarkersModel::qualifyByView(const int view)
{
    Q_UNUSED(view)
}

bool AviationMarkersModel::isIndexValid(const QModelIndex &index) const
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
