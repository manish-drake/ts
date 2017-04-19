#ifndef SUMMARYMODEL_H
#define SUMMARYMODEL_H



#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>
#include <QList>

#include "summary.h"
#include "datamanager.h"
#include "modelbase.h"

#include "ts-model_global.h"

//#include "testparammodel.h"
#include "qtestparams.h"

class TSMODELSHARED_EXPORT SummaryModel: public ModelBase
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        NameRole,
        TestIDRole,
        IndexRole,
        OrderRole,
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
    void qualifyByView(const int view) override;
    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<Summary>>> m_summaries;
    int m_currentPage;
};
#endif // SUMMARYMODEL_H
