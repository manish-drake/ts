import QtQuick 2.6
import QtQuick.Controls 2.1


Rectangle{
    id:itemOption
    height: 50
    width: 160
    property alias source: image.source
    property alias text: switchDelegate.text

    SwitchDelegate {
        id:switchDelegate
        checked: false
        font.pixelSize: 14
        indicator: Image {
            id: image
            opacity:  parent.checked ? 0.3 : 1.0
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left;
            anchors.leftMargin: 10
        }
        contentItem: Text {
            rightPadding: parent.spacing
            text: parent.text
            font: parent.font
            opacity: parent.checked ? 0.3 : 1.0
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.left:parent.indicator.right
            anchors.leftMargin: 10            
        }
        background: Rectangle {
            implicitWidth: 160
            implicitHeight: 50
            visible: parent.down || parent.highlighted
            color: parent.down ? "#FFEFEFEF" : "#00000000"
        }
    }
}
