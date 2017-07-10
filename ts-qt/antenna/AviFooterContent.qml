import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item{    
    property bool isCal: true
    id:testFooterRect
    anchors.bottom: parent.bottom
    height: 80
    anchors.left:parent.left
    anchors.right:parent.right
    Rectangle{
        id: toggleButton
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 15
        height: 60
        width: 60
        radius: 30
        color: Universal.accent
        property alias imageSource: buttonImage.source
        state: "play"
        Image {
            id: buttonImage
            anchors.centerIn: parent
            smooth: true
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressed: {
                if (parent.state == "play") {
                    parent.state = "pause"
                }
                else if(parent.state == "pause"){
                    parent.state = "stop"
                }
                else{
                    parent.state = "play"
                }
            }
        }
        states: [
            State {
                name: "play"
                PropertyChanges {
                    target: toggleButton
                    imageSource: "qrc:/img/img/play-button.png"
                }
            },
            State {
                name: "stop"
                PropertyChanges {
                    target: toggleButton
                    imageSource: "qrc:/img/img/stop-button.png"
                }
            },
            State {
                name: "pause"
                PropertyChanges {
                    target: toggleButton
                    imageSource: "qrc:/img/img/pause-button.png"
                }
            }
        ]
    }
    Rectangle{
        id: calButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: toggleButton.left
        anchors.rightMargin: 15
        height: 50
        width: 50
        radius: 25
        color: Universal.accent
        visible: isCal
        Item{
            anchors.fill: parent
            Image {
                id: image1
                anchors.centerIn: parent
                source: "qrc:/img/img/Settings-25.png"
            }
            ColorOverlay{
                anchors.fill: image1
                source: image1
                color: "white"
            }
//          navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Short")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    calPopup.open()
                }
//                onPressed: parent.opacity = 0.5
//                onReleased: parent.opacity = 1
            }
        }
    }
}
