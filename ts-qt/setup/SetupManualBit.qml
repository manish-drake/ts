import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Universal 2.1

Page {
    id: item1
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("RUN MANUAL BIT")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
        }
    }

    contentItem: Rectangle {
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Flickable {
            anchors.fill: parent
            contentWidth: width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 15

                Text {
                    Layout.row: 0
                    Layout.column: 0
                    text: qsTr("CPU")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 0
                    Layout.column: 1
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 0
                    Layout.column: 2
                    text: qsTr("CALIBRATION")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 0
                    Layout.column: 3
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    Layout.column: 0
                    text: qsTr("DSP")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 1
                    Layout.column: 1
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    Layout.column: 2
                    text: qsTr("RTC")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 1
                    Layout.column: 3
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 2
                    Layout.column: 0
                    text: qsTr("FPGA")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 2
                    Layout.column: 1
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 2
                    Layout.column: 2
                    text: qsTr("POWER")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 2
                    Layout.column: 3
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }


                Text {
                    Layout.row: 3
                    Layout.column: 0
                    text: qsTr("MEMORY")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 3
                    Layout.column: 1
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    Layout.column: 2
                    text: qsTr("ETC")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                }
                Text {
                    Layout.row: 3
                    Layout.column: 3
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 4
                    Layout.column: 0
                    text: qsTr("RF PATH")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 4
                    Layout.column: 1
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 4
                    Layout.column: 2
                    text: qsTr("ETC")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 4
                    Layout.column: 3
                    text: qsTr("PASS")
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
            }
        }
    }
}
