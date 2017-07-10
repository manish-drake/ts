import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0

Rectangle{
    color: Universal.theme == Universal.Light ? "#D1D3D4" : "#38363C"
    Universal.accent: "#25A1CC"
    ColumnLayout{
        anchors.fill: parent
        Image {
            id:profileImage
            Layout.topMargin: 12
            Layout.leftMargin: 12
            source: "qrc:/img/img/profile-circle.png"
        }
        Rectangle{
            Layout.row: 1
            Layout.fillWidth: true
            height: 60
            color: "#33000000"
            ColumnLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 12
                spacing: 0
                Text{
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: "Operator"
                    color: "white"
                    font.pixelSize: 14
                    font.bold: true
                    font.family: robotoRegular.name
                }
                Text{
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: "operator@mail.com"
                    color: "white"
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                }
            }
        }
        Item{
            Layout.row: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
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
                            anchors.margins: 3
                            color: index == listViewLeftMenu.currentIndex ? Universal.accent : Universal.theme == Universal.Light ? Universal.background : "#222222"
                            radius: 3
                            layer.enabled: true
                            layer.effect: DropShadow {
                                transparentBorder: true
                                horizontalOffset: 1.0
                                verticalOffset: 1.1
                                radius: 4.0
                                color: "#33000000"
                                spread: 0
                                opacity: 0.1
                            }
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                text: name
                                font.pixelSize: 16
                                font.weight: Font.DemiBold
                                font.family: robotoRegular.name
                                color: index == listViewLeftMenu.currentIndex ? "White" : Universal.theme == Universal.Light ? Universal.accent : "White"
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
