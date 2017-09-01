import QtQuick 2.0
import QtQuick.Controls.Universal 2.1
//import QtGraphicalEffects 1.0

Rectangle {
    id: content
    height: 55
    color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
    Rectangle{
        id: toggleMenu
        visible: navigationModel.isSideMenuAvailable
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 70
        color: toggleMenuMouseArea.pressed ? "#80aaaaaa" : "transparent"
        Image {
            id:toggleMenuImg
            anchors.centerIn: parent
            source: "qrc:/img/img/Menu-25.png"
        }
//        ColorOverlay{
//            anchors.fill: toggleMenuImg
//            source: toggleMenuImg
//            color: Universal.accent
//        }
        MouseArea {
            id: toggleMenuMouseArea
            anchors.fill: parent            
            onPressed: parent.opacity = 0.1
            onReleased: parent.opacity = 1
            onClicked: sideMenuDrawer.open()
        }
    }
    Rectangle{
        id: goBack
        visible: !navigationModel.isSideMenuAvailable
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: 70
        color: backMouseArea.pressed ? "#80aaaaaa" : "transparent"
        Image {
            id:leftImg
            anchors.centerIn: parent
            source: "qrc:/img/img/left.png"
        }
//        ColorOverlay{
//            anchors.fill: leftImg
//            source: leftImg
//            color: Universal.accent
//        }
        MouseArea {
            id: backMouseArea
            anchors.fill: parent
            onPressed: parent.opacity = 0.1
            onReleased: parent.opacity = 1
            onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
        }
    }

    Text {
        id: headerTitleText
        text: headerTitle
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 70
        anchors.right: parent.right
        anchors.rightMargin: 40
        font.bold: Font.DemiBold
        color: Universal.accent
        font.pixelSize: 18
        font.family: robotoRegular.name
        elide: Text.ElideRight
    }
    Rectangle{
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 70
        color: menuMouseArea.pressed ? "#80aaaaaa" : "transparent"
        Column{
            anchors.centerIn: parent
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
            onPressed: parent.opacity = 0.1
            onReleased: parent.opacity = 1            
            onClicked: {
                menuPopup.open()
                console.log("TODO: add code for right menu");
            }
        }
    }
}
