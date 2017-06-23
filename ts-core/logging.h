#ifndef LOGGING_H
#define LOGGING_H

#include "ts-core_global.h"
#include <QString>
#include <QDateTime>

class TSCORESHARED_EXPORT Logging
{
public:
    int id() const;
    void setId(const int id);

    QDateTime dtLog() const;
    void setDtLog(const QDateTime &dtLog);

    int msgType() const;
    void setMsgType(const int &msgType);

    QString data() const;
    void setData(const QString &data);

    QString file() const;
    void setFile(const QString &file);

    int line() const;
    void setLine(const int &line);

    QString function() const;
    void setFunction(const QString &function);

    QList<int> getDataList();

    Logging(const QDateTime &dtLog, const int &msgType, const QString &data, const QString &file, const int &line, const QString &function);
    Logging() = default;
    ~Logging();

private:
    int m_id = 0;
    QDateTime m_dtLog;
    int m_msgType;
    QString m_data;
    QString m_file;
    int m_line;
    QString m_function;
};

#endif // LOGGING_H
