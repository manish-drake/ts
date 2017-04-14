import QtQuick 2.0

Rectangle {
    height: 50
    color: "#377DF3"

    Rectangle {
        id: toggleMenu
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 50
        color: "transparent"

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/img/Menu-25.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                sideMenuPopup.open()
            }
            onPressed: parent.opacity = 0.5
            onReleased: parent.opacity = 1
        }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: toggleMenu.right
        anchors.right: toggleConfigPanel.left
        text: "Start"
        font.bold: Font.DemiBold
        color: "#ffffff"
        font.pointSize: 12
        anchors.leftMargin: 5
        elide: Text.ElideRight
    }

    Rectangle {
        id: toggleConfigPanel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 50
        color: "transparent"
        Image {
            id: imageCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/img/Circled Chevron Down-30.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                configPanelPopup.open()
            }
            onPressed: parent.opacity = 0.5
            onReleased: parent.opacity = 1
        }
    }
    Rectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 50
        color: "transparent"
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:  parent.verticalCenter
            spacing: 3
            Rectangle{
                color:"#ffffff"
                height: 5
                width: 5
                radius: 2
            }
            Rectangle{
                color:"#ffffff"
                height: 5
                width: 5
                radius: 2
            }
            Rectangle{
                color:"#ffffff"
                height: 5
                width: 5
                radius: 2
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                moreActionsPopover.open()
                console.log("TODO: add code for right menu");
            }
            onPressed: parent.opacity = 0.5
            onReleased: parent.opacity = 1
        }
    }
}
