#include "controlstyles.h"
#include <QFont>

ControlStyles ControlStyles::instance()
{
    static ControlStyles singleton;
    return singleton;
}

QHash<const char *, QVariant> ControlStyles::getStyleForType(const QString &styleId, const QString &typeName) const
{
    if(m_repository.contains(styleId)){
        auto styles = m_repository[styleId];
        if(styles.contains(typeName)){
            return styles[typeName];
        }
    }
    return QHash<const char *, QVariant>();
}

QString &validateTypeName(QString &typeName)
{
    const QString QMLTYPE = "_QMLTYPE_";
    auto isQMLTYPE = typeName.indexOf(QMLTYPE);
    if(isQMLTYPE >= 0)
    {
        typeName = typeName.left(isQMLTYPE + QMLTYPE.length() -1);
    }
    return typeName;
}
ControlStyles::ControlStyles()
{
    m_repository.insert("l10", AddStyle_l0());
    m_repository.insert("l10", AddStyle_l10());
    m_repository.insert("l20", AddStyle_l20());
    m_repository.insert("l30", AddStyle_l30());
    m_repository.insert("l40", AddStyle_l40());
    m_repository.insert("l50", AddStyle_l50());
    m_repository.insert("l60", AddStyle_l60());
    m_repository.insert("l70", AddStyle_l70());

    m_repository.insert("v0", AddStyle_v0());
    m_repository.insert("v10", AddStyle_v10());
    m_repository.insert("v20", AddStyle_v20());
    m_repository.insert("v30", AddStyle_v30());
    m_repository.insert("v40", AddStyle_v40());
    m_repository.insert("v50", AddStyle_v50());
    m_repository.insert("v60", AddStyle_v60());
    m_repository.insert("v60r", AddStyle_v60r());
    m_repository.insert("v70", AddStyle_v70());
    m_repository.insert("v80", AddStyle_v80());
    m_repository.insert("v90", AddStyle_v90());

    m_repository.insert("u0", AddStyle_u0());
    m_repository.insert("u10", AddStyle_u10());
    m_repository.insert("u20", AddStyle_u20());
}
/*
#0 Add styles
Add styles for id = l0
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_l0()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", QQuickText_l0());
    return  styles;
}

/*
Add styles for id = l0, for QQuickText
*/

QHash<const char *, QVariant> ControlStyles::QQuickText_l0(){
    QHash<const char *, QVariant> style;

    style.insert("width", QVariant::fromValue(0));

    return style;
}

/*
#10 Add styles
Add styles for id = l10
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_l10()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", QQuickText_l10());
    return  styles;
}

/*
Add styles for id = l10, for QQuickText
*/

QHash<const char *, QVariant> ControlStyles::QQuickText_l10(){
    QHash<const char *, QVariant> style;

    style.insert("width", QVariant::fromValue(60));

    return style;
}

/*
#20 Add styles
Add styles for id = l20
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_l20()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", QQuickText_l20());
    return  styles;
}

/*
Add styles for id = l20, for QQuickText
*/

QHash<const char *, QVariant> ControlStyles::QQuickText_l20(){
    QHash<const char *, QVariant> style;

    style.insert("width", QVariant::fromValue(70));

    return style;
}

/*
#30 Add styles
Add styles for id = l30
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_l30()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", QQuickText_l30());
    return  styles;
}

/*
Add styles for id = l30, for QQuickRectangle
*/

QHash<const char *, QVariant> ControlStyles::QQuickText_l30(){
    QHash<const char *, QVariant> style;

    style.insert("width", QVariant::fromValue(90));
    return style;
}

/*
40 Add styles
Add styles for id = l40
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_l40()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", QQuickText_l40());
    return  styles;
}

/*
Add styles for id = l40, for QQuickText
*/
QHash<const char *, QVariant> ControlStyles::QQuickText_l40(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPixelSize(14);
    font.setWeight(font.DemiBold);
    style.insert("font", QVariant::fromValue(font));
    style.insert("width", QVariant::fromValue(135));
    return style;
}

/*
50 Add styles
Add styles for id = l50
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_l50()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", QQuickText_l50());
    return  styles;
}

/*
Add styles for id = l50, for QQuickText
*/
QHash<const char *, QVariant> ControlStyles::QQuickText_l50(){
    QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(95));
        return style;
    }

    /*
60 Add styles
Add styles for id = l60
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_l60()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_l60());
        return  styles;
    }

    /*
Add styles for id = l60, for QQuickText
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_l60(){
        QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(120));

        return style;
    }

    /*
l70 Add styles
Add styles for id = l70
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_l70()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_l70());
        return  styles;
    }

    /*
Add styles for id = l70, for QQuickRectangle
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_l70(){
        QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(140));
        return style;
    }


    //-----------------------------------------------------------------------------------

    /*
v0 Add styles
Add styles for id = v0
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v0()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v0());
        return  styles;
    }

    /*
Add styles for id = v0, for QQuickRectangle
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v0(){
        QHash<const char *, QVariant> style;
        style.insert("width", QVariant::fromValue(0));
        return style;
    }

    /*
v10 Add styles
Add styles for id = v10
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v10()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v10());
        return  styles;
    }

    /*
Add styles for id = v10, for QQuickRectangle
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v10(){
        QHash<const char *, QVariant> style;
        style.insert("width", QVariant::fromValue(60));
        style.insert("horizontalAlignment", QVariant::fromValue(3));
        return style;
    }

    /*
v20 Add styles
Add styles for id = v20
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v20()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v20());
        return  styles;
    }

    /*
Add styles for id = v20, for QQuickText
*/
    QHash<const char *, QVariant> ControlStyles::QQuickText_v20(){
        QHash<const char *, QVariant> style;

        QFont font;
        font.setPixelSize(16);
        font.setWeight(font.DemiBold);
        style.insert("font", QVariant::fromValue(font));
        style.insert("width", QVariant::fromValue(60));
        style.insert("horizontalAlignment", QVariant::fromValue(3));
        return style;
    }

    /*
v30 Add styles
Add styles for id = v30
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v30()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v30());
        return  styles;
    }

    /*
Add styles for id = v30, for QQuickText
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v30(){
        QHash<const char *, QVariant> style;
        style.insert("width", QVariant::fromValue(85));
        return style;
    }

    /*
v50 Add styles
Add styles for id = v40
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v40()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v40());
        return  styles;
    }

    /*
Add styles for id = v40, for QQuickText
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v40(){
        QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(90));
        return style;
    }

    /*
v50 Add styles
Add styles for id = v50
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v50()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v50());
        return  styles;
    }

    /*
Add styles for id = v50, for QQuickRectangle
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v50(){
        QHash<const char *, QVariant> style;
        style.insert("width", QVariant::fromValue(80));
        style.insert("horizontalAlignment", QVariant::fromValue(3));
        return style;
    }

    /*
v60 Add styles
Add styles for id = v60
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v60()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v60());
        return  styles;
    }

    /*
Add styles for id = v60, for QQuickRectangle
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v60(){
        QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(128));
        return style;
    }

    /*
v60r Add styles
Add styles for id = v60r
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v60r()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v60r());
        return  styles;
    }

    /*
Add styles for id = v60r, for QQuickRectangle
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v60r(){
        QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(128));
        style.insert("horizontalAlignment", QVariant::fromValue(3));
        return style;
    }


    /*
v70 Add styles
Add styles for id = v70
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v70()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v70());
        return  styles;
    }

    /*
Add styles for id = v70, for QQuickText
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v70(){
        QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(100));
        style.insert("horizontalAlignment", QVariant::fromValue(3));
        return style;
    }

    /*
v80 Add styles
Add styles for id = v80
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v80()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v80());
        return  styles;
    }

    /*
Add styles for id = v80, for QQuickText
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v80(){
        QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(100));


        return style;
    }

    /*
v90 Add styles
Add styles for id = v90
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_v90()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_v90());
        return  styles;
    }

    /*
Add styles for id = v90, for QQuickText
*/

    QHash<const char *, QVariant> ControlStyles::QQuickText_v90(){
        QHash<const char *, QVariant> style;

        style.insert("width", QVariant::fromValue(190));

        style.insert("horizontalAlignment", QVariant::fromValue(3));
        return style;
    }
    //--------------------------------------------------------------------------------
    /*
u0 Add styles
Add styles for id = u0
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_u0()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_u0());
        return  styles;
    }

    /*
Add styles for id = u0, for QQuickText
*/
    QHash<const char *, QVariant> ControlStyles::QQuickText_u0(){
        QHash<const char *, QVariant> style;
        style.insert("width", QVariant::fromValue(0));
        return style;
    }
    /*
u10 Add styles
Add styles for id = u10
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_u10()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_u10());
        return  styles;
    }

    /*
Add styles for id = u10, for QQuickText
*/
    QHash<const char *, QVariant> ControlStyles::QQuickText_u10(){
        QHash<const char *, QVariant> style;
        style.insert("width", QVariant::fromValue(10));
        return style;
    }

    /*
u20 Add styles
Add styles for id = u20
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_u20()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_u20());
        return  styles;
    }

    /*
Add styles for id = u20, for QQuickText
*/
    QHash<const char *, QVariant> ControlStyles::QQuickText_u20(){
        QHash<const char *, QVariant> style;

        QFont font;
        font.setPixelSize(14);
        font.setWeight(font.DemiBold);
        style.insert("font", QVariant::fromValue(font));
        style.insert("width", QVariant::fromValue(10));
        return style;
    }


    /*
u30 Add styles
Add styles for id = u30
*/
    QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle_u30()
    {
        QHash<QString, QHash<const char *, QVariant> > styles;
        styles.insert("QQuickText", QQuickText_u30());
        return  styles;
    }

    /*
Add styles for id = u30, for QQuickText
*/
    QHash<const char *, QVariant> ControlStyles::QQuickText_u30(){
        QHash<const char *, QVariant> style;
        style.insert("width", QVariant::fromValue(20));
        return style;
    }



    /*
Add styles for id = l10, for QQuickText
*/
    //QHash<const char *, QVariant> ControlStyles::QQuickText_l10(){
    //    QHash<const char *, QVariant> style;

    //    QFont font;
    //    font.setPixelSize(16);
    //    style.insert("font", QVariant::fromValue(font));
    //    return style;
    //}








