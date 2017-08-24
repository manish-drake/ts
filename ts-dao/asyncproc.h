#ifndef ASYNCPROC_H
#define ASYNCPROC_H

#include <QFutureWatcher>
#include <functional>
#include <QObject>

class AsyncProc : public QObject
{
    Q_OBJECT
public:
    AsyncProc(const std::function<void ()> &task, const std::function<void ()> &completed= [](){}, QObject *parent = Q_NULLPTR);
    const std::function<void ()> process();

   ~AsyncProc();
signals:

public slots:
private:
    const std::function<void ()> &m_task;
    const std::function<void()> &m_completed;
    QFutureWatcher<void> *m_watcher;
};

#endif // ASYNCPROC_H
