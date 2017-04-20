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
    m_repository.insert(0, AddStyle0());
    m_repository.insert(100, AddStyleCompositeControl100());
    m_repository.insert(200, AddStyleCompositeControl200());
    m_repository.insert(300, AddStyleCompositeControl300());
    m_repository.insert(400, AddStyleCompositeControl400());
    m_repository.insert(500, AddStyleCompositeControl500());
    m_repository.insert(600, AddStyleCompositeControl600());
    m_repository.insert(700, AddStyleCompositeControl700());
    m_repository.insert(800, AddStyleCompositeControl800());
    m_repository.insert(900, AddStyleCompositeControl900());
    m_repository.insert(1000, AddStyleCompositeControl1000());
    m_repository.insert(1100, AddStyleCompositeControl1100());
    m_repository.insert(1200, AddStyleCompositeControl1200());
    m_repository.insert(1300, AddStyleCompositeControl1300());
    m_repository.insert(1400, AddStyleCompositeControl1400());
    m_repository.insert(1500, AddStyleCompositeControl1500());
    m_repository.insert(1600, AddStyleCompositeControl1600());
    m_repository.insert(1700, AddStyleCompositeControl1700());
    m_repository.insert(1800, AddStyleCompositeControl1800());
    m_repository.insert(1900, AddStyleCompositeControl1900());
    m_repository.insert(2000, AddStyleCompositeControl2000());
    m_repository.insert(2100, AddStyleCompositeControl2100());
    m_repository.insert(2200, AddStyleCompositeControl2200());
    m_repository.insert(2300, AddStyleCompositeControl2300());

}

/*
#0 Add styles
Add styles for id = 0
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyle0()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("QQuickText", AddStyleText0());
    return  styles;
}

/*
Add styles for id = 0, for QQuickText
*/

QHash<const char *, QVariant> ControlStyles::AddStyleText0(){
    QHash<const char *, QVariant> style;
    QFont font;
    font.setPointSize(10);
    style.insert("font", QVariant::fromValue(font));
    style.insert("color", QVariant::fromValue(QString("#B0B0B0")));
    return style;
}
/*
#100 Add styles
Add styles for id = 100
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl100()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE100());
    return  styles;
}
/*
Add styles for id = 100, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE100(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(60));
    style.insert("valueWidth", QVariant::fromValue(60));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#200 Add styles
Add styles for id = 200
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl200()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE200());
    return  styles;
}
/*
Add styles for id = 200, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE200(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(70));
    style.insert("valueWidth", QVariant::fromValue(85));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#300 Add styles
Add styles for id = 300
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl300()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE300());
    return  styles;
}
/*
Add styles for id = 300, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE300(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(70));
    style.insert("valueWidth", QVariant::fromValue(60));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#400 Add styles
Add styles for id = 400
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl400()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE400());
    return  styles;
}
/*
Add styles for id = 400, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE400(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(70));
    style.insert("valueWidth", QVariant::fromValue(135));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#500 Add styles
Add styles for id = 500
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl500()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE100());
    return  styles;
}
/*
Add styles for id = 500, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE500(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(70));
    style.insert("valueWidth", QVariant::fromValue(100));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#600 Add styles
Add styles for id = 600
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl600()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE600());
    return  styles;
}
/*
Add styles for id = 600, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE600(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(110));
    style.insert("valueWidth", QVariant::fromValue(85));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#700 Add styles
Add styles for id =700
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl700()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE700());
    return  styles;
}
/*
Add styles for id = 700, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE700(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(110));
    style.insert("valueWidth", QVariant::fromValue(135));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#800 Add styles
Add styles for id = 800
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl800()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE800());
    return  styles;
}
/*
Add styles for id = 800, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE800(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(110));
    style.insert("valueWidth", QVariant::fromValue(128));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#900 Add styles
Add styles for id = 900
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl900()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE900());
    return  styles;
}
/*
Add styles for id = 900, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE900(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(110));
    style.insert("valueWidth", QVariant::fromValue(60));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#1000 Add styles
Add styles for id = 1000
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1000()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1000());
    return  styles;
}
/*
Add styles for id = 1000, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1000(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(true);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(133));
    style.insert("valueWidth", QVariant::fromValue(133));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#1100 Add styles
Add styles for id = 1100
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1100()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1100());
    return  styles;
}
/*
Add styles for id = 1100, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1100(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(true);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(133));
    style.insert("valueWidth", QVariant::fromValue(60));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#1200 Add styles
Add styles for id = 1200
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1200()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1200());
    return  styles;
}
/*
Add styles for id = 1200, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1200(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(140));
    style.insert("valueWidth", QVariant::fromValue(135));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#1300 Add styles
Add styles for id = 1300
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1300()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1300());
    return  styles;
}
/*
Add styles for id = 1300, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1300(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(140));
    style.insert("valueWidth", QVariant::fromValue(128));
    style.insert("unitWidth", QVariant::fromValue(35));


    return style;
}

/*
#1400 Add styles
Add styles for id = 1400
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1400()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1400());
    return  styles;
}
/*
Add styles for id = 1400, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1400(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(140));
    style.insert("valueWidth", QVariant::fromValue(85));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#1500 Add styles
Add styles for id = 1500
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1500()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1500());
    return  styles;
}
/*
Add styles for id = 1500, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1500(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(140));
    style.insert("valueWidth", QVariant::fromValue(90));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#1600 Add styles
Add styles for id = 1600
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1600()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1600());
    return  styles;
}
/*
Add styles for id = 1600, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1600(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(410));
    style.insert("valueWidth", QVariant::fromValue(85));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#1700 Add styles
Add styles for id = 1700
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1700()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1700());
    return  styles;
}
/*
Add styles for id = 1700, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1700(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(140));
    style.insert("valueWidth", QVariant::fromValue(135));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}


/*
#1800 Add styles
Add styles for id = 1800
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1800()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1800());
    return  styles;
}
/*
Add styles for id = 1800, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1800(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(140));
    style.insert("valueWidth", QVariant::fromValue(100));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}


/*
#1900 Add styles
Add styles for id = 1900
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl1900()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE1900());
    return  styles;
}
/*
Add styles for id = 1900, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE1900(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(140));
    style.insert("valueWidth", QVariant::fromValue(135));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#2000 Add styles
Add styles for id = 2000
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl2000()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE2000());
    return  styles;
}
/*
Add styles for id = 2000, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE2000(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(150));
    style.insert("valueWidth", QVariant::fromValue(135));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#2100 Add styles
Add styles for id = 2100
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl2100()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE2100());
    return  styles;
}
/*
Add styles for id = 2100, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE2100(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(150));
    style.insert("valueWidth", QVariant::fromValue(128));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#2200 Add styles
Add styles for id = 2200
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl2200()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE2200());
    return  styles;
}
/*
Add styles for id = 2200, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE2200(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(150));
    style.insert("valueWidth", QVariant::fromValue(85));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}

/*
#2300 Add styles
Add styles for id = 2300
*/
QHash<QString, QHash<const char *, QVariant> > ControlStyles::AddStyleCompositeControl2300()
{
    QHash<QString, QHash<const char *, QVariant> > styles;
    styles.insert("CompositeControl_QMLTYPE", AddStyleCompositeControl_QMLTYPE2300());
    return  styles;
}
/*
Add styles for id = 2300, for CompositeControl_QMLTYPE
*/
QHash<const char *, QVariant> ControlStyles::AddStyleCompositeControl_QMLTYPE2300(){
    QHash<const char *, QVariant> style;

    QFont font;
    font.setPointSize(10);
    font.setBold(false);
    style.insert("keyFont", QVariant::fromValue(font));
    style.insert("keyWidth", QVariant::fromValue(210));
    style.insert("valueWidth", QVariant::fromValue(210));
    style.insert("unitWidth", QVariant::fromValue(35));

    return style;
}




