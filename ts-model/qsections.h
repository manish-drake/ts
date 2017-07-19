#ifndef QSECTIONS_H
#define QSECTIONS_H

#include <QObject>
#include "ts-model_global.h"

class TSMODELSHARED_EXPORT QSections : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString name READ name CONSTANT)    
    Q_PROPERTY(int id READ id CONSTANT)
    explicit QSections(const QString &name, int id, QObject *parent = 0);

    QString name() const;
    int id() const;

    ~QSections();
signals:
public slots:
private:
    QString m_name;
    int m_id;
};

#endif // QSECTIONS_H
