#include "testmodel.h"
#include "testdao.h"
using namespace std;

TestModel::TestModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_tests(m_db.testDao()->homeTests()),
    m_isFavourite(false)
{
}

QModelIndex TestModel::addTest(Test &test)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto testDao = this->m_db.testDao();
    testDao->addTest(test);
    unique_ptr<Test> newTest(&test);
    endInsertRows();
    this->m_tests->push_back(move(newTest));
    return index(row, 0);
}

int TestModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return this->m_tests->size();
}

QVariant TestModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const Test &test = *m_tests->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return test.id();
        case Roles::SectionIDRole:
            return test.sectionId();
        case Roles::IsFavouriteRole:
            return test.isFavourite();
        case Roles::NameRole:
        case Qt::DisplayRole:
            return test.name();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }
}

bool TestModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        Test &test = *m_tests->at(index.row());
        switch (role) {
        case Roles::NameRole:
            test.setName(value.toString());
            break;
        case Roles::SectionIDRole:
            test.setSectionId(value.toInt());
            break;
        case Roles::IsFavouriteRole:{
            test.setIsFavourite(value.toInt());
            auto testDao = this->m_db.testDao();
            testDao->editTest(test.id(), value.toInt());
        }
        default:
            break;
        }
        emit dataChanged(index, index);
        return true;
    } else {
        return false;
    }
}

bool TestModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const Test &test = *m_tests->at(row + countLeft);
        m_db.testDao()->removeTest(test.id());
    }
    m_tests->erase(m_tests->begin() + row, m_tests->begin() + row + count);
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> TestModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::NameRole, "name");
    hash.insert(Roles::SectionIDRole, "sectionId");
    hash.insert(Roles::IsFavouriteRole, "isFavourite");
    return hash;
}

void TestModel::setFavourite(const int &testId, const bool &isFavourite)
{
    for(auto &test: *m_tests){
        if(test->id() == testId){
            setDataByID(testId, isFavourite, Roles::IsFavouriteRole);
        }
    }
}

bool TestModel::isFavourite(const int testId)
{
    for(auto &test: *m_tests){
        if(test->id() == testId){
            return test->isFavourite();
        }
    }
    return 0;
}


TestModel::~TestModel()
{

}

int TestModel::getRowIndexByID(const int id) const
{
    int row = -1, idx = 0;
    for(auto &item: *m_tests){
        if(item->id() == id)
        {
            row = idx;
            break;
        }
        idx += 1;
    }
    return row;
}

void TestModel::qualifyByView(const int view)
{
    decltype (m_tests) temp_Tests;

    switch (view) {
    case 2:
        if(m_selectedSectionID != 1){
            temp_Tests = m_db.testDao()->homeTests();
            m_selectedSectionID = 1;
        }
        break;
    case 41:
        if(m_selectedSectionID != 2){
            temp_Tests = m_db.testDao()->tests(2);
            m_selectedSectionID = 2;
        }
        break;
    case 3:
        if(m_selectedSectionID != 4){
            temp_Tests = m_db.testDao()->tests(4);
            m_selectedSectionID = 4;
        }
        break;
    case 34:
        if(m_selectedSectionID != 7){
            temp_Tests = m_db.testDao()->tests(7);
            m_selectedSectionID = 7;
        }
        break;
    default:
        temp_Tests = 0x00;
        break;
    }

    if(temp_Tests){
        auto sz = m_tests->size();
        if(sz > 0){
            beginRemoveRows(QModelIndex(), 0, sz -1);
            m_tests->clear();
            endRemoveRows();
        }

        auto sz_temp = temp_Tests->size();
        if(sz_temp > 0){
            beginInsertRows(QModelIndex(), 0, sz_temp - 1);
            m_tests = std::move(temp_Tests);
            endInsertRows();
        }
    }
}

bool TestModel::isIndexValid(const QModelIndex &index) const
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
