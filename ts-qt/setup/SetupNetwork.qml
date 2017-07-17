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
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("NETWORK")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
        }

//        Item{
//            anchors.top: parent.top
//            anchors.bottom: parent.bottom
//            anchors.right: parent.right
//            width: 50
//            Image {
//                id: closeImage
//                anchors.centerIn: parent
//                source: "qrc:/img/img/Delete-25.png"
//            }
//            ColorOverlay{
//                anchors.fill: closeImage
//                source: closeImage
//                color: Universal.foreground
//            }
//            MouseArea {
//                anchors.fill: parent
//                onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
//            }
//        }
    }

    contentItem: Rectangle {
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
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
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        text: qsTr("Wi-Fi")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Text{
                        Layout.column:1
                        text: wifiSwitch.checked ? "On" : "Off"
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Switch { //we can use delegate switch as well for binging
                        id: wifiSwitch
                        Layout.column: 2
                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignRight
                        checked: true
                        onCheckedChanged: {
                            console.log(wifiSwitch.checked)
                            if(!checked){
                                remoteSwitch.checked = false
                                wifiDirectSwitch.checked = false
                            }
                        }
                    }

                    Text {
                        Layout.row: 1
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        text: qsTr("REMOTE CONNECTION")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Text{
                        Layout.row: 1
                        Layout.column:1
                        text: remoteSwitch.checked ? "On" : "Off"
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Switch { //we can use delegate switch as well for binging
                        id: remoteSwitch
                        Layout.row: 1
                        Layout.column: 2
                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignRight
                        enabled: wifiSwitch.checked
                        checked: true
                        onCheckedChanged: {
                            console.log(remoteSwitch.checked)
                            if(!checked){
                                connectionLostPopup.open()
                            }
                        }
                    }

                    Text {
                        Layout.row: 2
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        text: qsTr("Wi-Fi DIRECT")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Text{
                        Layout.row: 2
                        Layout.column:1
                        text: wifiDirectSwitch.checked ? "On" : "Off"
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Switch { //we can use delegate switch as well for binging
                        id: wifiDirectSwitch
                        Layout.row: 2
                        Layout.column: 2
                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignRight
                        enabled: wifiSwitch.checked
                        onCheckedChanged: {
                            console.log(wifiDirectSwitch.checked)
                            if(!checked){
                                dhcpSwitch.checked = false
                            }
                        }
                    }

                    Text {
                        Layout.row: 3
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        text: qsTr("DHCP")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Text{
                        Layout.row: 3
                        Layout.column:1
                        text: dhcpSwitch.checked ? "On" : "Off"
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Switch { //we can use delegate switch as well for binging
                        id: dhcpSwitch
                        Layout.row: 3
                        Layout.column: 2
                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignRight
                        enabled: wifiSwitch.checked && wifiDirectSwitch.checked
                        onCheckedChanged: {
                            console.log(dhcpSwitch.checked)
                        }
                    }

                    Text {
                        Layout.row: 4
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        text: qsTr("IP ADDRESS")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }

                    Text {
                        Layout.row: 4
                        Layout.column: 1
                        Layout.columnSpan: 3
                        text: qsTr("192.168 10.196")
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }

                    Item{
                        Layout.row: 5
                        height: 5
                    }

                    RowLayout{
                        Layout.row: 6
                        Layout.columnSpan: 4
                        Layout.fillWidth: true
                        spacing: 20
                        Text {
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: qsTr("MANUAL IP ADDRESS")
                            font.pixelSize: 14
                            font.bold: Font.Medium
                            font.family: robotoRegular.name
                            color: Universal.foreground
                        }
                        TextField {
                            id: ipAddressField
                            Layout.column: 1
                            Layout.columnSpan: 2
                            visible: editIPAddSwitch.checked
                            placeholderText: "IP Address"
                            text: zmq.server
                            validator : RegExpValidator {
                                regExp : /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
                            }
                            //                        inputMethodHints: Qt.ImhPreferNumbers
                            font.pixelSize: 14
                            Layout.maximumWidth: 100
                            onEditingFinished: editIPAddSwitch.checked = false
                            Binding{
                                target: zmq
                                property: "server"
                                value: ipAddressField.text
                            }
                        }
                        Text {
                            Layout.column: 1
                            Layout.columnSpan: 2
                            visible: !editIPAddSwitch.checked
                            text: ipAddressField.text
                            font.pixelSize: 14
                            font.family: robotoRegular.name
                            Layout.maximumWidth: 100
                            elide: Text.ElideRight
                            color: Universal.foreground
                        }
                        SwitchDelegate{
                            id: editIPAddSwitch
                            enabled: ipAddressField.acceptableInput
                            Layout.column:3
                            Layout.columnSpan: 2
                            spacing: 0
                            implicitHeight: 25
                            implicitWidth: 50
                            checked: false
                            indicator: Rectangle{
                                anchors.fill: parent
                                color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
                                Text{
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: editIPAddSwitch.checked ? "DONE" : "EDIT"
                                    color: parent.enabled ? "#387EF5" : "gray"
                                    font.pixelSize: 14
                                    font.family: robotoRegular.name
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
                    }

                    RowLayout{
                        Layout.row: 7
                        Layout.columnSpan: 4
                        Layout.fillWidth: true
                        spacing: 20
                        Text {
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: qsTr("DEVICE NAME")
                            font.pixelSize: 14
                            font.bold: Font.Medium
                            font.family: robotoRegular.name
                            color: Universal.foreground
                        }
                        TextField {
                            id: deviceNameField
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
                            Layout.column: 1
                            Layout.columnSpan: 2
                            visible: !editDNameSwitch.checked
                            text: deviceNameField.text
                            font.pixelSize: 14
                            font.family: robotoRegular.name
                            Layout.maximumWidth: 100
                            elide: Text.ElideRight
                            color: Universal.foreground
                        }
                        SwitchDelegate{
                            id: editDNameSwitch
                            enabled: deviceNameField.acceptableInput
                            Layout.column:3
                            Layout.columnSpan: 2
                            spacing: 0
                            implicitHeight: 25
                            implicitWidth: 50
                            checked: false
                            indicator:Rectangle{
                                anchors.fill: parent
                                color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
                                Text{
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: editDNameSwitch.checked ? "DONE" : "EDIT"
                                    color: parent.enabled ? "#387EF5" : "gray"
                                    font.pixelSize: 14
                                    font.family: robotoRegular.name
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
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: qsTr("CONNECTED DEVICES")
                            font.pixelSize: 14
                            font.bold: Font.Medium
                            font.family: robotoRegular.name
                            color: Universal.foreground
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
                                Image{
                                    id: symbolImg
                                    anchors.verticalCenter: parent.verticalCenter
                                    source: isController ? "qrc:/img/img/Controller-25.png" : "qrc:/img/img/Eye-25.png"
                                }
                                Text{
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: name
                                    font.pixelSize: 14
                                    font.family: robotoRegular.name
                                    color: Universal.foreground
                                }
                                ColorOverlay{
                                    anchors.fill: symbolImg
                                    source: symbolImg
                                    color: Universal.foreground
                                    opacity: 0.6
                                }
                                Item{
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
