#ifndef CONTROLSATTACHEDTYPE_H
#define CONTROLSATTACHEDTYPE_H

#include <QObject>
#include <QString>

class ControlsAttachedType : public QObject
{
    Q_OBJECT
public:
    explicit ControlsAttachedType(QObject *parent = 0);
    Q_PROPERTY(QString style READ style WRITE setStyle)

signals:

public slots:
private:
    QString style();
    void setStyle(const QString &);
    QString m_style;
};

#endif // CONTROLSATTACHEDTYPE_H
