import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Item {
    anchors.fill: parent
    GridLayout{
        anchors.fill: parent
        Rectangle{
            border.width: 1
            border.color: "lightgray"
            radius: 5

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            Layout.column: 0
            Layout.row: 0
            Text {
                anchors.centerIn: parent
                id: user
                text: qsTr("USER")
                font.bold: true
            }
            ColumnLayout {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                Text {
                    text: qsTr("Current User: Operator")
                }
                Text {
                    text: qsTr("Language: English")
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
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("User")
            }
        }
        Rectangle{
            border.width: 1
            border.color: "lightgray"
            radius: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            Layout.column: 1
            Layout.row: 0
            Text {
                anchors.centerIn: parent
                id: display
                text: qsTr("DISPLAY")
                font.bold: true
            }
            ColumnLayout {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.margins: 5
                Text {
                    text: qsTr("Current Theme: Indoor")
                }
                Text {
                    text: qsTr("Brightness: 5/10")
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
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Display")
            }
        }
        Rectangle{
            border.width: 1
            border.color: "lightgray"
            radius: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            Layout.column: 0
            Layout.row: 1
            Text {
                anchors.centerIn: parent
                id: gps
                text: qsTr("GPS")
                font.bold: true
            }
            ColumnLayout {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.margins: 5
                Text {
                    text: qsTr("Current Source: Internal")
                }
                Text {
                    text: qsTr("Current Lat: 40° 43' 50.1960'' N")
                }
                Text {
                    text: qsTr("Current Lon: 73° 56' 6.8712'' W")
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
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("GPS")
            }
        }
        Rectangle{
            border.width: 1
            border.color: "lightgray"
            radius: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            Layout.column: 1
            Layout.row: 1
            Text {
                anchors.centerIn: parent
                id: network
                text: qsTr("NETWORK")
                font.bold: true
            }
            ColumnLayout {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.margins: 5
                Text {
                    text: qsTr("WiFi Enabled: Yes")
                }
                Text {
                    text: qsTr("Allow local access: No")
                }
                Text {
                    text: qsTr("Allow remote access: No")
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
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Network")
            }
        }
        Rectangle{
            border.width: 1
            border.color: "lightgray"
            radius: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            Layout.column: 0
            Layout.row: 2
            Text {
                anchors.centerIn: parent
                id: sysInfo
                text: qsTr("SYSTEM INFO")
                font.bold: true
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
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("System-Info")
            }
        }
        Rectangle{
            border.width: 1
            border.color: "lightgray"
            radius: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            Layout.column: 1
            Layout.row: 2
            Text {
                anchors.centerIn: parent
                id: conn
                text: qsTr("CONNECTION")
                font.bold: true
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
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Connection")
            }
        }
    }
}
