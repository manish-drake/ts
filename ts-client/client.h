#ifndef CLIENT_H
#define CLIENT_H

#include "ts-client_global.h"
#include <QObject>
#include <memory>
#include <zmq.hpp>
#include "jsonarraymodel.h"

#include <scan.h>
#include <setup.h>

class TSCLIENTSHARED_EXPORT Client: public QObject
{
    Q_OBJECT
public:
    explicit Client(QObject *parent = 0);
    Q_PROPERTY(JsonArrayModel* scanResults READ scanResults NOTIFY scanResultsChanged)
    Q_PROPERTY(QString server READ server WRITE setServer NOTIFY serverChanged)

    Q_INVOKABLE bool toggleScan();
    Q_INVOKABLE bool queryUsers();

    QString server();
    void setServer(const QString &server);

signals:
    void scanResultsChanged(const JsonArrayModel *model);
    void serverChanged();

public slots:
private:
    JsonArrayModel *scanResults() const;
    void setScanResults(std::unique_ptr<JsonArrayModel> model);
private:
    std::unique_ptr<JsonArrayModel> m_up_scanResults;
    zmq::context_t m_ctx;
    QString m_server;
    Scan m_scan;
    Setup m_setup;
};

#endif // CLIENT_H
