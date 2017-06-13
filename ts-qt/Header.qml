import QtQuick 2.0
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0

Rectangle {
    id: content
    height: 48
    color: Universal.accent
    ColorOverlay{
        anchors.fill: content
        source: content
        color: "#33000000"
        visible: Universal.theme == Universal.Dark
    }

    Item{
        id: toggleMenu
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 50
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
        id: headerTitleText
        text: headerTitle
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: toggleMenu.right
        anchors.right: toggleConfigPanel.left
        font.bold: Font.DemiBold
        color: "#ffffff"
        font.pointSize: 12
        anchors.leftMargin: 5
        elide: Text.ElideRight
    }

     Item{
        id: toggleConfigPanel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 50
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
     Item{
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 50
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
