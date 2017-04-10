import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    Rectangle {
        id: rectangle
        color: "#f4f4f4"
        anchors.fill: parent
        anchors.topMargin: 6
        anchors.leftMargin: 6

        Rectangle {
            id:card
            color:"#ffffff"
            width: parent.width-6
            height: parent.height-6
            border.color: "Lightgray"
            border.width: 0.5
            radius: 5


            Text {
                id: text9
                text: qsTr("connection")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                font.bold: Font.DemiBold
                font.family: "Arial"
            }

            GridLayout {
                y: 70
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.right: parent.right
                anchors.rightMargin: 50
                rows: 4
                columns: 2
                rowSpacing: 20

                Text {
                    id: text1
                    text: qsTr("default power:")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: "Arial"
                }

                Text {
                    id: text5
                    text: qsTr("1dB")
                    font.capitalization: Font.MixedCase
                    font.pixelSize: 12
                    Layout.column: 1
                    font.family: "Arial"
                }

                Text {
                    id: text2
                    text: qsTr("default distance:")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    Layout.row: 1
                    font.family: "Arial"
                }

                Text {
                    id: text6
                    text: qsTr("25Ft")
                    renderType: Text.NativeRendering
                    font.capitalization: Font.MixedCase
                    font.pixelSize: 12
                    Layout.column: 1
                    Layout.row: 1
                    font.family: "Arial"
                }

                Text {
                    id: text3
                    text: qsTr("default cable loss:")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    Layout.row: 2
                    font.family: "Arial"
                }

                Text {
                    id: text7
                    text: qsTr("2.3dB")
                    font.capitalization: Font.MixedCase
                    font.pixelSize: 12
                    Layout.column: 1
                    Layout.row: 2
                    font.family: "Arial"
                }

                Text {
                    id: text4
                    text: qsTr("uut antenna gain:")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    Layout.row: 3
                    font.family: "Arial"
                }

                Text {
                    id: text8
                    text: qsTr("0.0dB")
                    font.capitalization: Font.MixedCase
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 1
                    Layout.row: 3
                }
            }
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 1.1
                verticalOffset: 1.1
                radius: 4.0
                color: "Lightgray"
                spread: 0
            }
        }
    }
}
