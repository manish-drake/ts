import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4

Page {
    id: item1
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("SYSTEM INFO")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
        }
    }

    contentItem: Rectangle {
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Flickable {
            anchors.fill: parent
            contentWidth: width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 15

                Text {
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("SERIAL NUMBER")
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.column: 1
                    text: qsTr("14986A")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("SOFTWARE RELEASE")
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    Layout.column: 1
                    text: qsTr("7885")
                    renderType: Text.NativeRendering
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 2
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("CAUBRATION DUE")
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 2
                    Layout.column: 1
                    text: qsTr("06/15/2018")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    Layout.bottomMargin: 30
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("WARRANTY EXPIRATION")
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 3
                    Layout.column: 1
                    text: qsTr("03/22/2020")
                    Layout.bottomMargin: 30
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 4
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("INSTALLED FEATURES")
                    font.underline: true
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 4
                    Layout.column: 1
                    text: qsTr("LICENCE KEY")
                    font.underline: true
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 4
                    Layout.column: 2
                    text: qsTr("INSTALLED")
                    font.underline: true
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 5
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("TRANSPONDER")
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 5
                    Layout.column: 1
                    text: qsTr("AlR9876345")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 5
                    Layout.column: 2
                    text: qsTr("2/15/2017")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 6
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("NAV")
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 6
                    Layout.column: 1
                    text: qsTr("8vC9876348")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 6
                    Layout.column: 2
                    text: qsTr("3/14/2017")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 7
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: qsTr("SECURE COMM")
                    font.pixelSize: 14
                    font.bold:Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 7
                    Layout.column: 1
                    text: qsTr("A1TFD76349")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 7
                    Layout.column: 2
                    text: qsTr("4/18/2018")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
            }
        }
    }
}
