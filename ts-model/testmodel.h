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

    TestModel(QObject *parent = 0);

    QModelIndex addTest(Test &test);
    QModelIndex removeTest(const int &id);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;

//    Q_PROPERTY(bool isFavourite READ isFavourite WRITE setIsFavourite NOTIFY isFavouriteChanged)

    Q_INVOKABLE void setFavourite(const int &testId,const bool &isFavourite);
    Q_INVOKABLE bool isFavourite(const int testId);

    void setIsFavourite(const bool &isFavourite);

    ~TestModel();
signals:
    void isFavouriteChanged();

private:
    void qualifyByView(const int view) override;
    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<Test>>> m_tests;
    bool m_isFavourite;
};

#endif // TESTMODEL_H
