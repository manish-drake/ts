import QtQuick 2.0
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0

Rectangle {
    id: content
    height: 48
    color: Universal.background

    Item{
        id: toggleMenu
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 50
        Image {
            id:toggleMenuImg
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/img/Menu-25.png"
        }
        ColorOverlay{
            anchors.fill: toggleMenuImg
            source: toggleMenuImg
            color: Universal.accent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                sideMenuDrawer.open()
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
        color: Universal.accent
        font.pixelSize: 16
        font.family: robotoFont.name
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
        ColorOverlay{
            anchors.fill: imageCenter
            source: imageCenter
            color: Universal.accent
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
