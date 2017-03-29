import QtQuick 2.0

Rectangle {
            height: 50
            color: "gray"
            Row {
                anchors.fill: parent
                spacing: 20
                anchors.leftMargin: 20
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    height: 30
                    width: 30
                    color: "red"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            popup.open()
                        }
                    }
                }
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    height: 30
                    width: 30
                    color: "green"
                }
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    height: 30
                    width: 30
                    color: "blue"
                }
            }
        }
