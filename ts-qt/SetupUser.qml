import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0


Grid{
    id: gridSetupUser
    columns: 2
    spacing: 7
    anchors.fill: parent.width
    x: 5; y: 5;
    Rectangle{
        id: rectangle
        height: 150
        color:"#FFFFFF"
        width:parent.width/2-9
        border.color: "Lightgray"
        border.width: 0.4
        radius: 5

        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10

            Text {
                Layout.column: 0
                Layout.row: 1
                text: qsTr("LANGUAGE: ")
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                z: 2
                font.pixelSize: 12
            }

            Text {
                Layout.column: 1
                Layout.row: 1
                text: qsTr("English")
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                z: 5
                font.pixelSize: 12
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.   horizontalCenter: parent.horizontalCenter
            text: qsTr("OPERATOR")
            font.pixelSize: 12
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
    Rectangle{
        id: rectangle1
        height: 150
        color:"#FFFFFF"
        width:parent.width/2-9
        border.color: "Lightgray"
        border.width: 0.4
        radius: 5
        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10

            Text {
                Layout.column: 0
                Layout.row: 1
                text: qsTr("LANGUAGE: ")
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                z: 2
                font.pixelSize: 12
            }

            Text {
                Layout.column: 1
                Layout.row: 1
                text: qsTr("English")
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                z: 5
                font.pixelSize: 12
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.   horizontalCenter: parent.horizontalCenter
            text: qsTr("KEN FILARDO")
            font.pixelSize: 12
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
    Rectangle{
        height: 150
        color:"#FFFFFF"
        width:parent.width/2-9
        border.color: "Lightgray"
        border.width: 0.4
        radius: 5
        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10

            Text {
                Layout.column: 0
                Layout.row: 1
                text: qsTr("LANGUAGE: ")
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                z: 2
                font.pixelSize: 12
            }

            Text {
                Layout.column: 1
                Layout.row: 1
                text: qsTr("English")
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                z: 5
                font.pixelSize: 12
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.   horizontalCenter: parent.horizontalCenter
            text: qsTr("DAVE KLAMET")
            font.pixelSize: 12
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
    Rectangle{
        height: 150
        color:"#FFFFFF"
        width:parent.width/2-9
        border.color: "Lightgray"
        border.width: 0.4
        radius: 5
        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10

            Text {
                Layout.column: 0
                Layout.row: 1
                text: qsTr("LANGUAGE: ")
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                z: 2
                font.pixelSize: 12
            }

            Text {
                Layout.column: 1
                Layout.row: 1
                text: qsTr("English")
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                z: 5
                font.pixelSize: 12
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.   horizontalCenter: parent.horizontalCenter
            text: qsTr("STEVE O'HARA")
            font.pixelSize: 12
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

