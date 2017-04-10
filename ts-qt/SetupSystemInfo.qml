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
                text: qsTr("SYSTEM INFO")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                font.pixelSize: 13
                font.bold: Font.DemiBold
                font.family: "Arial"
            }

            GridLayout {
                y:70
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.right: parent.right
                anchors.rightMargin: 50
                rows: 10
                columns: 3
                rowSpacing: 20

                Text {
                    id: text1
                    text: qsTr("SERIAL NUMBER:")
                    font.pixelSize: 12
                    font.family: "Arial"
                    font.bold:Font.Medium
                }

                Text {
                    id: text5
                    text: qsTr("12986A")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 1
                }

                Text {
                    id: text2
                    text: qsTr("SOFTWARE RELEASE:")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 1
                    font.bold:Font.Medium
                }

                Text {
                    id: text6
                    text: qsTr("7885")
                    renderType: Text.NativeRendering
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 1
                    Layout.row: 1
                }

                Text {
                    id: text3
                    text: qsTr("CAUBRATION DUE:")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 2
                    font.bold:Font.Medium
                }

                Text {
                    id: text7
                    text: qsTr("06/15/2018")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 1
                    Layout.row: 2
                }

                Text {
                    id: text4
                    text: qsTr("WARRANTY EXPIRATION:")
                    Layout.minimumHeight: 40
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.row: 3
                    font.bold:Font.Medium
                }

                Text {
                    id: text8
                    text: qsTr("03/22/2020")
                    Layout.minimumHeight: 40
                    font.pixelSize: 12
                    font.family: "Arial"
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
                    text: qsTr("INSTAllED FEATURES")
                    Layout.minimumHeight: 24
                    font.underline: true
                    font.family: "Arial"
                    font.pixelSize: 12
                    Layout.column: 0
                    Layout.row: 4
                    font.bold:Font.Medium
                }
                Text {
                    id: text11
                    text: qsTr("LICENCE KEY")
                    font.underline: true
                     font.family: "Arial"
                    font.pixelSize: 12
                    Layout.column: 1
                    Layout.row: 4
                    font.bold:Font.Medium
                }
                Text {
                    id: text12
                    text: qsTr("INSTALLED")
                    font.underline: true
                     font.family: "Arial"
                    font.pixelSize: 12
                    Layout.column: 2
                    Layout.row: 4
                    font.bold:Font.Medium
                }
                Text {
                    id: text13
                    text: qsTr("TRANSPONDER:")
                    font.pixelSize: 12
                     font.family: "Arial"
                    Layout.column: 0
                    Layout.row: 5
                    font.bold:Font.Medium
                }
                Text {
                    id: text14
                    text: qsTr("AlR9876345")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 1
                    Layout.row: 5
                }
                Text {
                    id: text15
                    text: qsTr("2/15/2017")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 2
                    Layout.row: 5
                }Text {
                    id: text16
                    text: qsTr("NAV:")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 0
                    Layout.row: 6
                    font.bold:Font.Medium
                }
                Text {
                    id: text17
                    text: qsTr("8vC9876348")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 1
                    Layout.row: 6
                }
                Text {
                    id: text18
                    text: qsTr("3/12/2017")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 2
                    Layout.row: 6
                }
                Text {
                    id: text19
                    text: qsTr("SECURE COMM:")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 0
                    Layout.row: 7
                    font.bold:Font.Medium
                }
                Text {
                    id: text20
                    text: qsTr("A1TFD76349")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 1
                    Layout.row: 7
                }

                Text {
                    id: text21
                    text: qsTr("4/18/2018")
                    font.pixelSize: 12
                    font.family: "Arial"
                    Layout.column: 2
                    Layout.row: 7
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
