#include "sectionParammodel.h"
#include "sectionParamdao.h"
#include "datamanager.h"
using namespace std;

SectionParamModel::SectionParamModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_sectionParams(m_db.sectionParamDao()->sectionParams())
{
}

QModelIndex SectionParamModel::addSectionParam(SectionParam &sectionParam)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto sectionParamDao = this->m_db.sectionParamDao();
//    const SectionParam *sectionParamPtr = &sectionParam;

//    unique_ptr<SectionParam> newSectionParam(sectionParamPtr);

    sectionParamDao->addSectionParam(sectionParam);
    endInsertRows();
    this->m_sectionParams->push_back(unique_ptr<SectionParam>(&sectionParam));
    return index(row, 0);
}

int SectionParamModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_sectionParams->size();
    return sz;
}

QVariant SectionParamModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const SectionParam &sectionParam = *m_sectionParams->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return sectionParam.id();            
        case Roles::NameRole:
        case Qt::DisplayRole:
            return sectionParam.name();
        case Roles::SectionGroupIDRole:
            return sectionParam.sectionGroupId();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool SectionParamModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        SectionParam &sectionParam = *m_sectionParams->at(index.row());
        switch (role) {
            case Roles::NameRole:
            sectionParam.setName(value.toString());
            break;
        case Roles::SectionGroupIDRole:
        sectionParam.setSectionGroupId(value.toInt());
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

bool SectionParamModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const SectionParam &sectionParam = *m_sectionParams->at(row + countLeft);
        m_db.sectionParamDao()->removeSectionParam(sectionParam.id());
    }
    m_sectionParams->erase(m_sectionParams->begin() + row, m_sectionParams->begin() + row + count);
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> SectionParamModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::NameRole, "name");
    hash.insert(Roles::SectionGroupIDRole, "sectionGroupId");
    return hash;
}

SectionParamModel::~SectionParamModel()
{

}

void SectionParamModel::qualifyByView(const int view)
{
    Q_UNUSED(view);
}

bool SectionParamModel::isIndexValid(const QModelIndex &index) const
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
