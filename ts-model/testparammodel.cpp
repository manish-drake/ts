#include "testparammodel.h"
#include "testparamdao.h"
#include "datamanager.h"

using namespace std;

TestParamModel::TestParamModel(QObject *parent)
    :QAbstractListModel(parent),
      m_db(DataManager::instance()),
      m_testParams(m_db.testParamDao()->testParams())
{
}


QModelIndex TestParamModel::addTestParam(TestParam &testParam)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto testParamDao = this->m_db.testParamDao();
    testParamDao->addTestParam(testParam);
    unique_ptr<TestParam> newTestParam(&testParam);
    endInsertRows();
    this->m_testParams->push_back(move(newTestParam));
    return index(row, 0);
}

int TestParamModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return this->m_testParams->size();
}

QVariant TestParamModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const TestParam &testParam = *m_testParams->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return testParam.id();
        case Roles::SummaryIDRole:
            return testParam.summaryId();
        case Roles::KeyRole:
            return testParam.key();
        case Roles::Val1Role:
            return testParam.val1();
        case Roles::Unit1Role:
            return testParam.unit1();
        case Roles::Val2Role:
            return testParam.val2();
        case Roles::Unit2Role:
            return testParam.unit2();
        case Roles::Val3Role:
            return testParam.val3();
        case Roles::Unit3Role:
            return testParam.unit3();
        case Roles::RowRole:
            return testParam.row();
        case Roles::ColRole:
            return testParam.col();
        case Roles::RowSpanRole:
            return testParam.rowSpan();
        case Roles::ColSpanRole:
            return testParam.colSpan();
        case Roles::StyleRole:
            return testParam.style();
        case Roles::NameRole:
        case Qt::DisplayRole:
            return testParam.name();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool TestParamModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        TestParam &testParam = *m_testParams->at(index.row());
        switch (role) {
        case Roles::NameRole:
            testParam.setName(value.toString());
            break;
        case Roles::SummaryIDRole:
            testParam.setSummaryId(value.toInt());
            break;
        case Roles::KeyRole:
            testParam.setKey(value.toString());
            break;
        case Roles::Val1Role:
            testParam.setVal1(value.toString());
            break;
        case Roles::Unit1Role:
            testParam.setUnit1(value.toString());
            break;
        case Roles::Val2Role:
            testParam.setVal2(value.toString());
            break;
        case Roles::Unit2Role:
            testParam.setUnit2(value.toString());
            break;
        case Roles::Val3Role:
            testParam.setVal3(value.toString());
            break;
        case Roles::Unit3Role:
            testParam.setUnit3(value.toString());
            break;
        case Roles::RowRole:
            testParam.setRow(value.toInt());
            break;
        case Roles::ColRole:
            testParam.setCol(value.toInt());
            break;
        case Roles::RowSpanRole:
            testParam.setRowSpan(value.toInt());
            break;
        case Roles::ColSpanRole:
            testParam.setColSpan(value.toInt());
            break;
        case Roles::StyleRole:
            testParam.setStyle(value.toString());
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

bool TestParamModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const TestParam &testParam = *m_testParams->at(row + countLeft);
        m_db.testParamDao()->removeTestParam(testParam.id());
    }
    m_testParams->erase(m_testParams->begin() + row, m_testParams->begin() + row + count);
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> TestParamModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::NameRole, "name");
    hash.insert(Roles::SummaryIDRole, "summaryId");
    hash.insert(Roles::KeyRole, "key");
    hash.insert(Roles::Val1Role, "val1");
    hash.insert(Roles::Unit1Role, "unit1");
    hash.insert(Roles::Val2Role, "val2");
    hash.insert(Roles::Unit2Role, "unit2");
    hash.insert(Roles::Val3Role, "val3");
    hash.insert(Roles::Unit3Role, "unit3");
    hash.insert(Roles::RowRole, "row");
    hash.insert(Roles::ColRole, "col");
    hash.insert(Roles::RowSpanRole, "rowSpan");
    hash.insert(Roles::ColSpanRole, "colSpan");
    hash.insert(Roles::StyleRole, "style");
    return hash;
}

TestParamModel::~TestParamModel()
{

}

bool TestParamModel::isIndexValid(const QModelIndex &index) const
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
