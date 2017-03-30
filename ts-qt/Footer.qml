import QtQuick 2.0

Rectangle {
    height: 50
    color: "#FFFFFF"
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        height: 30
        width: 80
        color: "transparent"

        Text {
            anchors.verticalCenter: parent.verticalCenter            
            text:"Operator"
            font.capitalization: Font.AllUppercase
            fontSizeMode: Text.HorizontalFit
            color: "#000000"
            font.pointSize: 10
            anchors.leftMargin: 10
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        height: 30
        width: 30
        color: "transparent"
        Image {
            id: imageCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/img/centermenu.png"
        }

    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

        height: 30
        width: 30
        color: "transparent"

    }
}
