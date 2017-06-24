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
            text: qsTr("GPS")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            anchors.horizontalCenter: parent.horizontalCenter
            color: Universal.foreground
        }

        Item{
            width: 40
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
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
                onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
            }
        }
    }

    contentItem: Rectangle {
        color: Universal.background
        Flickable {
            anchors.fill: parent
            contentWidth: parent.width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 20

                Text {
                    text: qsTr("GPS SOURCE:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 0
                    Layout.column:1
                    text: qsTr("Internal")
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Switch { //we can use delegate switch as well for binging
                    id: gpsSourceSwitch
                    Layout.row: 0
                    Layout.column: 2
                    onCheckedChanged: {
                        console.log(gpsSourceSwitch.checked)
                    }
                }

                Text {
                    Layout.row: 0
                    Layout.column:3
                    Layout.fillWidth: true
                    text: qsTr("External")
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    Layout.column: 0
                    text: qsTr("GPS FORMAT:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    Layout.column: 1
                    text: qsTr("D°M'S")
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Switch { //we can use delegate switch as well for binging
                    id: gpsFormatSwitch
                    Layout.row: 1
                    Layout.column: 2
                    onCheckedChanged: {
                        console.log(gpsFormatSwitch.checked)
                    }
                }

                Text {
                    Layout.row: 1
                    Layout.column: 3
                    text: qsTr("D.D°")
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 2
                    text: qsTr("ALT FORMAT:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 2
                    Layout.column: 1
                    id:altFormatText
                    text: qsTr("Feet")
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Switch { //we can use delegate switch as well for binging
                    id: altFormatSwitch
                    Layout.row: 2
                    Layout.column: 2
                    onCheckedChanged: {
                        console.log(altFormatSwitch.checked)
                    }
                }

                Text {
                    Layout.row: 2
                    Layout.column: 3
                    text: qsTr("Meters")
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    text: qsTr("CURRENT LAT:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    Layout.column: 1
                    Layout.columnSpan: 3
                    id: text8
                    text: gpsFormatSwitch.checked ? "51.50392°" : "51°30'14.11 N"
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 4
                    text: qsTr("CURRENT LON:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 4
                    Layout.column: 1
                    Layout.columnSpan: 3
                    text: gpsFormatSwitch.checked ? "10.12763°" : "10°7'39.45 W"
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 5
                    text: qsTr("CURRENT TIME:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
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
                    Layout.columnSpan: 3
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 6
                    text: qsTr("CURRENT DATE:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
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
                    Layout.columnSpan: 3
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 7
                    Layout.bottomMargin: 30
                    text: qsTr("CURRENT ALT:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 7
                    Layout.column: 1
                    Layout.columnSpan: 3
                    Layout.bottomMargin: 30
                    text: altFormatSwitch.checked ? "%1 m".arg(144*0.3048) : "%1 Ft.".arg(144)
                    font.pixelSize: 14
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 8
                    text: qsTr("MANUAL LAT:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                TextField {
                    id: manualLatField
                    Layout.row: 8
                    Layout.column: 1
                    Layout.columnSpan: 2
                    visible: manualLatSwitch.checked
                    placeholderText: "Enter Latitude"
                    text: qsTr("40.7484")
                    validator: DoubleValidator{}
                    font.pixelSize: 14
                    Layout.maximumWidth: 100
                    onEditingFinished: manualLatSwitch.checked = false
                }
                Text {
                    Layout.row: 8
                    Layout.column: 1
                    Layout.columnSpan: 2
                    visible: !manualLatSwitch.checked
                    text: "%1 ° N".arg(manualLatField.text)
                    font.pixelSize: 14
                    Layout.maximumWidth: 100
                    elide: Text.ElideRight
                    color: Universal.foreground
                }

                SwitchDelegate{
                    id: manualLatSwitch
                    enabled: manualLatField.acceptableInput
                    Layout.row:8
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
                            text: parent.checked ? "DONE" : "EDIT"
                            color: parent.enabled ? "#387EF5" : "gray"
                            font.pixelSize: 14
                        }
                    }
                }

                Text {
                    Layout.row: 9
                    text: qsTr("MANUAL LON:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
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
                    Layout.maximumWidth: 100
                    onEditingFinished: manualLonSwitch.checked = false
                }
                Text {
                    Layout.row: 9
                    Layout.column: 1
                    Layout.columnSpan: 2
                    visible: !manualLonSwitch.checked
                    text: "%1 ° W".arg(manualLonField.text)
                    font.pixelSize: 14
                    Layout.maximumWidth: 100
                    elide: Text.ElideRight
                    color: Universal.foreground
                }

                SwitchDelegate{
                    id: manualLonSwitch
                    enabled: manualLonField.acceptableInput
                    Layout.row:9
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
                            text: parent.checked ? "DONE" : "EDIT"
                            color: parent.enabled ? "#387EF5" : "gray"
                            font.pixelSize: 14
                        }
                    }
                }
            }

        }
    }
}
