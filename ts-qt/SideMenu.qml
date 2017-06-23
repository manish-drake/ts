import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    Page{
        anchors.fill: parent
        header: Rectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            height: 180
            color: "#D1D3D4"
            ColumnLayout{
                anchors.fill: parent
                anchors.margins: 15
                spacing: 0
                Image {
                    id:profileImage
                    source: "qrc:/img/img/profile-circle.png"
                }
                Text{
                    Layout.row: 1
                    text: "Operator"
                    color: Universal.accent
                    font.pixelSize: 14
                    font.weight: Font.DemiBold
                }
                Text{
                    Layout.row: 2
                    text: "operator@mail.com"
                    color: Universal.accent
                    font.pixelSize: 14
                    font.weight: Font.ExtraLight

                }
            }
        }
        contentItem: Rectangle{
            color: Universal.background
            ListView {
                id: listViewLeftMenu
                anchors.fill: parent
                anchors.margins: 7
                model: sectionModel
                clip: true
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
                                color: Universal.background
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    navigationModel.currentView = navigationModel.getTargetView("_section", id)
                                    headerTitle = name
                                    listViewLeftMenu.currentIndex = index
                                    sideMenuPopup.close()
                                }
                            }
                        }
                    }
                }
            }
            Rectangle{
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 1
                color: Universal.foreground
                opacity: Universal.theme == Universal.Light ? 0.05 : 0.15
            }
        }
    }
}
