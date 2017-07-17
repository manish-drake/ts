#ifndef QSECTIONPARAMS_H
#define QSECTIONPARAMS_H

#include <QObject>
#include "ts-model_global.h"

class TSMODELSHARED_EXPORT QSectionParams : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString name READ name CONSTANT)
    explicit QSectionParams(const QString &name, QObject *parent = 0);

    QString name() const;
    ~QSectionParams();
signals:
public slots:
private:
    QString m_name;
};

#endif // QSECTIONPARAMS_H
