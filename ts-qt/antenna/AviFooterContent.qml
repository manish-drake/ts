import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Item{    
    property bool isCal: true
    id:testFooterRect
    anchors.bottom: parent.bottom
    height: 70
    anchors.left:parent.left
    anchors.right:parent.right
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        Item{
            Layout.fillWidth: true
        }
        Rectangle{
            Layout.alignment: Qt.AlignBottom
            height: 50
            width: 50
            radius: 25
            color: Universal.accent
            visible: isCal
            Image {
                id: setupImage
                anchors.centerIn: parent
                source: "qrc:/img/img/Settings-25.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: calPopup.open()
                onPressed: parent.opacity = 0.9
                onReleased: parent.opacity = 1
            }
        }
        Rectangle{
            id: toggleButton
            Layout.alignment: Qt.AlignBottom
            Layout.leftMargin: 10
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
                    onPressed: parent.opacity = 0.9
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
                onReleased: parent.opacity = 1
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
    }
}
