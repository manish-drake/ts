#include "controlsattachedtype.h"
#include "controlstyles.h"

ControlsAttachedType::ControlsAttachedType(QObject *parent) :
    QObject(parent)
{

}

QString ControlsAttachedType::style()
{
    return this->m_style;
}

void ControlsAttachedType::setStyle(const QString &style)
{
    QString typeName = this->parent()->metaObject()->className();
    typeName = validateTypeName(typeName);
    auto styleHash = ControlStyles::instance()
            .getStyleForType(style, typeName);
    for(auto propertyName: styleHash.keys()){
        this->parent()->setProperty(propertyName, styleHash[propertyName]);
    }
    this->m_style = style;
}

