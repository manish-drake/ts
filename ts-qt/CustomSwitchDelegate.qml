import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0

Item{
    id:itemOption
    height: 50
    width: parent.width
    property alias source: image.source
    property alias text: switchDelegate.text
    SwitchDelegate {
        id:switchDelegate
        width: parent.width
        checked: false
        font.pixelSize: 14
        indicator:
            Item{
            width: 50
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Image {
                id: image
                opacity:  switchDelegate.checked ? 0.4 : 1.0
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                ColorOverlay{
                    anchors.fill: parent
                    source: parent
                    color: Universal.foreground
                }
            }
        }
        contentItem: Text {
            rightPadding: parent.spacing
            text: parent.text
            font: parent.font
            opacity: switchDelegate.checked ? 0.4 : 1.0
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.left:parent.indicator.right
            anchors.leftMargin: 10
            color: Universal.foreground
        }
    }
}
