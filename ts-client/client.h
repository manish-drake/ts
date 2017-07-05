#ifndef CLIENT_H
#define CLIENT_H

#include "ts-client_global.h"
#include <QObject>
#include <memory>
#include <zmq.hpp>
#include <scan.h>
#include "jsonarraymodel.h"

class TSCLIENTSHARED_EXPORT Client: public QObject
{
    Q_OBJECT
public:
    explicit Client(QObject *parent = 0);
    Q_PROPERTY(JsonArrayModel* scanResults READ scanResults NOTIFY scanResultsChanged)
    Q_PROPERTY(QString endpoint READ endpoint WRITE setEndpoint NOTIFY endpointChanged)

    Q_INVOKABLE bool toggleScan();

    QString endpoint();
    void setEndpoint(const QString &endpoint);

signals:
    void scanResultsChanged(const JsonArrayModel *model);
    void endpointChanged();

public slots:
private:
    JsonArrayModel *scanResults() const;
    void setScanResults(std::unique_ptr<JsonArrayModel> model);
private:
    std::unique_ptr<JsonArrayModel> m_up_scanResults;
    zmq::context_t m_ctx;
    QString m_endpoint;
    Scan m_scan;
};

#endif // CLIENT_H
