import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    Rectangle{
        anchors.fill: parent
        anchors.margins: 10
        clip: true
        border.color: "#0d000000"
        border.width: 1
        radius: 5
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#0d000000"
            spread: 0
        }
        Column{
            anchors.fill: parent
            Rectangle{
                id: header
                anchors.left: parent.left
                anchors.right: parent.right
                height:40
                color:"transparent"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("CONNECTION")
                    elide:Text.ElideRight
                    font.pointSize: 13
                    font.weight: Font.DemiBold
                    clip:true
                }
                Rectangle{
                    id: rectangle
                    width: 40
                    height: parent.height
                    anchors.right: parent.right
                    color:"transparent"
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/img/img/Delete-25.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                        }
                    }
                }
            }

            Flickable {
                width: parent.width;
                anchors.top: header.bottom
                anchors.bottom: parent.bottom
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                clip: true

                GridLayout {
                    id: grid
                    y: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    rowSpacing: 25
                    columnSpacing: 30

                    Text {
                        text: qsTr("DEFAULT POWER:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                    }
                    Text {
                        Layout.column: 1
                        text: qsTr("1dB")
                        font.pixelSize: 12
                    }

                    Text {
                        Layout.row: 1
                        text: qsTr("DEFALT DISTANCE:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                    }
                    Text {
                        Layout.row: 1
                        Layout.column: 1
                        text: qsTr("25Ft")
                        font.pixelSize: 12
                    }

                    Text {
                        Layout.row: 2
                        text: qsTr("DEFAULT CABLE LOSS:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                    }
                    Text {
                        Layout.row: 2
                        Layout.column: 1
                        text: qsTr("2.3dB")
                        font.pixelSize: 12
                    }

                    Text {
                        Layout.row: 3
                        text: qsTr("UUT ANTENNA GAIN:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                    }

                    Text {
                        Layout.row: 3
                        Layout.column: 1
                        text: qsTr("0.0dB")
                        font.pixelSize: 12
                    }
                }
            }
        }
    }
}
