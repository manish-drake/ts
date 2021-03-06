#ifndef LOGGINGMODEL_H
#define LOGGINGMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include <aviationvswr.h>
#include <datamanager.h>

#include "ts-model_global.h"
#include "modelbase.h"

class TSMODELSHARED_EXPORT LoggingModel: public QObject
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        DtLogRole,
        MsgTypeRole,
        DataRole,
        FileRole,
        LineRole,
        FunctionRole
    };

    LoggingModel(QObject *parent = 0);

//    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
//    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
//    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
//    bool removeRows(int row, int count, const QModelIndex& parent) override;
//    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void log(const QString &data);
    Q_INVOKABLE QVariant logs();
    ~LoggingModel();
signals:
private:
//    int getRowIndexByID(const int id) const override;
//    void qualifyByView(const int view) override;

//    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
//    std::unique_ptr<std::vector<std::unique_ptr<Logging>>> m_logs;
  };

#endif // LOGGINGMODEL_H
