import QtQuick 2.0
import QtQuick.Controls.Universal 2.1
//import QtGraphicalEffects 1.0

Rectangle {
    id: content
    height: 48
    color: Universal.theme === Universal.Light ? "#E6E7E8" : "#1A1A1A"

    Item{
        id: goBack
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
            onPressed: parent.opacity = 0.8
            onReleased: parent.opacity = 1
            onClicked: {
                if(navigationModel.navigationParameter.isHome){
                    navigationModel.currentView = navigationModel.getTargetView("_section", 1)
                    headerTitle = "Home"
                    sideMenu.selectedMenuIndex = 1
                }
                else{
                    navigationModel.currentView = navigationModel.getTargetView("back")
                }
            }
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
                menuPopup.open()
            }
            onPressed: parent.opacity = 0.5
            onReleased: parent.opacity = 1
        }
    }
}

