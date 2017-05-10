#include "aviationvswrmodel.h"
#include "aviationvswrdao.h"
#include "snapshot.h"
#include "snapshotmodel.h"
#include "aviationmarkers.h"
#include "aviationmarkersmodel.h"

using namespace std;

AviationVswrModel::AviationVswrModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_aviationVswr(m_db.aviationVswrDao()-> aviationVswr(0))
{
}

QModelIndex AviationVswrModel::addAviationVswr(AviationVswr &aviationVswr)
{ 
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto aviationVswrDao = this->m_db.aviationVswrDao();
    //    const aviationVswr *aviationVswrPtr = &aviationVswr;

    //    unique_ptr<aviationVswr> newaviationVswr(aviationVswrPtr);
    aviationVswrDao->addAviationVswr(aviationVswr);
    endInsertRows();
    this->m_aviationVswr->push_back(unique_ptr<AviationVswr>(&aviationVswr));
    return index(row, 0);
}


int AviationVswrModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_aviationVswr->size();
    return sz;
}

QVariant AviationVswrModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const AviationVswr &aviationVswr = *m_aviationVswr->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return aviationVswr.id();
        case Roles::SnapshotIDRole:
            return aviationVswr.snapshotId();
        case Roles::RangeRole:
            return aviationVswr.range();
        case Roles::BandRangeRole:
            return aviationVswr.bandRange();
        case Roles::BandNameRole:
            return aviationVswr.bandName();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool AviationVswrModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        AviationVswr &aviationVswr = *m_aviationVswr->at(index.row());
        switch (role) {
        case Roles::SnapshotIDRole:
            aviationVswr.setSnapshotId(value.toInt());
            break;
        case Roles::RangeRole:
            aviationVswr.setRange(value.toString());
            break;
        case Roles::BandRangeRole:
            aviationVswr.setBandRange(value.toString());
            break;
        case Roles::BandNameRole:
            aviationVswr.setBandName(value.toString());
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

bool AviationVswrModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const AviationVswr &aviationVswr = *m_aviationVswr->at(row + countLeft);
        m_db.aviationVswrDao()->removeAviationVswr(aviationVswr.id());
    }
    m_aviationVswr->erase(m_aviationVswr->begin() + row, m_aviationVswr->begin() + row + count);
    endRemoveRows();
    return true;
}
QHash<int, QByteArray> AviationVswrModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::SnapshotIDRole, "snapshotId");
    hash.insert(Roles::RangeRole, "range");
    hash.insert(Roles::BandRangeRole, "bandRange");
    hash.insert(Roles::BandNameRole, "bandName");
    return hash;
}

AviationVswrModel::~AviationVswrModel()
{

}

void AviationVswrModel::qualifyByView(const int view)
{

}

bool AviationVswrModel::isIndexValid(const QModelIndex &index) const
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
