import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    Rectangle {
        id: rectangle
        color: "#dcdcdc"
        anchors.fill: parent

        Text {
            id: text9
            text: qsTr("system info")
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
            rows: 10
            columns: 3
            rowSpacing: 5

            Text {
                id: text1
                text: qsTr("sERIAL NuMBER:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
            }

            Text {
                id: text5
                text: qsTr("12986A")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
            }

            Text {
                id: text2
                text: qsTr("sOFTwARE RELEAsE:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 1
            }

            Text {
                id: text6
                text: qsTr("7885")
                renderType: Text.NativeRendering
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
                Layout.row: 1
            }

            Text {
                id: text3
                text: qsTr("CAuBRATION DUE:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 2
            }

            Text {
                id: text7
                text: qsTr("06/15/2018")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
                Layout.row: 2
            }

            Text {
                id: text4
                text: qsTr("wARRANTY ExPIRATION:")
                Layout.minimumHeight: 40
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.row: 3
            }

            Text {
                id: text8
                text: qsTr("03/22/2020")
                Layout.minimumHeight: 40
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
                Layout.row: 3
            }

            Rectangle{
                height: 50
                Layout.column: 0
                Layout.row: 4
            }

            Text {
                id: text10
                text: qsTr("INsTAllED FEATURES")
                Layout.minimumHeight: 24
                font.underline: true
                font.family: "Arial"
                fontSizeMode: Text.HorizontalFit
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
                Layout.row: 4
            }
            Text {
                id: text11
                text: qsTr("LICENCE kEy")
                font.underline: true
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 1
                Layout.row: 4
            }
            Text {
                id: text12
                text: qsTr("INsTSlLED")
                font.underline: true
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 2
                Layout.row: 4
            }
            Text {
                id: text13
                text: qsTr("TRANsPONDER:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
                Layout.row: 5
            }
            Text {
                id: text14
                text: qsTr("AlR9876345")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
                Layout.row: 5
            }
            Text {
                id: text15
                text: qsTr("2/15/2017")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 2
                Layout.row: 5
            }Text {
                id: text16
                text: qsTr("NAv:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
                Layout.row: 6
            }
            Text {
                id: text17
                text: qsTr("8vC9876348")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
                Layout.row: 6
            }
            Text {
                id: text18
                text: qsTr("3/12/2017")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 2
                Layout.row: 6
            }
            Text {
                id: text19
                text: qsTr("sEcURE cOMM:")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                Layout.column: 0
                Layout.row: 7
            }
            Text {
                id: text20
                text: qsTr("A1TFD76349")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 1
                Layout.row: 7
            }

            Text {
                id: text21
                text: qsTr("4/18/2018")
                font.capitalization: Font.MixedCase
                font.pixelSize: 12
                Layout.column: 2
                Layout.row: 7
            }
        }
    }
}
