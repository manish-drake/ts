#include "view.h"

int View::id() const
{
    return this->m_id;
}

void View::setId(int id)
{
    this->m_id = id;
}

QString View::name() const
{
    return this->m_name;
}

void View::setName(QString name)
{
    this->m_name = name;
}

View::View(const QString &name):
    m_id{0},
    m_name{name}
{
}

View::~View()
{

}
