import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    Rectangle{
        anchors.fill: parent
        anchors.margins: 10
        clip: true
        border.color: "#0d000000"
        border.width: 1
        radius: 5
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#0d000000"
            spread: 0
        }
        Column{
            anchors.fill: parent
            Rectangle{
                id: header
                anchors.left: parent.left
                anchors.right: parent.right
                height:40
                color:"transparent"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("NETWORK")
                    elide:Text.ElideRight
                    font.pointSize: 13
                    font.weight: Font.DemiBold
                    clip:true
                }
                Rectangle{
                    id: rectangle
                    width: 40
                    height: parent.height
                    anchors.right: parent.right
                    color:"transparent"
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/img/img/close.png"
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
                width: parent.width;
                anchors.top: header.bottom
                anchors.bottom: parent.bottom
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                clip: true
                boundsBehavior: Flickable.StopAtBounds
                GridLayout {
                    id: grid
                    y: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    rowSpacing: 25
                    columnSpacing: 20

                    Text {
                        text: qsTr("ENABlE Wi-Fi:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        Layout.column:1
                        Layout.minimumWidth: 20
                        text:wifiSwitch.checked ? qsTr("Yes"):qsTr("No")
                        font.pixelSize: 14
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: wifiSwitch
                        Layout.column: 2
                        onCheckedChanged: {
                            console.log(wifiSwitch.checked)
                        }
                    }

                    Text {
                        Layout.row: 1
                        text: qsTr("ENABLE REMOTE:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        Layout.row: 1
                        Layout.column:1
                        text:remoteSwitch.checked ? qsTr("Yes"):qsTr("No")
                        font.pixelSize: 14
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: remoteSwitch
                        Layout.row: 1
                        Layout.column: 2
                        onCheckedChanged: {
                            console.log(remoteSwitch.checked)
                        }
                    }

                    Text {
                        Layout.row: 2
                        text: qsTr("Wi-Fi DIRECT:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        Layout.row: 2
                        Layout.column:1
                        text:wifiDirectSwitch.checked ? qsTr("Yes"):qsTr("No")
                        font.pixelSize: 14
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: wifiDirectSwitch
                        Layout.row: 2
                        Layout.column: 2
                        onCheckedChanged: {
                            console.log(wifiDirectSwitch.checked)
                        }
                    }

                    Text {
                        Layout.row: 3
                        text: qsTr("DHCP:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        id:dhcpText
                        Layout.row: 3
                        Layout.column:1
                        text:dhcpSwitch.checked ? qsTr("Yes"):qsTr("No")
                        font.pixelSize: 14
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: dhcpSwitch
                        Layout.row: 3
                        Layout.column: 2
                        onCheckedChanged: {
                            console.log(dhcpSwitch.checked)
                        }
                    }

                    Text {
                        Layout.row: 4
                        Layout.bottomMargin: 30
                        text: qsTr("IP ADDRESS:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text {
                        Layout.row: 4
                        Layout.column: 1
                        Layout.columnSpan: 2
                        Layout.bottomMargin: 30
                        text: qsTr("192.168 10.196")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 5
                        text: qsTr("MANUAL IP ADDRESS:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    TextEdit {
                        id: textedit1
                        Layout.row: 5
                        Layout.column: 1
                        Layout.columnSpan: 2
                        text: qsTr("192.168 10.19")
                        font.pixelSize: 14
                    }

                    Text{
                        text:"Edit"
                        Layout.row:5
                        Layout.column:3
                        color: "#387EF5"
                        font.pointSize: 12
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Text {
                        Layout.row: 6
                        text: qsTr("DEVICE NAME:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    TextEdit {
                        id: textedit2
                        Layout.row: 6
                        Layout.column: 1
                        Layout.columnSpan: 2
                        text: qsTr("TestSet14")
                        font.pixelSize: 14
                    }

                    Text{
                        Layout.row:6
                        Layout.column:3
                        text:"Edit"
                        color: "#387EF5"
                        font.pointSize: 12
                        MouseArea {
                            anchors.fill: parent
                        }
                    }
                }
            }
        }
    }
}
