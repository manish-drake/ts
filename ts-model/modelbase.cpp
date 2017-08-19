#include <QDebug>
#include "modelbase.h"

ModelBase::ModelBase(QObject *parent) : QAbstractListModel(parent)
{

}

void ModelBase::currentViewChanged(const int &currentView)
{
    this->qualifyByView(currentView);
}

ModelBase::~ModelBase()
{

}
