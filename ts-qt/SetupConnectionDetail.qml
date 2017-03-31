import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {


    Rectangle {
        id: rectangle
        color: "#dcdcdc"
        anchors.fill: parent

        Text {
            id: text9
            text: qsTr("connection")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            font.capitalization: Font.AllUppercase
            font.pixelSize: 12
        }

        GridLayout {
            y: 50
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.right: parent.right
            anchors.rightMargin: 50
            rows: 4
            columns: 2

            Text {
                id: text1
                text: qsTr("AULT POWER:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
            }

            Text {
                id: text5
                text: qsTr("1dB")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
            }

            Text {
                id: text2
                text: qsTr("AULT DIsTANCE:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 1
            }

            Text {
                id: text6
                text: qsTr("25Ft")
                renderType: Text.NativeRendering
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                 Layout.column: 1
                 Layout.row: 1
            }

            Text {
                id: text3
                text: qsTr("AULT CABLE LOsS:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 2
            }

            Text {
                id: text7
                text: qsTr("2.3dB")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                 Layout.column: 1
                 Layout.row: 2
            }

            Text {
                id: text4
                text: qsTr("ANTENNA GAIN:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 3
            }

            Text {
                id: text8
                text: qsTr("0.0dB")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                 Layout.column: 1
                 Layout.row: 3
            }
        }
    }
}
