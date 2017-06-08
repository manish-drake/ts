#include "aviationclmodel.h"
#include "aviationcldao.h"
using namespace std;

AviationClModel::AviationClModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_aviationCls(m_db.aviationClDao()-> aviationCls(0))
{
}

QModelIndex AviationClModel::addAviationCl(AviationCl &aviationCl)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto aviationClDao = this->m_db.aviationClDao();
//        const aviationCl *aviationClPtr = &aviationCl;

//        unique_ptr<aviationCl> newaviationCl(aviationClPtr);
    aviationClDao->addAviationCl(aviationCl);
    endInsertRows();
    this->m_aviationCls->push_back(unique_ptr<AviationCl>(&aviationCl));
    return index(row, 0);
}
void AviationClModel::addAviationCl(const QString &range, const QString &bandRange, const QString &bandName, const int snapshotID)
{
    std::unique_ptr<AviationCl> up_Cl(new AviationCl);
    up_Cl->setRange(range);
    up_Cl->setBandRange(bandRange);
    up_Cl->setBandName(bandName);
    up_Cl->setSnapshotId(snapshotID);

    auto aviationClDao = this->m_db.aviationClDao();
    aviationClDao->addAviationCl(*up_Cl);
}
int AviationClModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_aviationCls->size();
    return sz;
}

QVariant AviationClModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const AviationCl &aviationCl = *m_aviationCls->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return aviationCl.id();
        case Roles::SnapshotIDRole:
            return aviationCl.snapshotId();
        case Roles::RangeRole:
            return aviationCl.range();
        case Roles::BandRangeRole:
            return aviationCl.bandRange();
        case Roles::BandNameRole:
            return aviationCl.bandName();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool AviationClModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        AviationCl &aviationCl = *m_aviationCls->at(index.row());
        switch (role) {
        case Roles::SnapshotIDRole:
            aviationCl.setSnapshotId(value.toInt());
            break;
        case Roles::RangeRole:
            aviationCl.setRange(value.toString());
            break;
        case Roles::BandRangeRole:
            aviationCl.setBandRange(value.toString());
            break;
        case Roles::BandNameRole:
            aviationCl.setBandName(value.toString());
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

bool AviationClModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const AviationCl &aviationCl = *m_aviationCls->at(row + countLeft);
        m_db.aviationClDao()->removeAviationCl(aviationCl.id());
    }
    m_aviationCls->erase(m_aviationCls->begin() + row, m_aviationCls->begin() + row + count);
    endRemoveRows();
    return true;
}
QHash<int, QByteArray> AviationClModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::SnapshotIDRole, "snapshotId");
    hash.insert(Roles::RangeRole, "range");
    hash.insert(Roles::BandRangeRole, "bandRange");
    hash.insert(Roles::BandNameRole, "bandName");
    return hash;
}

AviationClModel::~AviationClModel()
{

}

void AviationClModel::qualifyByView(const int view)
{
    Q_UNUSED(view)
}

bool AviationClModel::isIndexValid(const QModelIndex &index) const
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
