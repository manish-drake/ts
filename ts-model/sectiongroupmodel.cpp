#include "sectiongroupmodel.h"
#include "sectiongroupdao.h"
#include "datamanager.h"
#include <QVariant>
#include "section.h"

using namespace std;

const QList<QObject*> SectionGroupModel::getSectionsForsecGroup(int sectionGroupId) const
{
    QList<QObject*> qsec;
    for(auto &sg: *m_sectionGroups){
        if(sg->id() == sectionGroupId){
            for(std::unique_ptr<Section> &sec: *(sg->sections())){
                qsec.append(new QSections(
                                sec->name(),
                                sec->id()
                                ));

            }
        }
    }
    return qsec;
}
SectionGroupModel::SectionGroupModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_sectionGroups(m_db.sectionGroupDao()->sectionGroups())
{
}

QModelIndex SectionGroupModel::addSectionGroup(SectionGroup &sectionGroup)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto sectionGroupDao = this->m_db.sectionGroupDao();
    sectionGroupDao->addSectionGroup(sectionGroup);
    endInsertRows();
    this->m_sectionGroups->push_back(unique_ptr<SectionGroup>(&sectionGroup));
    return index(row, 0);
}

int SectionGroupModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_sectionGroups->size();
    return sz;
}

QVariant SectionGroupModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const SectionGroup &sectionGroup = *m_sectionGroups->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return sectionGroup.id();
        case Roles::NameRole:
        case Qt::DisplayRole:
            return sectionGroup.name();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool SectionGroupModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        SectionGroup &sectionGroup = *m_sectionGroups->at(index.row());
        switch (role) {
        case Roles::NameRole:
            sectionGroup.setName(value.toString());
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

bool SectionGroupModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const SectionGroup &sectionGroup = *m_sectionGroups->at(row + countLeft);
        m_db.sectionGroupDao()->removeSectionGroup(sectionGroup.id());
    }
    m_sectionGroups->erase(m_sectionGroups->begin() + row, m_sectionGroups->begin() + row + count);
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> SectionGroupModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::NameRole, "name");
    return hash;
}

SectionGroupModel::~SectionGroupModel()
{

}

void SectionGroupModel::qualifyByView(const int view)
{
    Q_UNUSED(view);
}

bool SectionGroupModel::isIndexValid(const QModelIndex &index) const
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
