#ifndef LOGGERTHREAD_H
#define LOGGERTHREAD_H

#include <QRunnable>
#include "logging.h"
#include <memory>

class LoggerThread:public QRunnable
{
    void run() override;
public:
    LoggerThread();
    LoggerThread(QtMsgType type, const QMessageLogContext &context, const QString &msg);
private:
    Logging m_log;
};

#endif // LOGGERTHREAD_H
