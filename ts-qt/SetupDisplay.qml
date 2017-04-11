import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
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
                text: qsTr("display")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                font.capitalization: Font.AllUppercase
                font.pixelSize: 13
                font.bold: Font.DemiBold
                font.family: "Arial"
            }

            GridLayout {
                y: 70
                rowSpacing: 15
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.right: parent.right
                anchors.rightMargin: 50
                rows: 2
                columns: 4

                Text {
                    id: text1
                    text: qsTr("theme")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: "Arial"
                    Layout.rightMargin: 50
                }

                Text{
                    id:switchText
                    text:switch1.checked ? qsTr("Outdoor"):qsTr("Indoor")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 0
                    Layout.column:1
                    Layout.columnSpan: 2
                }

                Switch { //we can use delegate switch as well for binging
                    id: switch1
                    Layout.fillWidth: true
                    Layout.row: 0
                    font.family: "Arial"
                    spacing: 10
                    Layout.column: 3
                    width:30
                    height:30
                    onCheckedChanged: {
                        console.log(switch1.checked)
                    }
                }

                Text {
                    id: text2
                    text: qsTr("BRIGHTNESS")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: "Arial"
                    Layout.row: 1
                    Layout.column: 0
                    Layout.rightMargin: 50
                }

                Text {
                    id: text3
                    text: "1"
                    width: 5
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 1
                    Layout.column: 1
                }

                Slider {
                    id: slider
                    Layout.fillWidth: true
                    value: 0.5
                    Layout.row: 1
                    Layout.column: 2
                    onValueChanged: {
                        console.log(slider.value)
                    }
                }
                Text {
                    id: text4
                    text: "10"
                    width: 5
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 1
                    Layout.column: 3
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
