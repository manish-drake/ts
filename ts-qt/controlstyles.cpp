#include "controlstyles.h"
#include <QFont>

ControlStyles ControlStyles::instance()
{
    static ControlStyles singleton;
    return singleton;
}

QHash<const char *, QVariant> ControlStyles::getStyleForType(const int styleId, const QString typeName)
{
    if(m_repository.contains(styleId)){
        auto styles = m_repository[styleId];
        if(styles.contains(typeName)){
            return styles[typeName];
        }
    }
    return QHash<const char *, QVariant>();
}

ControlStyles::ControlStyles()
{
    m_repository.insert(1, AddStyle1());
}

/*
#1 Add styles
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle1()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", AddStyleText1());
    return  styles;
}

/*
#1 Add styles for plain text
*/
QHash<const char *, QVariant> ControlStyles::AddStyleText1(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(15);
    style.insert("font", QVariant::fromValue(font));
    style.insert("color", QVariant::fromValue(QString("red")));

    return style;
}
