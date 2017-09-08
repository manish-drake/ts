import QtQuick 2.5
import QtQuick.Controls.Universal 2.1

Rectangle {
    id: content
    height: 55
    color: Universal.theme === Universal.Light ? "#E6E7E8" : "#1A1A1A"

    Rectangle{
        id: goBack
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 70
        color: backMouseArea.pressed ? "#80aaaaaa" : "transparent"
        Image{
            id:leftImg
            anchors.centerIn: parent
            source: "qrc:/img/img/left.png"
            asynchronous: true
        }
        MouseArea {
            id: backMouseArea
            anchors.fill: parent
            onPressed: parent.opacity = 0.4
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
        anchors.leftMargin: 70
        anchors.right: parent.right
        anchors.rightMargin: 70
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
            onPressed: parent.opacity = 0.4
            onReleased: parent.opacity = 1            
            onClicked: menuPopup.open()
        }
    }
}

