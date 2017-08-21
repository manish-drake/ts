#include "aviationdtfmodel.h"
#include "aviationdtfdao.h"
using namespace std;

AviationDtfModel::AviationDtfModel(QObject *parent):
      ModelBase(parent),
      m_db(DataManager::instance()),
      m_aviationDtfs(m_db.aviationDtfDao()->aviationDtf(0))
{
}

QModelIndex AviationDtfModel::addAviationDtf(AviationDtf &aviationDtf)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto aviationDtfDao = this->m_db.aviationDtfDao();
//        const aviationDtf *aviationDtfPtr = &aviationDtf;

//        unique_ptr<aviationDtf> newaviationDtf(aviationDtfPtr);
    aviationDtfDao->addAviationDtf(aviationDtf);
    endInsertRows();
    this->m_aviationDtfs->push_back(unique_ptr<AviationDtf>(&aviationDtf));
    return index(row, 0);
}

void AviationDtfModel::addAviationDtf(const QString &range, const QString &velocity, const QString &cableType, const int snapshotID){

    int row = this->rowCount();
    std::unique_ptr<AviationDtf> up_avDtf(new AviationDtf());
    up_avDtf->setRange(range);
    up_avDtf->setVelocity(velocity);
    up_avDtf->setCableType(cableType);
    up_avDtf->setSnapshotId(snapshotID);

    auto aviationDtfDao = this->m_db.aviationDtfDao();
    beginInsertRows(QModelIndex(), row, row);
    aviationDtfDao->addAviationDtf(*up_avDtf);
    endInsertRows();
    this->m_aviationDtfs->push_back(std::move(up_avDtf));
}

int AviationDtfModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_aviationDtfs->size();
    return sz;
}

QVariant AviationDtfModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const AviationDtf &aviationDtf = *m_aviationDtfs->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return aviationDtf.id();
        case Roles::SnapshotIDRole:
            return aviationDtf.snapshotId();
        case Roles::RangeRole:
            return aviationDtf.range();
        case Roles::VelocityRole:
            return aviationDtf.velocity();
        case Roles::CableTypeRole:
            return aviationDtf.cableType();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool AviationDtfModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        AviationDtf &aviationDtf = *m_aviationDtfs->at(index.row());
        switch (role) {
        case Roles::SnapshotIDRole:
            aviationDtf.setSnapshotId(value.toInt());
            break;
        case Roles::RangeRole:
            aviationDtf.setRange(value.toString());
            break;
        case Roles::VelocityRole:
            aviationDtf.setVelocity(value.toString());
            break;
        case Roles::CableTypeRole:
            aviationDtf.setCableType(value.toString());
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

bool AviationDtfModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const AviationDtf &aviationDtf = *m_aviationDtfs->at(row + countLeft);
        m_db.aviationDtfDao()->removeAviationDtf(aviationDtf.id());
    }
    m_aviationDtfs->erase(m_aviationDtfs->begin() + row, m_aviationDtfs->begin() + row + count);
    endRemoveRows();
    return true;
}
QHash<int, QByteArray> AviationDtfModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::SnapshotIDRole, "snapshotId");
    hash.insert(Roles::RangeRole, "range");
    hash.insert(Roles::VelocityRole, "velocity");
    hash.insert(Roles::CableTypeRole, "cableType");
    return hash;
}

AviationDtfModel::~AviationDtfModel()
{

}

int AviationDtfModel::getRowIndexByID(const int id) const
{
    int row = -1, idx = 0;
    for(auto &item: *m_aviationDtfs){
        if(item->id() == id)
        {
            row = idx;
            break;
        }
        idx += 1;
    }
    return row;
}

void AviationDtfModel::qualifyByView(const int view)
{
    Q_UNUSED(view)
}

bool AviationDtfModel::isIndexValid(const QModelIndex &index) const
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
