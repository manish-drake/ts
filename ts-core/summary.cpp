#include "summary.h"
#include "testparam.h"

Summary::Summary(const QString &name, const int testId, const int index, const int order, const int style):
    m_id{0},
    m_name{name},
    m_testId{testId},
    m_index{index},
    m_order{order},
    m_style{style}
{

}

Summary::~Summary()
{

}

int Summary::id() const
{
    return m_id;
}

void Summary::setId(const int id)
{
    m_id = id;
}

QString Summary::name() const
{
    return m_name;
}

void Summary::setName(const QString &name)
{
    m_name = name;
}

int Summary::testId() const
{
    return m_testId;
}

void Summary::setTestId(int testId)
{
    m_testId = testId;
}

int Summary::index() const
{
    return  this->m_index;
}

void Summary::setIndex(const int index)
{
    this->m_index = index;
}

int Summary::order() const
{
    return this->m_order;
}

void Summary::setOrder(const int order)
{
    this->m_order = order;
}

int Summary::style() const
{
    return this->m_style;
}

void Summary::setStyle(const int style)
{
    this->m_style = style;
}

const up_vec_up_tp &Summary::testParams() const
{
    return this->m_testParams;
}

void Summary::setTestParams(up_vec_up_tp &testParams)
{
    this->m_testParams = std::move(testParams);
}

