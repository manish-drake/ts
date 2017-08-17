#include "loggerthread.h"
#include "datamanager.h"

void LoggerThread::run()
{
    if(m_log.msgType() >= 1)
    {
        auto loggingDao = DataManager::logger().loggingDao();
        loggingDao->addLogging(m_log);
    }
}

LoggerThread::LoggerThread()
{

}

LoggerThread::LoggerThread(QtMsgType type, const QMessageLogContext &context, const QString &msg):
    m_log{QDateTime::currentDateTime(),
          type,
          msg.toLocal8Bit().constData(),
          context.file,
          context.line,
          context.function
        }
{

}
