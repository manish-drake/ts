#ifndef CONTROLSATTACHEDTYPE_H
#define CONTROLSATTACHEDTYPE_H

#include <QObject>

class ControlsAttachedType : public QObject
{
    Q_OBJECT
public:
    explicit ControlsAttachedType(QObject *parent = 0);
    Q_PROPERTY(int style READ style WRITE setStyle)

signals:

public slots:
private:
    int style();
    void setStyle(const int);
    int m_style;
};

#endif // CONTROLSATTACHEDTYPE_H
