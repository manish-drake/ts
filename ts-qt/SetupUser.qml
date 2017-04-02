import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1



Grid{
    id: gridSetupUser
    columns: 2
    spacing: 2.5
    anchors.fill: parent.width
    anchors.topMargin: 2.5
    anchors.leftMargin: 2.5
    Rectangle{
        id: rectangle
        height: 110
        color:"#FFFFFF"
        width:parent.width/2 - 2.5
        radius:10

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

    }
    Rectangle{

        width:parent.width/2-2.5
        height: 110
        color:"#FFFFFF"
        radius:10
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

    }
    Rectangle{
        height: 110
        color:"#FFFFFF"
        width:parent.width/2-2.5
        radius:10
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

    }
    Rectangle{
        height: 110
        color:"#FFFFFF"
        width:parent.width/2-2.5
        radius:10
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

    }
}

