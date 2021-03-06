#ifndef SUMMARYMODEL_H
#define SUMMARYMODEL_H

#include <QAbstractListModel>
#include <QHash>
#include <QDebug>

#include <vector>
#include <memory>
#include <QList>

#include "summary.h"
#include "datamanager.h"

#include "ts-model_global.h"
#include "modelbase.h"

//#include "testparammodel.h"
#include "qtestparams.h"

class TSMODELSHARED_EXPORT SummaryModel: public ModelBase
{
    Q_OBJECT
    struct SummaryCounter{
        int m_testID;
        int m_pageIndex;

        SummaryCounter(int testID, int pageIndex):
            m_testID{testID}, m_pageIndex{pageIndex}{}

        SummaryCounter():
            m_testID{0}, m_pageIndex{0}{}

        bool operator !=(const SummaryCounter &other){
            auto result = (m_pageIndex != other.m_pageIndex) ||
                    (m_testID != other.m_testID);
            return result;
        }
    };

public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        NameRole,
        TestIDRole,
        IndexRole,
        OrderRole,
        ColRole,
        ColSpanRole,
        StyleRole
    };

    Q_PROPERTY(int currentPage READ currentPage WRITE setCurrentPage NOTIFY currentPageChanged)
    Q_INVOKABLE const QList<QObject *> getTestParamsForsummary(const int summaryId) const;

    SummaryModel(QObject *parent = 0);

    int currentPage() const;
    void setCurrentPage(int currentPage);

    QModelIndex addSummary(Summary &summary);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex &parent) override;
    QHash<int, QByteArray> roleNames() const override;

    ~SummaryModel();

signals:
    void currentPageChanged(const int &currentPage);
private:
    int getRowIndexByID(const int id) const override;
    void qualifyByView(const int view) override;
    bool isIndexValid(const QModelIndex &index) const;
    std::vector<QString> getMicroStylesFromStyleText(const QString &styleText) const;
private:
    double m_listHeight;
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<Summary>>> m_summaries;
    int m_currentPage;
    SummaryCounter m_selectedTest;
};
#endif // SUMMARYMODEL_H
