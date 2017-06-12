import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item {
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
        GridLayout{
            anchors.fill: parent
             Item{
                id: header
                Layout.row: 0
                Layout.fillWidth: true
                height:40
                Text {
                    anchors.centerIn: parent
                    text: qsTr("RUN MANUAL BIT")
                    elide:Text.ElideRight
                    font.pointSize: 13
                    font.weight: Font.DemiBold
                    color: Universal.foreground
                }
                 Item{
                    id: rectangle
                    width: 40
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    Image {
                        id: closeImage
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/img/img/Delete-25.png"
                    }
                    ColorOverlay{
                        anchors.fill: closeImage
                        source: closeImage
                        color: Universal.foreground
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
                Layout.row: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                boundsBehavior: Flickable.StopAtBounds
                GridLayout {
                    id: grid
                    y: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    rowSpacing: 25
                    columnSpacing: 30

                    Text {
                        Layout.row: 0
                        Layout.column: 0
                        text: qsTr("CPU:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 0
                        Layout.column: 1
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 0
                        Layout.column: 2
                        text: qsTr("CALIBRATION:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 0
                        Layout.column: 3
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 1
                        Layout.column: 0
                        text: qsTr("DSP:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 1
                        Layout.column: 1
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 1
                        Layout.column: 2
                        text: qsTr("RTC:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 1
                        Layout.column: 3
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 2
                        Layout.column: 0
                        text: qsTr("FPGA:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 2
                        Layout.column: 1
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 2
                        Layout.column: 2
                        text: qsTr("POWER:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 2
                        Layout.column: 3
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }


                    Text {
                        Layout.row: 3
                        Layout.column: 0
                        text: qsTr("MEMORY:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 3
                        Layout.column: 1
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 3
                        Layout.column: 2
                        text: qsTr("ETC:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                    }
                    Text {
                        Layout.row: 3
                        Layout.column: 3
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 4
                        Layout.column: 0
                        text: qsTr("RF PATH:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 4
                        Layout.column: 1
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 4
                        Layout.column: 2
                        text: qsTr("ETC:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Text {
                        Layout.row: 4
                        Layout.column: 3
                        text: qsTr("PASS")
                        font.pixelSize: 12
                        color: Universal.foreground
                    }

                }
            }
        }
    }
}
