#ifndef dummygraphdata_H
#define dummygraphdata_H

#include <QObject>
#include <time.h>

class dummygraphdata : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<int> points READ points WRITE setPoints NOTIFY pointsChanged)
public:
    Q_INVOKABLE void refresh();
    explicit dummygraphdata(QObject *parent = 0);

    QList<int> points();
    void setPoints(QList<int> points);

protected:
    void timerEvent(QTimerEvent *event);
signals:
    void pointsChanged(QList<int> points);
public slots:
private:
    QList<int> m_points;
    QList<int> getRandPointsList(){
        QList<int> list;
        srand((unsigned)time(0));
        int random_integer;
        int lowest=0, highest=20, step = highest/2;
        int range=(highest-lowest)+1;
        for(int index=0; index<400; index++){
            random_integer = lowest+int(range*rand()/(RAND_MAX + 1.0));
            list.push_back(random_integer);

            lowest = (random_integer - step) < 0? 0: (random_integer - step);
            highest = (random_integer + step) > 255? 255: (random_integer + step);
        }
        return list;
    }

};
#endif // dummygraphdata_H
