#include "summarymodel.h"
#include "summarydao.h"
#include "datamanager.h"
#include "testparammodel.h"

using namespace std;



const TestParamModel *SummaryModel::getTestParamsForsummary(const int summaryId) const
{
//    m_summaries->at(0)->testParams();
    return new TestParamModel(this->parent());
}

SummaryModel::SummaryModel(QObject *parent)
    :ModelBase (parent),
      m_db(DataManager::instance()),
      m_summaries(m_db.summaryDao()->summaries(0, 0)),
      m_currentPage{1}
{
}

double SummaryModel::listHeight()
{
    return this->m_listHeight;
}

void SummaryModel::setListHeight(double listHeight)
{
    this->m_listHeight = listHeight;
    emit this->listHeightChanged(listHeight);
}

int SummaryModel::currentPage()
{
    return this->m_currentPage;
}

void SummaryModel::setCurrentPage(int currentPage)
{
    if(m_currentPage != currentPage){
        m_currentPage = currentPage;
        emit currentPageChanged(currentPage);
    }
}

QModelIndex SummaryModel::addSummary(Summary &summary)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto summaryDao = this->m_db.summaryDao();
    summaryDao->addSummary(summary);
    unique_ptr<Summary> newSummary(&summary);
    endInsertRows();
    this->m_summaries->push_back(move(newSummary));
    return index(row, 0);
}

int SummaryModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return this->m_summaries->size();
}

QVariant SummaryModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const Summary &summary = *m_summaries->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return summary.id();
        case Roles::TestIDRole:
            return summary.testId();
        case Roles::IndexRole:
            return summary.index();
        case Roles::OrderRole:
            return summary.order();
        case Roles::StyleRole:
            return summary.style();
        case Roles::NameRole:
        case Qt::DisplayRole:
            return summary.name();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool SummaryModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        Summary &summary = *m_summaries->at(index.row());
        switch (role) {
        case Roles::NameRole:
            summary.setName(value.toString());
            break;
        case Roles::TestIDRole:
            summary.setTestId(value.toInt());
            break;
        case Roles::IndexRole:
            summary.setIndex(value.toInt());
            break;
        case Roles::OrderRole:
            summary.setOrder(value.toInt());
            break;
        case Roles::StyleRole:
            summary.setStyle(value.toInt());
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

bool SummaryModel::removeRows(int row, int count, const QModelIndex &parent)
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
        const Summary &summary = *m_summaries->at(row + countLeft);
        m_db.summaryDao()->removeSummary(summary.id());
    }
    m_summaries->erase(m_summaries->begin() + row, m_summaries->begin() + row + count);
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> SummaryModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::NameRole, "name");
    hash.insert(Roles::TestIDRole, "testId");
    hash.insert(Roles::IndexRole, "index");
    hash.insert(Roles::OrderRole, "order");
    hash.insert(Roles::StyleRole, "style");
    return hash;
}

SummaryModel::~SummaryModel()
{

}

void SummaryModel::qualifyByView(const int view)
{
    decltype (m_summaries) temp_summaries;
    switch (view) {
    case 6 ... 12:
        temp_summaries = m_db.summaryDao()->summaries(1, view - 6);
        this->setCurrentPage(view - 6 + 1);
        break;
    case 14 ... 19:
        temp_summaries = m_db.summaryDao()->summaries(3, view - 14);
        this->setCurrentPage(view - 14 + 1);
        break;
    default:
        temp_summaries = m_db.summaryDao()->summaries(0, 0);
        this->setCurrentPage(1);
        break;
    }
    beginInsertRows(QModelIndex(), 0, temp_summaries->size() - 1);
    m_summaries = std::move(temp_summaries);
    endInsertRows();

}

bool SummaryModel::isIndexValid(const QModelIndex &index) const
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


