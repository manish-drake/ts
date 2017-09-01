import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Rectangle{
    height: 58
    anchors.left: parent.left
    anchors.right: parent.right
    color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
    property string title: "VSWR"
    Text {
        anchors.centerIn: parent
        text: title
        font.pixelSize: 20
        font.weight: Font.Black
        font.family: robotoRegular.name
        color: Universal.foreground
        opacity: 0.7
    }
    Rectangle{
        anchors.right: parent.right
        anchors.leftMargin: 5
        height: 55
        width: 70
        color: menuMouseArea.pressed ? "#80aaaaaa" : "transparent"
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:  parent.verticalCenter
            spacing: 3
            Rectangle{
                color:Universal.accent
                height: 5
                width: 5
                radius: 2
            }
            Rectangle{
                color:Universal.accent
                height: 5
                width: 5
                radius: 2
            }
            Rectangle{
                color:Universal.accent
                height: 5
                width: 5
                radius: 2
            }
        }
        MouseArea {
            id: menuMouseArea
            anchors.fill: parent
            onPressed: parent.opacity = 0.5
            onReleased: parent.opacity = 1
            onClicked: menuPopup.open()
        }
    }
}

