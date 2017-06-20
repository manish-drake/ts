#include "logging.h"

#include <QDebug>

int Logging::id() const
{
    return this->m_id;
}

void Logging::setId(const int id)
{
    this->m_id = id;
}

QDateTime Logging::dtLog() const
{
    return this->m_dtLog;
}

void Logging::setDtLog(const QDateTime &dtLog)
{
    this->m_dtLog = dtLog;
}

QString Logging::data() const
{
    return this->m_data;
}

void Logging::setData(const QString &data)
{
    this->m_data = data;
}

QString Logging::file() const
{
    return this->m_file;
}

void Logging::setFile(const QString &file)
{
    this->m_file = file;
}

int Logging::line() const
{
    return this->m_line;
}

void Logging::setLine(const int &line)
{
    this->m_line = line;
}

QString Logging::function() const
{
    return this->m_function;
}

void Logging::setFunction(const QString &function)
{
    this->m_function = function;
}

Logging::Logging(const QDateTime &dtLog, const QString &data, const QString &file, const int &line, const QString &function):
    m_id {0},
    m_dtLog {dtLog},
    m_data {data},
    m_file {file},
    m_line {line},
    m_function {function}
{

}

Logging::~Logging()
{

}
