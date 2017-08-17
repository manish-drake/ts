#ifndef QTESTPARAMS_H
#define QTESTPARAMS_H

#include <QObject>
#include "ts-model_global.h"

class TSMODELSHARED_EXPORT QTestParams : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString key READ key CONSTANT)
    Q_PROPERTY(QString value1 READ value1 CONSTANT)
    Q_PROPERTY(QString unit1 READ unit1 CONSTANT)
    Q_PROPERTY(QString value2 READ value2 CONSTANT)
    Q_PROPERTY(QString unit2 READ unit2 CONSTANT)
    Q_PROPERTY(QString value3 READ value3 CONSTANT)
    Q_PROPERTY(QString unit3 READ unit3 CONSTANT)
    Q_PROPERTY(int row READ row CONSTANT)
    Q_PROPERTY(int col READ col CONSTANT)
    Q_PROPERTY(int rowSpan READ rowSpan CONSTANT)
    Q_PROPERTY(int colSpan READ colSpan CONSTANT)
    Q_PROPERTY(QString keyStyle READ keyStyle CONSTANT)
    Q_PROPERTY(QString value1Style READ value1Style CONSTANT)
    Q_PROPERTY(QString unit1Style READ unit1Style CONSTANT)
    Q_PROPERTY(QString value2Style READ value2Style CONSTANT)
    Q_PROPERTY(QString unit2Style READ unit2Style CONSTANT)
    Q_PROPERTY(QString value3Style READ value3Style CONSTANT)
    Q_PROPERTY(QString unit3Style READ unit3Style CONSTANT)
    explicit QTestParams(const QString &key, const QString &value1, const QString &unit1, const QString &value2, const QString &unit2, const QString &value3, const QString &unit3, int row, int col, int rowSpan, int colSpan,const QString &keyStyle, const QString &value1Style, const QString &unit1Style, const QString &value2Style, const QString &unit2Style, const QString &value3Style, const QString &unit3Style, QObject *parent = 0);

    QString key() const;
    QString value1()const;
    QString unit1()const;
    QString value2()const;
    QString unit2()const;
    QString value3()const;
    QString unit3()const;
    int row() const;
    int col() const;
    int rowSpan() const;
    int colSpan() const;
    QString keyStyle() const;
    QString value1Style() const;
    QString unit1Style() const;
    QString value2Style() const;
    QString unit2Style() const;
    QString value3Style() const;
    QString unit3Style() const;
    ~QTestParams();
signals:
public slots:
private:
    QString m_key, m_value1, m_unit1, m_value2, m_unit2, m_value3, m_unit3, m_keyStyle, m_value1Style, m_unit1Style, m_value2Style, m_unit2Style, m_value3Style, m_unit3Style;
    int m_row, m_col, m_rowSpan, m_colSpan;
};

#endif // QTESTPARAMS_H
