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
    explicit Client(const std::string &endpoint, QObject *parent = 0);
    Q_PROPERTY(JsonArrayModel* scanResults READ scanResults NOTIFY scanResultsChanged)

    void parseMessage(const QString&);

    Q_INVOKABLE bool toggleScan();
signals:
    void scanResultsChanged(const JsonArrayModel *model);

public slots:
private:
    JsonArrayModel* scanResults();
    void setScanResults(std::unique_ptr<JsonArrayModel> model);
private:
    std::unique_ptr<JsonArrayModel> m_up_scanResults;
    zmq::context_t m_ctx;
    Scan m_scan;
};

#endif // CLIENT_H
