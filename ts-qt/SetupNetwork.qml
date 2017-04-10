import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Item {
    Rectangle {
        id: rectangle
        color: "#fafafa"
        anchors.fill: parent

        Text {
            id: text9
            text: qsTr("network")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            font.capitalization: Font.AllUppercase
            font.pixelSize: 12
        }

        GridLayout {
            y: 50
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.right: parent.right
            anchors.rightMargin: 50
            rows: 11
            columns: 2

            Text {
                id: text1
                text: qsTr("ENABlE Wi-Fi:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
            }

            Switch {
                id: switch1
                text:switch1.checked ? qsTr("Yes"):qsTr("No")
                checked: false
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
                text: qsTr("ENABLE REMOTE:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 1
            }

            Switch {
                id: switch2
                text:switch2.checked ? qsTr("Yes"):qsTr("No")
                Layout.fillWidth: true
                spacing: 6
                onCheckedChanged: {
                    console.log(switch2.checked)
                }
                Layout.column: 1
                Layout.row: 1
            }

            Text {
                id: text3
                text: qsTr("wiFi DiRECT:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 2
            }

            Switch {
                id: switch3
                text:switch3.checked ? qsTr("Yes"):qsTr("No")
                Layout.fillWidth: true
                spacing: 6
                onCheckedChanged: {
                    console.log(switch3.checked)
                }

                Layout.column: 1
                Layout.row: 2
            }

            Text {
                id: text4
                text: qsTr("DHCP:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 3
            }

            Switch {
                id: switch4
                text:switch4.checked ? qsTr("Yes"):qsTr("No")
                Layout.fillWidth: true
                spacing: 6
                onCheckedChanged: {
                    console.log(switch4.checked)
                }
                Layout.column: 1
                Layout.row: 3
            }

            Text {
                id: text10
                text: qsTr("iPAddress:")
                font.capitalization: Font.AllUppercase
                Layout.row: 4
                font.pixelSize: 12
            }

            Text {
                id: text11
                text: qsTr("192.168 10.196")
                font.capitalization: Font.AllUppercase
                Layout.row: 4
                Layout.column: 1
                font.pixelSize: 12
            }

            Text {
                id: text12
                text: qsTr("MANuAL IP ADdREsS:")
                font.capitalization: Font.AllUppercase
                Layout.row: 5
                font.pixelSize: 12
            }

            TextEdit {
                id: textedit1
                text: qsTr("192.168 10.19")
                font.capitalization: Font.AllUppercase
                Layout.row: 5
                Layout.column: 1
                font.pixelSize: 12
            }

            Text {
                id: text14
                text: qsTr("DEVIcE NAME:")
                Layout.row: 6
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
            }

            TextEdit {
                id: textedit2
                text: qsTr("TestSetl4")
                Layout.row: 6
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 1
            }
        }

    }

}
