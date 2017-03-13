#ifndef SECTIONMODEL_H
#define SECTIONMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include <section.h>
#include <datamanager.h>

#include "ts-model_global.h"

class TSMODELSHARED_EXPORT SectionModel: public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        NameRole
    };

    SectionModel(QObject *parent = 0);

    QModelIndex addSection(const Section &section);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;

    ~SectionModel();
private:
    bool isIndexValid(const QModelIndex &index) const;

private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<Section>>> m_sections;
};

#endif // SECTIONMODEL_H
