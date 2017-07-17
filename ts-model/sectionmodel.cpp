#include "sectionmodel.h"
#include "sectiondao.h"
#include "datamanager.h"
#include <QVariant>
#include "sectionparam.h"

using namespace std;

const QList<QObject*> SectionModel::getSectionParamsForsection(int sectionGroupId) const
{
    QList<QObject*> qtp;
    for(auto &summ: *m_sections){
        if(summ->id() == sectionGroupId){
            for(std::unique_ptr<SectionParam> &tp: *(summ->sectionParams())){
                qtp.append(new QSectionParams(tp->name()));

            }
        }
    }
    return qtp;
}
SectionModel::SectionModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_sections(m_db.sectionDao()->sections())
{
}

QModelIndex SectionModel::addSection(Section &section)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto sectionDao = this->m_db.sectionDao();
//    const Section *sectionPtr = &section;

//    unique_ptr<Section> newSection(sectionPtr);

    sectionDao->addSection(section);
    endInsertRows();
    this->m_sections->push_back(unique_ptr<Section>(&section));
    return index(row, 0);
}

int SectionModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_sections->size();
    return sz;
}

QVariant SectionModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const Section &section = *m_sections->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return section.id();
        case Roles::SectionGroupRole:
        case Qt::DisplayRole:
            return section.sectionGroup();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool SectionModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        Section &section = *m_sections->at(index.row());
        switch (role) {
            case Roles::SectionGroupRole:
            section.setSectionGroup(value.toString());
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

bool SectionModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const Section &section = *m_sections->at(row + countLeft);
        m_db.sectionDao()->removeSection(section.id());
    }
    m_sections->erase(m_sections->begin() + row, m_sections->begin() + row + count);
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> SectionModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::SectionGroupRole, "sectionGroup");
    return hash;
}

SectionModel::~SectionModel()
{

}

void SectionModel::qualifyByView(const int view)
{
    Q_UNUSED(view);
}

bool SectionModel::isIndexValid(const QModelIndex &index) const
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
