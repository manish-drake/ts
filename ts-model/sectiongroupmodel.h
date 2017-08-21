#ifndef SECTIONGROUPMODEL_H
#define SECTIONGROUPMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>
#include <QList>

#include <sectiongroup.h>
#include <datamanager.h>

#include "ts-model_global.h"
#include "modelbase.h"

#include "qsections.h"

class TSMODELSHARED_EXPORT SectionGroupModel: public ModelBase
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        NameRole
    };

    Q_INVOKABLE const QList<QObject *> getSectionsForsecGroup(const int sectionGroupId) const;

    SectionGroupModel(QObject *parent = 0);

    QModelIndex addSectionGroup(SectionGroup &sectionGroup);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;

    ~SectionGroupModel();
signals:
private:
    int getRowIndexByID(const int id) const override;
    void qualifyByView(const int view) override;
    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<SectionGroup>>> m_sectionGroups;
};

#endif // SectionGroupModel_H
