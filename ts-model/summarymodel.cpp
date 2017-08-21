#include "summarymodel.h"
#include "summarydao.h"
#include "datamanager.h"
#include <QVariant>
#include "testparam.h"

using namespace std;


const QList<QObject*> SummaryModel::getTestParamsForsummary(const int summaryId) const
{
    QList<QObject*> qtp;
    for(auto &summ: *m_summaries){
        if(summ->id() == summaryId){
            for(std::unique_ptr<TestParam> &tp: *(summ->testParams())){
                auto styleVec = getMicroStylesFromStyleText(tp->style());

                qtp.append(new QTestParams(
                               tp->key(),
                               tp->val1(),
                               tp->unit1(),
                               tp->val2(),
                               tp->unit2(),
                               tp->val3(),
                               tp->unit3(),
                               tp->row(),
                               tp->col(),
                               tp->rowSpan(),
                               tp->colSpan(),
                               styleVec[0],
                           styleVec[1],
                        styleVec[2],
                        styleVec[3],
                        styleVec[4],
                        styleVec[5],
                        styleVec[6]

                        ));
                qDebug() << summ->name();
                qDebug() << tp->key();
            }
        }
    }
    return qtp;
}
std::vector<QString> SummaryModel::getMicroStylesFromStyleText(const QString &styleText) const{
    std::vector<QString> vec;
    auto styleList = styleText.split(".");
    for(auto s: styleList){
        vec.push_back(s);
    }
    return vec;
}
SummaryModel::SummaryModel(QObject *parent)
    :ModelBase (parent),
      m_db(DataManager::instance()),
      m_summaries(m_db.summaryDao()->summaries(0, 0)),
      m_currentPage{1}
{
}

int SummaryModel::currentPage() const
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
    auto sz = this->m_summaries->size();
    return sz;
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
        case Roles::ColRole:
            return summary.col();
        case Roles::ColSpanRole:
            return summary.colSpan();
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
        case Roles::ColRole:
            summary.setCol(value.toInt());
            break;
        case Roles::ColSpanRole:
            summary.setColSpan(value.toInt());
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
    hash.insert(Roles::ColRole, "col");
    hash.insert(Roles::ColSpanRole, "colSpan");
    hash.insert(Roles::StyleRole, "style");
    return hash;
}

SummaryModel::~SummaryModel()
{

}

int SummaryModel::getRowIndexByID(const int id) const
{
    int row = -1, idx = 0;
    for(auto &item: *m_summaries){
        if(item->id() == id)
        {
            row = idx;
            break;
        }
        idx += 1;
    }
    return row;
}

void SummaryModel::qualifyByView(const int view)
{
    decltype (m_summaries) temp_summaries;
    switch (view) {
    case 6 ... 12: {
        int testID = 1;
        auto pageIndex = view - 6;
        if(m_selectedTest != SummaryCounter(testID, pageIndex)){
            temp_summaries = m_db.summaryDao()->summaries(testID, pageIndex);
            this->setCurrentPage(pageIndex);
            m_selectedTest = SummaryCounter(testID, pageIndex);
        }
        break;
    }
    case 14 ... 19:{
        int testID = 3;
        auto pageIndex = view - 14;
        if(m_selectedTest != SummaryCounter(testID, pageIndex)){
            temp_summaries = m_db.summaryDao()->summaries(testID, pageIndex);
            this->setCurrentPage(pageIndex);
            m_selectedTest = SummaryCounter(testID, pageIndex);
        }
    }
        break;
    case 43 ... 51:{
        int testID = 6;
        auto pageIndex = view - 43;
        if(m_selectedTest != SummaryCounter(testID, pageIndex)){
            temp_summaries = m_db.summaryDao()->summaries(testID, pageIndex);
            this->setCurrentPage(pageIndex);
            m_selectedTest = SummaryCounter(testID, pageIndex);
        }
    }
        break;
    default:
        temp_summaries = std::unique_ptr<std::vector<std::unique_ptr<Summary>>>();
        break;
    }

    auto sz = m_summaries->size();
    if(sz > 0){
        beginRemoveRows(QModelIndex(), 0, sz - 1);
        m_summaries->clear();
        endRemoveRows();
    }

    if(temp_summaries){
        auto sz_temp = temp_summaries->size();
        if(sz_temp > 0){
            beginInsertRows(QModelIndex(), 0, sz_temp - 1);
            m_summaries = std::move(temp_summaries);
            endInsertRows();
        }
    }
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


