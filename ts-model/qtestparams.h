#ifndef QTESTPARAMS_H
#define QTESTPARAMS_H

#include <QObject>
#include "ts-model_global.h"

class TSMODELSHARED_EXPORT QTestParams : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString data READ data CONSTANT)
    Q_PROPERTY(int row READ row CONSTANT)
    Q_PROPERTY(int col READ col CONSTANT)
    Q_PROPERTY(int rowSpan READ rowSpan CONSTANT)
    Q_PROPERTY(int colSpan READ colSpan CONSTANT)
    explicit QTestParams(QString data = "", int row = 0, int col = 0, int rowSpan = 1, int colSpan = 1, QObject *parent = 0);

    QString data() const;
    int row() const;
    int col() const;
    int rowSpan() const;
    int colSpan() const;
    ~QTestParams();
signals:
    void dataChanged(const QString &data);
public slots:
private:
    QString m_data;
    int m_row, m_col, m_rowSpan, m_colSpan;
};

#endif // QTESTPARAMS_H
