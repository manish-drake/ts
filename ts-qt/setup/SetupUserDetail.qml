import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    Rectangle{
        anchors.fill: parent
        anchors.margins: 10
        clip: true
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
        Column{
            anchors.fill: parent
             Item{
                id: header
                anchors.left: parent.left
                anchors.right: parent.right
                height:40
                Text {
                    anchors.centerIn: parent
                    text: qsTr("USER DETAIL")
                    elide:Text.ElideRight
                    font.pointSize: 13
                    font.weight: Font.DemiBold
                    clip:true
                    color: Universal.foreground
                }
                 Item{
                    id: rectangle
                    width: 40
                    height: parent.height
                    anchors.right: parent.right
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/img/img/Delete-25.png"
                        ColorOverlay{
                            anchors.fill: parent
                            source: parent
                            color: Universal.foreground
                        }
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
}

