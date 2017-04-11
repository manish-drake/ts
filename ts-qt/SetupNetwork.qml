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
                anchors.leftMargin: 40
                anchors.right: parent.right
                anchors.rightMargin: 40
                rows: 11
                columns: 3

                Text {
                    id: text1
                    text: qsTr("ENABlE Wi-Fi:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    Layout.rightMargin:80
                }

                Text{
                    id:wifiText
                    text:wifiSwitch.checked ? qsTr("Yes"):qsTr("No")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 0
                    Layout.column:1
                }

                Switch { //we can use delegate switch as well for binging
                    id: wifiSwitch
                    Layout.fillWidth: true
                    Layout.row: 0
                    spacing: 10
                    Layout.column: 2
                    onCheckedChanged: {
                        console.log(wifiSwitch.checked)
                    }
                }

                Text {
                    id: text2
                    text: qsTr("ENABLE REMOTE:")
                    font.pixelSize: 12
                    Layout.row: 1
                    font.bold: Font.Medium
                    Layout.rightMargin:80
                }

                Text{
                    id:remoteText
                    text:remoteSwitch.checked ? qsTr("Yes"):qsTr("No")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 1
                    Layout.column:1
                }

                Switch { //we can use delegate switch as well for binging
                    id: remoteSwitch
                    Layout.fillWidth: true
                    Layout.row: 1
                    spacing: 10
                    Layout.column: 2
                    onCheckedChanged: {
                        console.log(remoteSwitch.checked)
                    }
                }

                Text {
                    id: text3
                    text: qsTr("Wi-Fi DIRECT:")
                    font.pixelSize: 12
                    Layout.row: 2
                    font.bold: Font.Medium
                    Layout.rightMargin:80
                }

                Text{
                    id:wifiDirectText
                    text:wifiDirectSwitch.checked ? qsTr("Yes"):qsTr("No")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 2
                    Layout.column:1
                }

                Switch { //we can use delegate switch as well for binging
                    id: wifiDirectSwitch
                    Layout.fillWidth: true
                    Layout.row: 2
                    spacing: 10
                    Layout.column: 2
                    onCheckedChanged: {
                        console.log(wifiDirectSwitch.checked)
                    }
                }

                Text {
                    id: text4
                    text: qsTr("DHCP:")
                    font.pixelSize: 12
                    Layout.row: 3
                    font.bold: Font.Medium
                    Layout.bottomMargin: 10
                    Layout.rightMargin:80
                }

                Text{
                    id:dhcpText
                    text:dhcpSwitch.checked ? qsTr("Yes"):qsTr("No")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 3
                    Layout.column:1
                    Layout.bottomMargin: 10
                }

                Switch { //we can use delegate switch as well for binging
                    id: dhcpSwitch
                    Layout.fillWidth: true
                    Layout.row: 3
                    spacing: 10
                    Layout.column: 2
                    Layout.bottomMargin: 10
                    onCheckedChanged: {
                        console.log(dhcpSwitch.checked)
                    }
                }

                Text {
                    id: text10
                    text: qsTr("IP ADDRESS:")
                    Layout.row: 4
                    font.pixelSize: 12
                    Layout.bottomMargin: 35
                    Layout.rightMargin:80
                    font.bold: Font.Medium
                }

                Text {
                    id: text11
                    text: qsTr("192.168 10.196")
                    Layout.row: 4
                    Layout.column: 1
                    font.pixelSize: 12
                    Layout.bottomMargin: 35
                }

                Text {
                    id: text12
                    text: qsTr("MANUAL IP ADDRESS:")
                    Layout.row: 5
                    font.pixelSize: 12
                    Layout.bottomMargin: 20
                    Layout.rightMargin:80
                    font.bold: Font.Medium
                }

                TextEdit {
                    id: textedit1
                    text: qsTr("192.168 10.19")
                    Layout.row: 5
                    Layout.column: 1
                    font.pixelSize: 12
                    Layout.bottomMargin: 20
                }

                Text{
                    text:"Edit"
                    color: "#387EF5"
                    font.pointSize: 10
                    Layout.row:5
                    Layout.column:2
                    Layout.bottomMargin: 20
                    MouseArea {
                        anchors.fill: parent
                    }
                }

                Text {
                    id: text14
                    text: qsTr("DEVICE NAME:")
                    Layout.row: 6
                    font.pixelSize: 12
                    Layout.column: 0
                    font.bold: Font.Medium
                    Layout.rightMargin:80
                }

                TextEdit {
                    id: textedit2
                    text: qsTr("TestSet14")
                    Layout.row: 6
                    font.pixelSize: 12
                    Layout.column: 1
                }

                Text{
                    text:"Edit"
                    color: "#387EF5"
                    font.pointSize: 10
                    Layout.row:6
                    Layout.column:2
                    MouseArea {
                        anchors.fill: parent
                    }
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
