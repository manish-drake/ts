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
    Q_PROPERTY(QString keyStyle READ keyStyle CONSTANT)
    Q_PROPERTY(QString valueStyle READ valueStyle CONSTANT)
    Q_PROPERTY(QString unitStyle READ unitStyle CONSTANT)
    explicit QTestParams(const QString &key, const QString &value, const QString &unit, int row, int col, int rowSpan, int colSpan,const QString &keyStyle, const QString &valueStyle, const QString &unitStyle, QObject *parent = 0);

    QString key() const;
    QString value()const;
    QString unit()const;
    int row() const;
    int col() const;
    int rowSpan() const;
    int colSpan() const;
    QString keyStyle() const;
    QString valueStyle() const;
    QString unitStyle() const;
    ~QTestParams();
signals:
public slots:
private:
    QString m_key, m_value, m_unit, m_keyStyle, m_valueStyle, m_unitStyle;
    int m_row, m_col, m_rowSpan, m_colSpan;
};

#endif // QTESTPARAMS_H
