import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

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
                    text: qsTr("NETWORK")
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
                    columnSpacing: 10

                    Text {
                        text: qsTr("ENABlE Wi-Fi:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Text{
                        Layout.column:1
                        text: qsTr("No")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: wifiSwitch
                        Layout.column: 2
                        onCheckedChanged: {
                            console.log(wifiSwitch.checked)
                        }
                    }

                    Text{
                        Layout.column:3
                        Layout.fillWidth: true
                        text: qsTr("Yes")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 1
                        text: qsTr("ENABLE REMOTE:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Text{
                        Layout.row: 1
                        Layout.column:1
                        text: qsTr("No")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: remoteSwitch
                        Layout.row: 1
                        Layout.column: 2
                        onCheckedChanged: {
                            console.log(remoteSwitch.checked)
                        }
                    }

                    Text{
                        Layout.row: 1
                        Layout.column:3
                        text: qsTr("Yes")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 2
                        text: qsTr("Wi-Fi DIRECT:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Text{
                        Layout.row: 2
                        Layout.column:1
                        text: qsTr("No")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: wifiDirectSwitch
                        Layout.row: 2
                        Layout.column: 2
                        onCheckedChanged: {
                            console.log(wifiDirectSwitch.checked)
                        }
                    }

                    Text{
                        Layout.row: 2
                        Layout.column:3
                        text: qsTr("Yes")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 3
                        text: qsTr("DHCP:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Text{
                        Layout.row: 3
                        Layout.column:1
                        text: qsTr("No")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: dhcpSwitch
                        Layout.row: 3
                        Layout.column: 2
                        onCheckedChanged: {
                            console.log(dhcpSwitch.checked)
                        }
                    }

                    Text{
                        Layout.row: 3
                        Layout.column:3
                        text: qsTr("Yes")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 4
                        Layout.bottomMargin: 30
                        text: qsTr("IP ADDRESS:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 4
                        Layout.column: 1
                        Layout.columnSpan: 2
                        Layout.bottomMargin: 30
                        text: qsTr("192.168 10.196")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 5
                        text: qsTr("MANUAL IP ADDRESS:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    TextField {
                        id: ipAddressField
                        Layout.row: 5
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: editIPAddSwitch.checked
                        placeholderText: "IP Address"
                        text: qsTr("192.168.10.19")
                        validator : RegExpValidator {
                            regExp : /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
                        }
                        font.pixelSize: 14
                        Layout.maximumWidth: 100
                        onEditingFinished: editIPAddSwitch.checked = false
                    }
                    Text {
                        Layout.row: 5
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: !editIPAddSwitch.checked
                        text: ipAddressField.text
                        font.pixelSize: 14
                        Layout.maximumWidth: 100
                        elide: Text.ElideRight
                        color: Universal.foreground
                    }

                    SwitchDelegate{
                        id: editIPAddSwitch
                        enabled: ipAddressField.acceptableInput
                        Layout.row:5
                        Layout.column:3
                        spacing: 0
                        implicitHeight: 25
                        implicitWidth: 50
                        checked: false
                        indicator: Rectangle{
                            anchors.fill: parent
                            color: Universal.background
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                text: editIPAddSwitch.checked ? "DONE" : "EDIT"
                                color: parent.enabled ? "#387EF5" : "gray"
                                font.pointSize: 10
                            }
                        }
                    }

                    Text {
                        Layout.row: 6
                        text: qsTr("DEVICE NAME:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    TextField {
                        id: deviceNameField
                        Layout.row: 6
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: editDNameSwitch.checked
                        placeholderText: "Device Name"
                        text: qsTr("TestSet14")
                        validator: RegExpValidator{regExp: /([^\s]+)/ }
                        font.pixelSize: 14
                        Layout.maximumWidth: 100
                        onEditingFinished: editDNameSwitch.checked = false
                    }
                    Text {
                        Layout.row: 6
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: !editDNameSwitch.checked
                        text: deviceNameField.text
                        font.pixelSize: 14
                        Layout.maximumWidth: 100
                        elide: Text.ElideRight
                        color: Universal.foreground
                    }

                    SwitchDelegate{
                        id: editDNameSwitch
                        enabled: deviceNameField.acceptableInput
                        Layout.row:6
                        Layout.column:3
                        spacing: 0
                        implicitHeight: 25
                        implicitWidth: 50
                        checked: false
                        indicator:Rectangle{
                            anchors.fill: parent
                            color: Universal.background
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                text: editDNameSwitch.checked ? "DONE" : "EDIT"
                                color: parent.enabled ? "#387EF5" : "gray"
                                font.pointSize: 10
                            }
                        }
                    }
                }
            }
        }
    }
}
