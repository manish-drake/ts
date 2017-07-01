import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

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
            text: qsTr("USER DETAIL")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            color: Universal.foreground
        }

        Item{
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: 50
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
                onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
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
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 30

                Text {
                    text: qsTr("USER ID:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    color: Universal.foreground
                }
                Text {
                    Layout.column: 1
                    text: qsTr(navigationModel.navigationParameter.user.userID)
                    font.pixelSize: 12
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    text: qsTr("NAME:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 1
                    Layout.column: 1
                    text: qsTr(navigationModel.navigationParameter.user.userName)
                    font.pixelSize: 12
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 2
                    text: qsTr("LANGUAGE:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 2
                    Layout.column: 1
                    text: qsTr(navigationModel.navigationParameter.user.language)
                    font.pixelSize: 12
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    text: qsTr("EMAIL:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    Layout.column: 1
                    text: qsTr(navigationModel.navigationParameter.user.emailID)
                    font.pixelSize: 12
                    color: Universal.foreground
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
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "RESTORE FACTORY DEFAULTS"
                }

                Button{
                    Layout.row: 8
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "DELETE USER"
                    enabled: navigationModel.navigationParameter.user.isRemovable
                }
            }
        }
    }
}


