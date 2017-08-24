#include "asyncproc.h"
#include <QtConcurrent>
#include <QFuture>
#include <QMutex>



AsyncProc::AsyncProc(const std::function<void ()> &task, const std::function<void ()> &completed, QObject *parent):
    QObject(parent),
    m_task{task},
    m_completed{completed},
    m_watcher{new QFutureWatcher<void>(parent)}
{
    connect(m_watcher, &QFutureWatcher<void>::destroyed, [](QObject *obj){
        int x = 1;
    });
    connect(m_watcher, &QFutureWatcher<void>::finished, this->m_completed);
    connect(m_watcher, &QFutureWatcher<void>::finished, m_watcher, &QFutureWatcher<void>::deleteLater);
}

const std::function<void ()> AsyncProc::process()
{
    QFuture<void> future = QtConcurrent::run(this->m_task);
    m_watcher->setFuture(future);
}

AsyncProc::~AsyncProc()
{
}
