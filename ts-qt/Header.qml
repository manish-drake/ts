import QtQuick 2.0

Rectangle {
    height: 50
    color: "#377DF3"

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            height: 30
            width: 80
            color: "transparent"

            Image {
                id: imageStart
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/start.png"
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: imageStart.right
                text:"Start"
                font.bold: true
                color: "#ffffff"
                font.pointSize: 10
                anchors.leftMargin: 10
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    popup.open()
                }
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
            }
        }
        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            height: 30
            width: 30
            color: "transparent"
            Image {
                id: imageCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/centermenu.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    popupCenter.open()
                }
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
            }
        }
        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right

            height: 30
            width: 30
            color: "transparent"
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
                  console.log("TODO: add code for right menu");
                }
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
            }
        }

}
