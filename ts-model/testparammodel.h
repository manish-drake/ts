#ifndef TESTPARAMMODEL_H
#define TESTPARAMMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include "testparam.h"
#include "datamanager.h"

#include "ts-model_global.h"

class TSMODELSHARED_EXPORT TestParamModel: public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        NameRole,
        SummaryIDRole,
        KeyRole,
        Val1Role,
        Unit1Role,
        Val2Role,
        Unit2Role,
        Val3Role,
        Unit3Role,
        RowRole,
        ColRole,
        RowSpanRole,
        ColSpanRole,
        StyleRole
    };


    TestParamModel(QObject *parent = 0);


    QModelIndex addTestParam(TestParam &testParam);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;

    ~TestParamModel();
signals:
private:
    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<TestParam>>> m_testParams;
};

#endif // TESTPARAMMODEL_H
