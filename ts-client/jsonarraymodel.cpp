#include "jsonarraymodel.h"
#include <QJsonObject>
#include <QDebug>

JsonArrayModel::JsonArrayModel(QObject *parent) :
    QAbstractListModel(parent),
    m_array{},
    m_hash{}
{

}

JsonArrayModel::JsonArrayModel(const JsonArrayModel &jsonArrayModel):
    QAbstractListModel (jsonArrayModel.parent()),
    m_array{jsonArrayModel.m_array}
{

}

JsonArrayModel &JsonArrayModel::operator =(const JsonArrayModel &rhs)
{
    if(this != &rhs){
         m_array = rhs.m_array;
         m_hash = rhs.m_hash;
    }
    return *this;
}

std::unique_ptr<JsonArrayModel> JsonArrayModel::fromQJsonArray(const QJsonArray &arr)
{
    std::unique_ptr<JsonArrayModel> j(new JsonArrayModel());
    j->m_array = arr;
    if(arr.size() > 0)
    {
        int index{Qt::UserRole + 1};
        for(auto key: arr[0].toObject().keys()){
            QByteArray role = key.toUtf8();
            j->m_hash.insert(index, role);
            ++index;
        }
    }
    return j;
}

int JsonArrayModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_array.size();
    return sz;
}

QVariant JsonArrayModel::data(const QModelIndex &index, int role) const
{
    int rowIndex = index.row();
    QJsonValue jval = this->m_array.at(rowIndex);
    if(jval.isObject()){
        QJsonObject jObj = jval.toObject();
        QString key = QString(m_hash[role]);
        qDebug() << "The key being lookedup is " << key;
        QJsonValue val = jObj[key];
        return QVariant::fromValue(val);
    }

    return QVariant();
}

QHash<int, QByteArray> JsonArrayModel::roleNames() const
{
    return m_hash;
}

JsonArrayModel::~JsonArrayModel()
{

}
