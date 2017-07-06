import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Rectangle{
    color: "#D1D3D4"
    ColumnLayout{
        anchors.fill: parent
        Image {
            id:profileImage
            Layout.topMargin: 12
            Layout.leftMargin: 12
            source: "qrc:/img/img/profile-circle.png"
        }
        ColumnLayout{
            Layout.row: 1
            Layout.fillWidth: true
            Layout.leftMargin: 12
            spacing: 0
            Text{
                text: "Operator"
                color: Universal.accent
                font.pixelSize: 14
                font.weight: Font.DemiBold
            }
            Text{
                text: "operator@mail.com"
                color: Universal.accent
                font.pixelSize: 14

            }
        }
        Rectangle{
            Layout.row: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Universal.background
            ListView {
                id: listViewLeftMenu
                anchors.fill: parent
                anchors.margins: 7
                model: sectionModel
                clip: true
                currentIndex: -1
                delegate:  Component {
                    Item{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 55
                        Rectangle{
                            anchors.fill: parent
                            anchors.margins: 2
                            color: index == listViewLeftMenu.currentIndex ? "#1B75BC" : Universal.accent
                            radius: 3
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                text: name
                                font.pixelSize: 16
                                font.weight: Font.DemiBold
                                font.family: robotoFont.name
                                color: Universal.background
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    navigationModel.currentView = navigationModel.getTargetView("_section", id)
                                    headerTitle = name
                                    listViewLeftMenu.currentIndex = index
                                    sideMenuDrawer.close()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
//    Rectangle{
//        anchors.right: parent.right
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom
//        width: 1
//        color: Universal.foreground
//        opacity: Universal.theme == Universal.Light ? 0.05 : 0.15
//    }
}
