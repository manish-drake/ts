import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    Rectangle {
        id: rectangle
        color: "#f4f4f4"
        anchors.fill: parent
        anchors.topMargin: 6
        anchors.leftMargin: 6

        Rectangle {
            id:card
            color:"#ffffff"
            width: parent.width-6
            height: parent.height-6
            border.color: "Lightgray"
            border.width: 0.5
            radius: 5

            Text {
                id: text9
                text: qsTr("GPS")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                font.pixelSize: 13
                font.bold: Font.DemiBold
            }

            GridLayout {
                y: 70
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.right: parent.right
                anchors.rightMargin: 50
                rows: 11
                columns: 2
                rowSpacing:20

                Text {
                    id: text1
                    text: qsTr("GPS SOURCE:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                }

                Text {
                    id: text5
                    color: "#575656"
                    text: qsTr("Internal")
                    font.pixelSize: 12
                    Layout.column: 1
                }

                Text {
                    id: text2
                    text: qsTr("GPS FORMAT:")
                    font.pixelSize: 12
                    Layout.row: 1
                    font.bold: Font.Medium
                }

                Text {
                    id: text6
                    color: "#575656"
                    text: qsTr("DMS")
                    renderType: Text.NativeRendering
                    font.pixelSize: 12
                    Layout.column: 1
                    Layout.row: 1
                }

                Text {
                    id: text3
                    text: qsTr("ALT FORMAT:")
                    font.pixelSize: 12
                    Layout.row: 2
                    font.bold: Font.Medium
                }

                Text {
                    id: text7
                    color: "#575656"
                    text: qsTr("Feet")
                    font.pixelSize: 12
                    Layout.column: 1
                    Layout.row: 2
                }

                Text {
                    id: text4
                    text: qsTr("CURRENT LAT:")
                    font.pixelSize: 12
                    Layout.row: 3
                    font.bold: Font.Medium
                }

                Text {
                    id: text8
                    text: qsTr("51-3012.1VN?")
                    font.pixelSize: 12
                    Layout.column: 1
                    Layout.row: 3
                }

                Text {
                    id: text10
                    text: qsTr("CURRENT LON:")
                    Layout.row: 4
                    font.pixelSize: 12
                    font.bold: Font.Medium
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
                    Layout.row: 5
                    font.pixelSize: 12
                    font.bold: Font.Medium
                }

                Text {
                    id: text13
                    text: qsTr("09:15:45")
                    Layout.row: 5
                    Layout.column: 1
                    font.pixelSize: 12
                }

                Text {
                    id: text14
                    text: qsTr("CURRENT DATE:")
                    Layout.row: 6
                    font.pixelSize: 12
                    Layout.column: 0
                    font.bold: Font.Medium
                }

                Text {
                    id: text15
                    text: qsTr("03/15/2017")
                    Layout.row: 6
                    font.pixelSize: 12
                    Layout.column: 1
                }

                Text {
                    id: text16
                    text: qsTr("CURRENT ALT:")
                    Layout.row: 7
                    font.pixelSize: 12
                    Layout.column: 0
                    font.bold: Font.Medium
                }

                Text {
                    id: text17
                    text: qsTr("124 Ft")
                    Layout.row: 7
                    font.pixelSize: 12
                    Layout.column: 1
                }

                Text {
                    id: text18
                    text: qsTr("MANUAL LAT:")
                    Layout.row: 8
                    font.pixelSize: 12
                    Layout.column: 0
                    font.bold: Font.Medium
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
                    font.bold: Font.Medium
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

}
