import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

 Item{
    id:testFooterRect
    anchors.bottom: parent.bottom
    height: 50
    anchors.left:parent.left
    anchors.right:parent.right

  Item{
        id: toggleButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: 40
        width: 40
        property alias imageSource: buttonImage.source
        signal selected()
        signal pushed()
        state: "off"
        onStateChanged: {
            if (state == "on") {
                selected()
            }
            else{
                pushed()
            }
        }
        Image {
            id: buttonImage
            smooth: true
            anchors.fill: parent
            ColorOverlay{
                anchors.fill: parent
                source: parent
                color: Universal.theme == Universal.Dark ? "white" : Universal.accent
            }
        }
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressed: {

                if (parent.state == "off") {
                    parent.state = "on"
                }
                else{
                    parent.state = "off"
                }
            }
        }
        states: [
            State {
                name: "on"
                PropertyChanges {
                    target: toggleButton
                    scale: 0.95
                    imageSource: "qrc:/img/img/stop-button.png"
                }
            },
            State {
                name: "off"
                PropertyChanges {
                    target: toggleButton
                    scale: 1/0.95
                    imageSource: "qrc:/img/img/play-button.png"
                }
            }
        ]
        transitions: [
            Transition {
                from: "off"
                to: "on"
                reversible: true
                PropertyAnimation {
                    target: toggleButton
                    properties: "scale"
                    duration: 100
                }
            }
        ]
    }

}
