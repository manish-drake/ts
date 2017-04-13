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
                    text: qsTr("GPS")
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
                        text: qsTr("GPS SOURCE:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        id:gpsSourceText
                        Layout.row: 0
                        Layout.column:1
                        Layout.minimumWidth: 50
                        text:gpsSourceSwitch.checked ? qsTr("External"):qsTr("Internal")
                        font.pixelSize: 14                        
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: gpsSourceSwitch
                        Layout.row: 0
                        Layout.column: 2
                        Layout.fillWidth: true
                        onCheckedChanged: {
                            console.log(gpsSourceSwitch.checked)
                        }
                    }

                    Text {
                        Layout.row: 1
                        Layout.column: 0
                        text: qsTr("GPS FORMAT:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        id:gpsFormatText
                        Layout.row: 1
                        Layout.column: 1
                        text:gpsFormatSwitch.checked ? qsTr("D.D°"):qsTr("D°M'S")
                        font.pixelSize: 14
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: gpsFormatSwitch
                        Layout.row: 1
                        Layout.column: 2
                        Layout.fillWidth: true
                        onCheckedChanged: {
                            console.log(gpsFormatSwitch.checked)
                        }
                    }


                    Text {
                        Layout.row: 2
                        text: qsTr("ALT FORMAT:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        Layout.row: 2
                        Layout.column: 1
                        id:altFormatText
                        text:altFormatSwitch.checked ? qsTr("Meters"):qsTr("Feet")
                        font.pixelSize: 14
                    }

                    Switch { //we can use delegate switch as well for binging
                        id: altFormatSwitch
                        Layout.row: 2
                        Layout.column: 2
                        Layout.fillWidth: true
                        onCheckedChanged: {
                            console.log(altFormatSwitch.checked)
                        }
                    }

                    Text {
                        Layout.row: 3
                        text: qsTr("CURRENT LAT:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text {
                        Layout.row: 3
                        Layout.column: 1
                        Layout.columnSpan: 2
                        id: text8
                        text: qsTr("51°30'14.11 N")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 4
                        text: qsTr("CURRENT LON:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text {
                        Layout.row: 4
                        Layout.column: 1
                        Layout.columnSpan: 2
                        text: qsTr("10°7'39.45 W")
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 5
                        text: qsTr("CURRENT TIME:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text {
                        Layout.row: 5
                        Layout.column: 1
                        Layout.columnSpan: 2
                        text: qsTr("09:15:45")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 6
                        text: qsTr("CURRENT DATE:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text {
                        Layout.row: 6
                        Layout.column: 1
                        Layout.columnSpan: 2
                        text: qsTr("03/15/2017")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 7
                        Layout.bottomMargin: 30
                        text: qsTr("CURRENT ALT:")
                        font.pixelSize: 14
                        font.bold: Font.Medium

                    }

                    Text {
                        Layout.row: 7
                        Layout.column: 1
                        Layout.columnSpan: 2
                        Layout.bottomMargin: 30
                        text: qsTr("144 Ft.")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 8
                        text: qsTr("MANUAL LAT:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text {
                        Layout.row: 8
                        Layout.column: 1
                        Layout.columnSpan: 2
                        text: qsTr("40.7484° N")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 9
                        text: qsTr("MANUAL LON:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text {
                        Layout.row: 9
                        Layout.column: 1
                        Layout.columnSpan: 2
                        text: qsTr("73.9857° W")
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 14
                    }

                }
            }
        }
    }
}
