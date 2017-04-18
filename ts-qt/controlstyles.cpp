#include "controlstyles.h"
#include <QFont>

ControlStyles ControlStyles::instance()
{
    static ControlStyles singleton;
    return singleton;
}

QHash<const char *, QVariant> ControlStyles::getStyleForType(const int &styleId, const QString &typeName) const
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
    m_repository.insert(0, AddStyle0());
    m_repository.insert(1, AddStyle1());
}

/*
#0 Add styles
Add styles for id = 0
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle0() const
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", AddStyleText0());
    return  styles;
}

/*
Add styles for id = 0, for QQuickText
*/
QHash<const char *, QVariant> ControlStyles::AddStyleText0() const {
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    style.insert("font", QVariant::fromValue(font));

    return style;
}

/*
#1 Add styles
Add styles for id = 1
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle1() const
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", AddStyleText1());
    return  styles;
}

/*
Add styles for id = 1, for QQuickText
*/
QHash<const char *, QVariant> ControlStyles::AddStyleText1() const {
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    style.insert("font", QVariant::fromValue(font));
    style.insert("color", QVariant::fromValue(QString("#B0B0B0")));

    return style;
}

