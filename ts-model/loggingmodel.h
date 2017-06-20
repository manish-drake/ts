#ifndef LOGGINGMODEL_H
#define LOGGINGMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include <vector>
#include <memory>

#include <logging.h>
#include <datamanager.h>

#include "ts-model_global.h"
#include "modelbase.h"

class TSMODELSHARED_EXPORT LoggingModel: public ModelBase
{
    Q_OBJECT
public:
    enum Roles {
        IDRole = Qt::UserRole + 1,
        DtLogRole,
        DataRole,
        FileRole,
        LineRole,
        FunctionRole
    };

    LoggingModel(QObject *parent = 0);

    QModelIndex addLogging(Logging &logging);
    void addLogging(const QDateTime &dtLog, const QString &data, const QString &file, const int &line, const QString &function);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    bool removeRows(int row, int count, const QModelIndex& parent) override;
    QHash<int, QByteArray> roleNames() const override;


    ~LoggingModel();
signals:
private:
    void qualifyByView(const int view) override;

    bool isIndexValid(const QModelIndex &index) const;
    double m_listHeight;
private:
    DataManager &m_db;
    std::unique_ptr<std::vector<std::unique_ptr<Logging>>> m_logging;
};

#endif // LOGGINGMODEL_H
