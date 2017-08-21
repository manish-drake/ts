#include <QDebug>
#include "modelbase.h"

ModelBase::ModelBase(QObject *parent) : QAbstractListModel(parent)
{

}

bool ModelBase::setDataByID(const int &ID, const QVariant &value, int role)
{
    int row = getRowIndexByID(ID);
    if(row >= 0){
        QModelIndex idx = index(row);
        return setData(idx, value, role);
    }
    return false;
}

void ModelBase::currentViewChanged(const int &currentView)
{
    this->qualifyByView(currentView);
}

ModelBase::~ModelBase()
{

}
