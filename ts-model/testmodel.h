#ifndef TESTMODEL_H
#define TESTMODEL_H


#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include <test.h>
#include <datamanager.h>

#include "ts-model_global.h"

class TSMODELSHARED_EXPORT TestModel: public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        NameRole,
        SectionIDRole
    };

    Q_PROPERTY(double listHeight READ listHeight WRITE setListHeight NOTIFY listHeightChanged)

    TestModel(QObject *parent = 0);

    double listHeight();
    void setListHeight(double listHeight);

    QModelIndex addTest(Test &test);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;

    ~TestModel();
signals:
    void listHeightChanged(double listHeight);
private:
    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<Test>>> m_tests;
};

#endif // TESTMODEL_H
