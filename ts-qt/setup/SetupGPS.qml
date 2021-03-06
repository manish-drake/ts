import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Page {
    id: item1
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("GPS")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            anchors.horizontalCenter: parent.horizontalCenter
            color: Universal.foreground
        }
    }

    contentItem: Rectangle {
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Flickable {
            id: flickable
            anchors.fill: parent
            contentWidth: width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 20

                Text {
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("GPS SOURCE")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 0
                    Layout.column:1
                    Layout.minimumWidth: 80
                    text: gpsSourceSwitch.checked ? "External" : "Internal"
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Switch { //we can use delegate switch as well for binging
                    id: gpsSourceSwitch
                    Layout.row: 0
                    Layout.column: 2
                    Layout.alignment: Qt.AlignRight
                    opacity: enabled ? 1 : 0.3
                    onCheckedChanged: {
                        console.log(gpsSourceSwitch.checked)
                    }
                    style: SwitchStyle {
                        groove: Rectangle {
                            implicitWidth: 60
                            implicitHeight: 30
                            radius: 15
                            color: "lightgray"
                        }
                        handle: Rectangle {
                            implicitWidth: 30
                            implicitHeight: 30
                            radius: 15
                            color: control.checked ? Universal.accent : "gray"
                        }
                    }
                }

                Text {
                    Layout.row: 1
                    Layout.column: 0
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("GPS FORMAT")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 1
                    Layout.column: 1
                    text: gpsFormatSwitch.checked ? "D.D°" : "D°M'S"
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Switch { //we can use delegate switch as well for binging
                    id: gpsFormatSwitch
                    Layout.row: 1
                    Layout.column: 2
                    Layout.alignment: Qt.AlignRight
                    opacity: enabled ? 1 : 0.3
                    onCheckedChanged: {
                        console.log(gpsFormatSwitch.checked)
                    }
                    style: SwitchStyle {
                        groove: Rectangle {
                            implicitWidth: 60
                            implicitHeight: 30
                            radius: 15
                            color: "lightgray"
                        }
                        handle: Rectangle {
                            implicitWidth: 30
                            implicitHeight: 30
                            radius: 15
                            color: control.checked ? Universal.accent : "gray"
                        }
                    }
                }

                Text {
                    Layout.row: 2
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("ALT FORMAT")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 2
                    Layout.column: 1
                    id:altFormatText
                    text: altFormatSwitch.checked ? "Meters" : "Feet"
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Switch { //we can use delegate switch as well for binging
                    id: altFormatSwitch
                    Layout.row: 2
                    Layout.column: 2
                    Layout.alignment: Qt.AlignRight
                    opacity: enabled ? 1 : 0.3
                    onCheckedChanged: {
                        console.log(altFormatSwitch.checked)
                    }
                    style: SwitchStyle {
                        groove: Rectangle {
                            implicitWidth: 60
                            implicitHeight: 30
                            radius: 15
                            color: "lightgray"
                        }
                        handle: Rectangle {
                            implicitWidth: 30
                            implicitHeight: 30
                            radius: 15
                            color: control.checked ? Universal.accent : "gray"
                        }
                    }
                }

                Text {
                    Layout.row: 3
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("CURRENT LAT")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 3
                    Layout.column: 1
                    Layout.columnSpan: 2
                    id: text8
                    text: gpsFormatSwitch.checked ? "51.50392°" : "51°30'14.11 N"
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 4
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("CURRENT LON")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 4
                    Layout.column: 1
                    Layout.columnSpan: 2
                    text: gpsFormatSwitch.checked ? "10.12763°" : "10°7'39.45 W"
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 5
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("CURRENT TIME")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Timer{
                    interval: 1000
                    running: true
                    repeat: true
                    triggeredOnStart: true
                    onTriggered: timeText.text = Qt.formatDateTime(new Date(),"hh:mm:ss")
                }
                Text {
                    id: timeText
                    Layout.row: 5
                    Layout.column: 1
                    Layout.columnSpan: 2
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 6
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("CURRENT DATE")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Timer{
                    interval: 1000
                    running: true
                    repeat: true
                    triggeredOnStart: true
                    onTriggered: dateText.text = Qt.formatDateTime(new Date(),"MM/dd/yyyy")
                }
                Text {
                    id: dateText
                    Layout.row: 6
                    Layout.column: 1
                    Layout.columnSpan: 2
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 7
                    Layout.bottomMargin: 30
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("CURRENT ALT")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 7
                    Layout.column: 1
                    Layout.columnSpan: 2
                    Layout.bottomMargin: 30
                    text: altFormatSwitch.checked ? "%1 m".arg(144*0.3048) : "%1 Ft.".arg(144)
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                RowLayout{
                    Layout.row: 8
                    Layout.columnSpan: 3
                    Layout.fillWidth: true
                    spacing: 20
                    Text {
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        text: qsTr("MANUAL LAT")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    TextField {
                        id: manualLatField
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: manualLatSwitch.checked
                        placeholderText: "Enter Latitude"
                        text: qsTr("40.7484")
                        validator: DoubleValidator{}
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        Layout.maximumWidth: 100
                        onEditingFinished: manualLatSwitch.checked = false
                        //                    inputMethodHints: Qt.ImhPreferNumbers
                    }
                    Text {
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: !manualLatSwitch.checked
                        text: "%1 ° N".arg(manualLatField.text)
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        Layout.maximumWidth: 100
                        elide: Text.ElideRight
                        color: Universal.foreground
                    }
                    SwitchDelegate{
                        id: manualLatSwitch
                        enabled: manualLatField.acceptableInput
                        Layout.column:3
                        spacing: 0
                        implicitHeight: 25
                        implicitWidth: 50
                        checked: false
                        indicator:Rectangle{
                            anchors.fill: parent
                            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                text: manualLatSwitch.checked ? "DONE" : "EDIT"
                                color: manualLatSwitch.enabled ? Universal.accent : "gray"
                                font.pixelSize: 14
                                font.family: robotoRegular.name
                            }
                        }
                        onCheckedChanged: {
                            if(checked){
                                manualLatField.forceActiveFocus()
                            }
                            else{
                                manualLatField.focus = false;
                            }
                        }
                    }
                }

                RowLayout{
                    Layout.row: 9
                    Layout.columnSpan: 3
                    Layout.fillWidth: true
                    spacing: 20
                    Text {
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        text: qsTr("MANUAL LON")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    TextField {
                        id: manualLonField
                        Layout.row: 9
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: manualLonSwitch.checked
                        placeholderText: "Enter Latitude"
                        text: qsTr("73.9857")
                        validator: DoubleValidator{}
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        Layout.maximumWidth: 100
                        onEditingFinished: manualLonSwitch.checked = false
                        //                    inputMethodHints: Qt.ImhPreferNumbers
                    }
                    Text {
                        Layout.column: 1
                        Layout.columnSpan: 2
                        visible: !manualLonSwitch.checked
                        text: "%1 ° W".arg(manualLonField.text)
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        Layout.maximumWidth: 100
                        elide: Text.ElideRight
                        color: Universal.foreground
                    }
                    SwitchDelegate{
                        id: manualLonSwitch
                        enabled: manualLonField.acceptableInput
                        Layout.column:3
                        spacing: 0
                        implicitHeight: 25
                        implicitWidth: 50
                        checked: false
                        indicator:Rectangle{
                            anchors.fill: parent
                            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                text: manualLonSwitch.checked ? "DONE" : "EDIT"
                                color: manualLonSwitch.enabled ? Universal.accent : "gray"
                                font.pixelSize: 14
                                font.family: robotoRegular.name
                            }
                        }
                        onCheckedChanged: {
                            if(checked){
                                manualLonField.forceActiveFocus()
                            }
                            else{
                                manualLonField.focus = false;
                            }
                        }
                    }
                }
            }
        }
    }
}
