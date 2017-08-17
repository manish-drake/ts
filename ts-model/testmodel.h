#ifndef TESTMODEL_H
#define TESTMODEL_H


#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include <test.h>
#include <datamanager.h>

#include "ts-model_global.h"
#include "modelbase.h"

class TSMODELSHARED_EXPORT TestModel: public ModelBase
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        NameRole,
        SectionIDRole,
        IsFavouriteRole
    };

    Q_INVOKABLE QString getName() const;

    TestModel(QObject *parent = 0);

    QModelIndex addTest(Test &test);
    QModelIndex removeTest(const int &id);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addToHome(const int &testId);
    Q_INVOKABLE void removeFromHome(const int &id);

    ~TestModel();
signals:
private:
    void qualifyByView(const int view) override;
    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<Test>>> m_tests;
};

#endif // TESTMODEL_H
