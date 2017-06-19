import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Rectangle{
    anchors.fill: parent
    anchors.margins: 10
    color: Universal.background
    border.color: "#0d000000"
    border.width: 1
    radius: 3
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 1.1
        verticalOffset: 1.1
        radius: 4.0
        color: "#26000000"
        spread: 0
    }

    Page {
        id: item1
        anchors.fill: parent
        header: Rectangle{
            height: 40
            anchors.left:parent.left
            anchors.right:parent.right
            color: Universal.background
            Text {
                id: testTitle
                anchors.centerIn: parent
                text: qsTr("ADD USER")
                font.pointSize: 12
                font.weight: Font.DemiBold
                anchors.horizontalCenter: parent.horizontalCenter
                color: Universal.foreground
            }

            Item{
                width: 40
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Image {
                    id: closeImage
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Delete-25.png"
                }
                ColorOverlay{
                    anchors.fill: closeImage
                    source: closeImage
                    color: Universal.foreground
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                }
            }
        }

        contentItem: Rectangle {
            color: Universal.background
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                GridLayout {
                    id: grid
                    y: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    rowSpacing: 22
                    columnSpacing: 30

                    Text {
                        text: qsTr("USER ID:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    TextField {
                        Layout.column: 1
                        font.pixelSize: 12
                        placeholderText: "Enter User ID"
                    }

                    Text {
                        Layout.row: 1
                        text: qsTr("NAME:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    TextField {
                        Layout.row: 1
                        Layout.column: 1
                        font.pixelSize: 12
                        placeholderText: "Enter Name"
                    }

                    Text {
                        Layout.row: 2
                        text: qsTr("LANGUAGE:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    ComboBox{
                        Layout.row: 2
                        Layout.column: 1
                        currentIndex: 0
                        model: ListModel{
                            ListElement{text:"English"}
                        }
                    }

                    Text {
                        Layout.row: 3
                        text: qsTr("EMAIL:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    TextField {
                        Layout.row: 3
                        Layout.column: 1
                        font.pixelSize: 12
                        placeholderText: "Enter Email ID"
                    }
                    Text {
                        Layout.row: 4
                        text: qsTr("EMAIL SAVED TESTS:")
                        font.pixelSize: 12
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Switch {
                        Layout.row: 4
                        Layout.column: 1
                    }

                    Button{
                        Layout.row: 6
                        Layout.column: 0
                        Layout.alignment: Qt.AlignRight
                        text: "Save"
                        onClicked: {

                        }
                    }

                    Button{
                        Layout.row: 6
                        Layout.column: 1
                        text: "Cancel"
                        onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
                    }
                }
            }
        }
    }
}
