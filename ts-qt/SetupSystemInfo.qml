import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    Rectangle{
        anchors.fill: parent
        anchors.margins: 10
        clip: true
        border.color: "#0d000000"
        border.width: 1
        radius: 5
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#0d000000"
            spread: 0
        }
        Column{
            anchors.fill: parent
            Rectangle{
                id: header
                anchors.left: parent.left
                anchors.right: parent.right
                height:40
                color:"transparent"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("SYSTEM INFO")
                    elide:Text.ElideRight
                    font.pointSize: 13
                    font.weight: Font.DemiBold
                    clip:true
                }
                Rectangle{
                    id: rectangle
                    width: 40
                    height: parent.height
                    anchors.right: parent.right
                    color:"transparent"
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/img/img/close.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                        }
                    }
                }
            }

            Flickable {
                width: parent.width;
                anchors.top: header.bottom
                anchors.bottom: parent.bottom
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                clip: true
                boundsBehavior: Flickable.StopAtBounds
                GridLayout {
                    id: grid
                    y: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    rowSpacing: 25
                    columnSpacing: 15

                    Text {
                        text: qsTr("SERIAL NUMBER:")
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }

                    Text {
                        Layout.column: 1
                        text: qsTr("14986A")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 1
                        text: qsTr("SOFTWARE RELEASE:")
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }

                    Text {
                        Layout.row: 1
                        Layout.column: 1
                        text: qsTr("7885")
                        renderType: Text.NativeRendering
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 2
                        text: qsTr("CAUBRATION DUE:")
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }
                    Text {
                        Layout.row: 2
                        Layout.column: 1
                        text: qsTr("06/15/2018")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 3
                        Layout.bottomMargin: 30
                        text: qsTr("WARRANTY EXPIRATION:")
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }
                    Text {
                        Layout.row: 3
                        Layout.column: 1
                        text: qsTr("03/22/2020")
                        Layout.bottomMargin: 30
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 4
                        text: qsTr("INSTAllED FEATURES")
                        font.underline: true
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }
                    Text {
                        Layout.row: 4
                        Layout.column: 1
                        text: qsTr("LICENCE KEY")
                        font.underline: true
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }
                    Text {
                        Layout.row: 4
                        Layout.column: 2
                        text: qsTr("INSTALLED")
                        font.underline: true
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }
                    Text {
                        Layout.row: 5
                        text: qsTr("TRANSPONDER:")
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }
                    Text {
                        Layout.row: 5
                        Layout.column: 1
                        text: qsTr("AlR9876345")
                        font.pixelSize: 14
                    }
                    Text {
                        Layout.row: 5
                        Layout.column: 2
                        text: qsTr("2/15/2017")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 6
                        text: qsTr("NAV:")
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }
                    Text {
                        Layout.row: 6
                        Layout.column: 1
                        text: qsTr("8vC9876348")
                        font.pixelSize: 14
                    }
                    Text {
                        Layout.row: 6
                        Layout.column: 2
                        text: qsTr("3/14/2017")
                        font.pixelSize: 14
                    }
                    Text {
                        Layout.row: 7
                        text: qsTr("SECURE COMM:")
                        font.pixelSize: 14
                        font.bold:Font.Medium
                    }
                    Text {
                        Layout.row: 7
                        Layout.column: 1
                        text: qsTr("A1TFD76349")
                        font.pixelSize: 14
                    }

                    Text {
                        Layout.row: 7
                        Layout.column: 2
                        text: qsTr("4/18/2018")
                        font.pixelSize: 14
                    }
                }
            }
        }
    }
}
