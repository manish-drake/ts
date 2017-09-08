import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    id:itemOption
    height: 50
    anchors.left: parent.left
    anchors.right: parent.right
    property alias source: image.source
    property alias text: switchDelegate.text
    property bool isChecked
    SwitchDelegate {
        id:switchDelegate
        anchors.left: parent.left
        anchors.right: parent.right
        checked: isChecked
        font.pixelSize: 14
        indicator:
            Item{
            width: 50
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            opacity:  switchDelegate.checked ? 1.0 : 0.35
            Image{
                id: image
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                asynchronous: true
            }
        }
        contentItem: Text {
            text: parent.text
            font: parent.font
            opacity: switchDelegate.checked ? 1.0 : 0.5
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.left:parent.indicator.right
            anchors.leftMargin: 10
            color: Universal.foreground
        }
    }
}
