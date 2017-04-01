#ifndef QTESTPARAMS_H
#define QTESTPARAMS_H

#include <QObject>
#include "ts-model_global.h"

class TSMODELSHARED_EXPORT QTestParams //: public QObject
{
//    Q_OBJECT
public:
    Q_PROPERTY(QString data READ data WRITE setData NOTIFY dataChanged)
    explicit QTestParams(QObject *parent = 0);

    QString data() const;
    void setData(QString data);
    ~QTestParams();
signals:
    void dataChanged(QString data);
public slots:
private:
    QString m_data;
};

#endif // QTESTPARAMS_H
