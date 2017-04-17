#ifndef JSONARRAYMODEL_H
#define JSONARRAYMODEL_H

#include <QAbstractListModel>
#include <QJsonArray>
#include <QHash>
#include <memory>


class JsonArrayModel : public QAbstractListModel
{
        Q_OBJECT
public:
    JsonArrayModel(QObject *parent = 0);
    JsonArrayModel(const JsonArrayModel&);
    JsonArrayModel &operator = (const JsonArrayModel &rhs);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    ~JsonArrayModel();

    static std::unique_ptr<JsonArrayModel> fromQJsonArray(const QJsonArray &arr);
protected:
private:
    QJsonArray m_array;
    QHash<int, QByteArray> m_hash;
};

#endif // JSONARRAYMODEL_H
