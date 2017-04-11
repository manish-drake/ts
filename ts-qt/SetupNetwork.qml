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
                text: qsTr("NETWORK")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                font.pixelSize: 13
                font.bold: Font.DemiBold
            }

            GridLayout {
                y: 70
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.right: parent.right
                anchors.rightMargin: 50
                rows: 11
                columns: 2

                Text {
                    id: text1
                    text: qsTr("ENABlE Wi-Fi:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
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
                    font.pixelSize: 12
                    Layout.row: 1
                     font.bold: Font.Medium
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
                    text: qsTr("Wi-Fi DIRECT:")
                    font.pixelSize: 12
                    Layout.row: 2
                     font.bold: Font.Medium
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
                    font.pixelSize: 12
                    Layout.row: 3
                     font.bold: Font.Medium
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
                    text: qsTr("IP ADDRESS:")
                    Layout.row: 4
                    font.pixelSize: 12
                    Layout.bottomMargin: 15
                     font.bold: Font.Medium
                }

                Text {
                    id: text11
                    text: qsTr("192.168 10.196")
                    Layout.row: 4
                    Layout.column: 1
                    font.pixelSize: 12
                    Layout.bottomMargin: 15
                }

                Text {
                    id: text12
                    text: qsTr("MANUAL IP ADDRESS:")
                    Layout.row: 5
                    font.pixelSize: 12
                    Layout.bottomMargin: 10
                     font.bold: Font.Medium
                }

                TextEdit {
                    id: textedit1
                    text: qsTr("192.168 10.19")
                    Layout.row: 5
                    Layout.column: 1
                    font.pixelSize: 12
                    Layout.bottomMargin: 10

                }

                Text {
                    id: text14
                    text: qsTr("DEVICE NAME:")
                    Layout.row: 6
                    font.pixelSize: 12
                    Layout.column: 0
                     font.bold: Font.Medium
                }

                TextEdit {
                    id: textedit2
                    text: qsTr("TestSet14")
                    Layout.row: 6
                    font.pixelSize: 12
                    Layout.column: 1
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
