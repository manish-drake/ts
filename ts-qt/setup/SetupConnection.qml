import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Page {
    id: item1
    anchors.fill: parent
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.background
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("CONNECTION")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            color: Universal.foreground
        }

        Item{
            width: 40
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            Image {
                id: closeImage
                anchors.centerIn: parent
                source: "qrc:/img/img/Delete-25.png"
            }
            ColorOverlay{
                anchors.fill: closeImage
                source: closeImage
                color: Universal.foreground
            }
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
            }
        }
    }

    contentItem: Rectangle {
        color: Universal.background
        Flickable {
            anchors.fill: parent
            contentWidth: parent.width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 30

                Text {
                    text: qsTr("DEFAULT POWER:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    color: Universal.foreground
                }
                Text {
                    Layout.column: 1
                    text: qsTr("1dB")
                    font.pixelSize: 12
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    text: qsTr("DEFALT DISTANCE:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 1
                    Layout.column: 1
                    text: qsTr("25Ft")
                    font.pixelSize: 12
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 2
                    text: qsTr("DEFAULT CABLE LOSS:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 2
                    Layout.column: 1
                    text: qsTr("2.3dB")
                    font.pixelSize: 12
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    text: qsTr("UUT ANTENNA GAIN:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    Layout.column: 1
                    text: qsTr("0.0dB")
                    font.pixelSize: 12
                    color: Universal.foreground
                }
            }
        }
    }
}
