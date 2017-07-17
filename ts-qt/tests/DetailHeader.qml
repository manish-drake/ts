import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Rectangle{
    height: 58
    anchors.left: parent.left
    anchors.right: parent.right
    color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
    Item{
        anchors.left: parent.left
        anchors.leftMargin: 5
        height: 48
        width: 48
        Image {
            id:leftImg
            anchors.centerIn: parent
            source: "qrc:/img/img/left.png"
        }
        ColorOverlay{
            anchors.fill: leftImg
            source: leftImg
            color: Universal.accent
        }
        MouseArea {
            anchors.fill: parent
            onPressed: parent.opacity = 0.8
            onReleased: parent.opacity = 1
            onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
        }
    }
    PageIndicator {
        id: pageIndicator
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        count: 7
        currentIndex: summaryModel.currentPage
    }
    Text {
        id: testDetailTitleText
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: navigationModel.navigationParameter.title
        font.pixelSize: 22
        font.weight: Font.Black
        font.family: robotoRegular.name
        color: Universal.foreground
        opacity: 0.7
    }
    ColorOverlay{
        anchors.fill: pageIndicator
        source: pageIndicator
        color: Universal.foreground
        visible: Universal.theme == Universal.Dark
    }
    Item{
        anchors.right: parent.right
        anchors.leftMargin: 5
        height: 48
        width: 48
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
            onPressed: parent.opacity = 0.8
            onReleased: parent.opacity = 1
            onClicked: {}
        }
    }
}
