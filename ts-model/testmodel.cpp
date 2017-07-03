#include "testmodel.h"
#include "testdao.h"
using namespace std;


QString TestModel::getName() const
{
    return "From test model..";
}

TestModel::TestModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_tests(m_db.testDao()->tests(0))
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
    return hash;
}

TestModel::~TestModel()
{

}

void TestModel::qualifyByView(const int view)
{
    decltype (m_tests) temp_Tests;

    switch (view) {
    case 2:
        temp_Tests = m_db.testDao()->tests(1);
        break;
    case 3:
        temp_Tests = m_db.testDao()->tests(4);
        break;
    case 34:
        temp_Tests = m_db.testDao()->tests(7);
        break;
    default:
        temp_Tests = m_db.testDao()->tests(0);
        break;
    }

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
