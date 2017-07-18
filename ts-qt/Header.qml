import QtQuick 2.0
import QtQuick.Controls.Universal 2.1
//import QtGraphicalEffects 1.0

Rectangle {
    id: content
    height: 48
    color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"

    Item{
        id: toggleMenu
        visible: isMenuView
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: 50
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
            anchors.fill: parent
            onClicked: {
                sideMenuDrawer.open()
            }
            onPressed: parent.opacity = 0.8
            onReleased: parent.opacity = 1
        }
    }
    Item{
        id: goBack
        visible: !isMenuView
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: 50
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
            anchors.fill: parent
            onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
            onPressed: parent.opacity = 0.8
            onReleased: parent.opacity = 1
        }
    }

    Text {
        id: headerTitleText
        text: headerTitle
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 60
        anchors.right: parent.right
        anchors.rightMargin: 40
        font.bold: Font.DemiBold
        color: Universal.accent
        font.pixelSize: 18
        font.family: robotoRegular.name
        elide: Text.ElideRight
    }

//         Item{
//            id: toggleConfigPanel
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.top: parent.top
//            anchors.bottom: parent.bottom
//            width: 50
//            Image {
//                id: imageCenter
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:/img/img/Circled Chevron Down-30.png"
//            }
////            ColorOverlay{
////                anchors.fill: imageCenter
////                source: imageCenter
////                color: Universal.accent
////            }
//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    configPanelPopup.open()
//                }
//                onPressed: parent.opacity = 0.5
//                onReleased: parent.opacity = 1
//            }
//        }
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
