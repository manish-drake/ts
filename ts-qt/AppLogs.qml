import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Rectangle{
    anchors.fill: parent
    anchors.margins: 10
    color: Universal.background
    border.color: "#0d000000"
    border.width: 1
    radius: 3
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 1.1
        verticalOffset: 1.1
        radius: 4.0
        color: "#26000000"
        spread: 0
    }

    Page {
        anchors.fill: parent
        header: Rectangle{
            height: 40
            anchors.left:parent.left
            anchors.right:parent.right
            color: Universal.background

            Item{
                width: 50
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                Image {
                    id: image1
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Upload to the Cloud-25.png"
                }
                ColorOverlay{
                    anchors.fill: image1
                    source: image1
                    color: Universal.foreground
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:{}
                }
            }

            Text {
                id: testTitle
                anchors.centerIn: parent
                text: qsTr("App Logs")
                font.pointSize: 12
                font.weight: Font.DemiBold
                color: Universal.foreground
            }

            Item{
                width: 50
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
                Column {
                    id: grid
                    y: 15
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 12
                    spacing: 10
                    RowLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text {
                            Layout.fillWidth: true
                            text: qsTr("MESSAGE")
                            font.pixelSize: 12
                            font.bold: Font.Medium
                            color: Universal.foreground
                        }
                        Text {
                            Layout.column: 1
                            text: qsTr("TYPE")
                            font.pixelSize: 12
                            font.bold: Font.Medium
                            color: Universal.foreground
                        }
                    }
                    Repeater{
                        model: 1
                        RowLayout{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            spacing: 10
                            Text {
                                Layout.fillWidth: true
                                text: qsTr("App Log Message..")
                                font.pixelSize: 12
                                color: Universal.foreground
                                wrapMode: Text.Wrap
                                clip: true
                            }
                            Text {
                                Layout.column: 1
                                Layout.alignment: Qt.AlignTop
                                text: qsTr("Debug")
                                font.pixelSize: 12
                                color: Universal.foreground
                            }
                        }
                    }
                }
            }
        }
    }
}

