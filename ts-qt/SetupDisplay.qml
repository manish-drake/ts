import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Item {
    Rectangle {
        id: rectangle
        color: "#dcdcdc"
        anchors.fill: parent

        Text {
            id: text9
            text: qsTr("display")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            font.capitalization: Font.AllUppercase
            font.pixelSize: 12
        }

        GridLayout {
            y: 50
            columnSpacing: 25
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.right: parent.right
            anchors.rightMargin: 50
            rows: 2
            columns: 2

            Text {
                id: text1
                text: qsTr("theme")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
            }

            Switch { //we can use delegate switch as well for binging
                id: switch1
                text:switch1.checked ? qsTr("Outdoor"):qsTr("Indoor")
                Layout.fillWidth: true
                Layout.rowSpan: 1
                Layout.preferredWidth: -1
                spacing: 6
                Layout.column: 1
                onCheckedChanged: {
                    console.log(switch1.checked)
                }
            }

            Text {
                id: text2
                text: qsTr("brightness")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 1
                Layout.column: 0
            }

            Slider {
                id: slider
                Layout.fillWidth: true
                value: 0.5
                Layout.row: 1
                Layout.column: 1
                onValueChanged: {
                    console.log(slider.value)
                }
            }
        }
    }
}
