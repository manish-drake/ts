#include "homemodel.h"
#include "homedao.h"
using namespace std;


QString HomeModel::getName() const
{
    return "From home model..";
}

HomeModel::HomeModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_home(m_db.homeDao()->homeTests(0))
{
}

QModelIndex HomeModel::addHome(Home &home)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto homeDao = this->m_db.homeDao();
    homeDao->addHome(home);
    unique_ptr<Home> newHome(&home);
    endInsertRows();
    this->m_home->push_back(move(newHome));
    return index(row, 0);
}

int HomeModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return this->m_home->size();
}

QVariant HomeModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const Home &home = *m_home->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return home.id();
        case Roles::SectionIDRole:
            return home.sectionId();
        case Roles::NameRole:
        case Qt::DisplayRole:
            return home.name();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool HomeModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        Home &home = *m_home->at(index.row());
        switch (role) {
        case Roles::NameRole:
            home.setName(value.toString());
            break;
        case Roles::SectionIDRole:
            home.setSectionId(value.toInt());
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

bool HomeModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const Home &home = *m_home->at(row + countLeft);
        m_db.homeDao()->removeHome(home.id());
    }
    m_home->erase(m_home->begin() + row, m_home->begin() + row + count);
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> HomeModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::NameRole, "name");
    hash.insert(Roles::SectionIDRole, "sectionId");
    return hash;
}

HomeModel::~HomeModel()
{

}

void HomeModel::qualifyByView(const int view)
{
    decltype (m_home) temp_Home;

    switch (view) {
    case 3:
        temp_Home = m_db.homeDao()->homeTests(4);
        break;
    }

    auto sz = m_home->size();
    if(sz > 0){
        beginRemoveRows(QModelIndex(), 0, sz -1);
        m_home->clear();
        endRemoveRows();
    }

    auto sz_temp = temp_Home->size();
    if(sz_temp > 0){
        beginInsertRows(QModelIndex(), 0, sz_temp - 1);
        m_home = std::move(temp_Home);
        endInsertRows();
    }
}

bool HomeModel::isIndexValid(const QModelIndex &index) const
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
