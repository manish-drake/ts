import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Rectangle{
    id: rectangle
    width: 400
    height: 120

    color:"#a1a1a1"

    GridLayout {
        id: grid
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
columnSpacing: 0
        rowSpacing: 0
        rows: 2
        columns: 2
        Text {
            id: text2

            text: qsTr("CURRENT USER:")
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            font.pixelSize: 12
        }

        Text {
            id: text3
            Layout.column: 1
            Layout.row: 0
            text: qsTr("OPERATOR")
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            z: 3
            font.pixelSize: 12
        }

        Text {
            id: text4
            Layout.column: 0
            Layout.row: 1
            text: qsTr("LANGUAGE:")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            z: 2
            font.pixelSize: 12
        }

        Text {
            id: text5
            Layout.column: 1
            Layout.row: 1
            text: qsTr("English")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            z: 5
            font.pixelSize: 12
        }
    }

    Text {
        id: text1
        anchors.verticalCenter: parent.verticalCenter
        anchors.   horizontalCenter: parent.horizontalCenter
        text: qsTr("USER")
        font.pixelSize: 12
    }

}
