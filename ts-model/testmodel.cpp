#include "testmodel.h"
#include "testdao.h"
using namespace std;


QString TestModel::getName() const
{
    return "From test model..";
}

TestModel::TestModel(QObject *parent)
    :QAbstractListModel(parent),
      m_db(DataManager::instance()),
      m_tests(m_db.testDao()->tests())
{
}

double TestModel::listHeight()
{
    return this->m_listHeight;
}

void TestModel::setListHeight(double listHeight)
{
    this->m_listHeight = listHeight;
    emit this->listHeightChanged(listHeight);
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
