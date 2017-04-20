#ifndef QTESTPARAMS_H
#define QTESTPARAMS_H

#include <QObject>
#include "ts-model_global.h"

class TSMODELSHARED_EXPORT QTestParams : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString key READ key CONSTANT)
    Q_PROPERTY(QString value READ value CONSTANT)
    Q_PROPERTY(QString unit READ unit CONSTANT)
    Q_PROPERTY(int row READ row CONSTANT)
    Q_PROPERTY(int col READ col CONSTANT)
    Q_PROPERTY(int rowSpan READ rowSpan CONSTANT)
    Q_PROPERTY(int colSpan READ colSpan CONSTANT)
     Q_PROPERTY(int style READ style CONSTANT)
    explicit QTestParams(QString key = "", QString value = "", QString unit = "", int row = 0, int col = 0, int rowSpan = 1, int colSpan = 1, int style = 0, QObject *parent = 0);

    QString key() const;
    QString value()const;
    QString unit()const;
    int row() const;
    int col() const;
    int rowSpan() const;
    int colSpan() const;
    int style() const;
    ~QTestParams();
signals:
    void dataChanged(const QString &key, QString &value, QString &unit);
public slots:
private:
    QString m_key, m_value, m_unit;
    int m_row, m_col, m_rowSpan, m_colSpan, m_style;
};

#endif // QTESTPARAMS_H
