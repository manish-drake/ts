import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    Rectangle {
        id: rectangle
        color: "#fafafa"
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
            rows: 11
            columns: 2

            Text {
                id: text1
                text: qsTr("GPS SOURCE:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
            }

            Text {
                id: text5
                color: "#575656"
                text: qsTr("internal")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
            }

            Text {
                id: text2
                text: qsTr("GPs FORMAT:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 1
            }

            Text {
                id: text6
                color: "#575656"
                text: qsTr("DMS")
                renderType: Text.NativeRendering
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                 Layout.column: 1
                 Layout.row: 1
            }

            Text {
                id: text3
                text: qsTr("ALT FORMAT:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 2
            }

            Text {
                id: text7
                color: "#575656"
                text: qsTr("Feet")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
             Layout.column: 1
                 Layout.row: 2
            }

            Text {
                id: text4
                text: qsTr("cURRENT LAT:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 3
            }

            Text {
                id: text8
                text: qsTr("51-3012.1VN?")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
                Layout.row: 3
            }

            Text {
                id: text10
                text: qsTr("cURRENT LON:")
                font.capitalization: Font.AllUppercase
                Layout.row: 4
                font.pixelSize: 12
            }

            Text {
                id: text11
                text: qsTr("107’39.45-W?")
                font.capitalization: Font.AllUppercase
                Layout.row: 4
                 Layout.column: 1
                font.pixelSize: 12
            }

            Text {
                id: text12
                text: qsTr("CURRENT TIME:")
                font.capitalization: Font.AllUppercase
                Layout.row: 5
                font.pixelSize: 12
            }

            Text {
                id: text13
                text: qsTr("09:15:45")
                font.capitalization: Font.AllUppercase
                Layout.row: 5
                Layout.column: 1
                font.pixelSize: 12
            }

            Text {
                id: text14
                text: qsTr("CURRENT DATE:")
                Layout.row: 6
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
            }

            Text {
                id: text15
                text: qsTr("03/15/2017")
                Layout.row: 6
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 1
            }

            Text {
                id: text16
                text: qsTr("CURRENT ALT:")
                Layout.row: 7
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
            }

            Text {
                id: text17
                text: qsTr("124 Ft")
                Layout.row: 7
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 1
            }

            Text {
                id: text18
                text: qsTr("MANUAL LAT:")
                Layout.row: 8
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
            }

            Text {
                id: text19
                text: qsTr("407484 N")
                Layout.row: 8
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 1
            }

            Text {
                id: text20
                text: qsTr("MANUAL LON:")
                Layout.row: 9
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
            }
            Text {
                id: text21
                text: qsTr("73.9857 W")
                Layout.row: 9
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 1
            }
        }
    }

}
