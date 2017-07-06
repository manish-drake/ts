import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Page {
    id: item1
    anchors.fill: parent
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.background
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("NETWORK")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            color: Universal.foreground
        }

        Item{
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: 50
            Image {
                id: closeImage
                anchors.centerIn: parent
                source: "qrc:/img/img/Delete-25.png"
            }
            ColorOverlay{
                anchors.fill: closeImage
                source: closeImage
                color: Universal.foreground
            }
            MouseArea {
                anchors.fill: parent
                onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
            }
        }
    }

    contentItem: Rectangle {
        color: Universal.background
        Flickable {
            id: flickable
            anchors.fill: parent
            contentWidth: parent.width;
            contentHeight: content.height + content.y + 10
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            Column{
                id: content
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                GridLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    rowSpacing: 22
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
                        checked: true
                        onCheckedChanged: {
                            console.log(wifiSwitch.checked)
                            if(!checked){
                                remoteSwitch.checked = false
                                wifiDirectSwitch.checked = false
                            }
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
                        enabled: wifiSwitch.checked
                        checked: true
                        onCheckedChanged: {
                            console.log(remoteSwitch.checked)
                            if(!checked){
                                connectionLostPopup.open()
                            }
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
                        enabled: wifiSwitch.checked
                        onCheckedChanged: {
                            console.log(wifiDirectSwitch.checked)
                            if(!checked){
                                dhcpSwitch.checked = false
                            }
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
                        enabled: wifiSwitch.checked && wifiDirectSwitch.checked
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
                        text: qsTr("IP ADDRESS:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 4
                        Layout.column: 1
                        Layout.columnSpan: 2
                        text: qsTr("192.168 10.196")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Item{
                        Layout.row: 5
                        height: 5
                    }

                    Text {
                        Layout.row: 6
                        text: qsTr("MANUAL IP ADDRESS:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    TextField {
                        id: ipAddressField
                        Layout.row: 6
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: editIPAddSwitch.checked
                        placeholderText: "IP Address"
                        text: zmq.server
                        validator : RegExpValidator {
                            regExp : /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
                        }
                        inputMethodHints: Qt.ImhPreferNumbers
                        font.pixelSize: 14
                        Layout.maximumWidth: 100
                        onEditingFinished: editIPAddSwitch.checked = false
                        onFocusChanged: {
                            if(focus) flickable.contentY = ipAddressField.x
                        }
                        Binding{
                            target: zmq
                            property: "server"
                            value: ipAddressField.text
                        }
                    }
                    Text {
                        Layout.row: 6
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
                        Layout.row:6
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
                                font.pixelSize: 14
                            }
                        }
                        onCheckedChanged: {
                            if(checked){
                                ipAddressField.forceActiveFocus()
                            }
                            else{
                                ipAddressField.focus = false;
                            }
                        }
                    }

                    Text {
                        Layout.row: 7
                        text: qsTr("DEVICE NAME:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    TextField {
                        id: deviceNameField
                        Layout.row: 7
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: editDNameSwitch.checked
                        placeholderText: "Device Name"
                        text: qsTr("TestSet14")
                        validator: RegExpValidator{regExp: /([^\s]+)/ }
                        font.pixelSize: 14
                        Layout.maximumWidth: 100
                        onEditingFinished: editDNameSwitch.checked = false
                        onFocusChanged: {
                            if(focus ) flickable.contentY = deviceNameField.x
                        }
                    }
                    Text {
                        Layout.row: 7
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
                        Layout.row:7
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
                                font.pixelSize: 14
                            }
                        }
                        onCheckedChanged: {
                            if(checked){
                                deviceNameField.forceActiveFocus()
                            }
                            else{
                                deviceNameField.focus = false;
                            }
                        }
                    }
                }
                Column{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    topPadding: 20
                    visible: remoteSwitch.checked
                    RowLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 60
                        Text{
                            Layout.column: 0
                            text: qsTr("Connected Devices:")
                            font.pixelSize: 14
                            font.bold: Font.Medium
                            color: Universal.foreground
                        }
                        Item{
                            Layout.column: 2
                            Layout.fillWidth: true
                        }
                        Item{
                            Layout.column: 3
                            Layout.alignment: Qt.AlignVCenter
                            height: 40
                            width: 40
                            opacity: 0.5
                            Image {
                                id: disAllImage
                                anchors.centerIn: parent
                                source: "qrc:/img/img/Delete-25.png"
                            }
                            ColorOverlay{
                                anchors.fill: disAllImage
                                source: disAllImage
                                color: Universal.foreground
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked:{}
                            }
                        }
                    }

                    ListModel{
                        id: connDeviceModel
                        ListElement{name: "TestSet Remote #1"; isController: true}
                        ListElement{name: "TestSet Remote #2"; isController: false}
                        ListElement{name: "TestSet Remote #3"; isController: false}
                        ListElement{name: "TestSet Remote #4"; isController: false}
                    }

                    Repeater{
                        model: connDeviceModel
                        Item{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 40
                            Layout.fillWidth: true
                            RowLayout{
                                anchors.fill: parent
                                Text{
                                    Layout.column: 0
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: name
                                    font.pixelSize: 14
                                    color: Universal.foreground
                                }
                                Item{
                                    Layout.column: 1
                                    Layout.leftMargin: 20
                                    opacity: 0.4
                                    Image{
                                        id: symbolImg
                                        anchors.verticalCenter: parent.verticalCenter
                                        source: isController ? "qrc:/img/img/Controller-25.png" : "qrc:/img/img/Eye-25.png"
                                    }
                                    ColorOverlay{
                                        anchors.fill: symbolImg
                                        source: symbolImg
                                        color: Universal.foreground
                                    }
                                }
                                Item{
                                    Layout.column: 2
                                    Layout.fillWidth: true
                                }
                                Item{
                                    Layout.column: 3
                                    Layout.fillHeight: true
                                    width: 40
                                    opacity: 0.4
                                    Image {
                                        id: disImage
                                        anchors.centerIn: parent
                                        source: "qrc:/img/img/Delete-25.png"
                                    }
                                    ColorOverlay{
                                        anchors.fill: disImage
                                        source: disImage
                                        color: Universal.foreground
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked:{}
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
