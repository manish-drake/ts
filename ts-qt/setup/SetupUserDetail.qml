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
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("USER DETAIL")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
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
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
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

                Text {
                    elide: Text.ElideRight
                    text: qsTr("USER ID")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.column: 1
                    text: navigationModel.navigationParameter.user.userID
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 1
                    elide: Text.ElideRight
                    text: qsTr("NAME")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 1
                    Layout.column: 1
                    text: navigationModel.navigationParameter.user.userName
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 2
                    elide: Text.ElideRight
                    text: qsTr("LANGUAGE")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 2
                    Layout.column: 1
                    text: navigationModel.navigationParameter.user.language
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    elide: Text.ElideRight
                    text: qsTr("EMAIL")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    Layout.row: 3
                    Layout.column: 1
                    text: navigationModel.navigationParameter.user.emailID
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                Text {
                    Layout.row: 4
                    elide: Text.ElideRight
                    text: qsTr("EMAIL SAVED TESTS")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
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
                    enabled: false
                }

                Button{
                    Layout.row: 8
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "DELETE USER"
//                    enabled: navigationModel.navigationParameter.user.isRemovable
                    enabled: false
                }
            }
        }
    }
}


