import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Rectangle{
    color: Universal.theme === Universal.Light ? "#D1D3D4" : "#222222"
    Universal.accent: "#00AEEF"
    property int selectedMenuIndex: 1
    ColumnLayout{
        anchors.fill: parent
        Image {
            id:profileImage
            Layout.topMargin: 12
            Layout.leftMargin: 12
            source: "qrc:/img/img/profile-circle.png"
            sourceSize.width: 80
            sourceSize.height: 80
        }
        Item{
            Layout.row: 1
            Layout.fillWidth: true
            height: 60
            ColumnLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 12
                spacing: 0
                Text{
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: currentUser
                    color: Universal.accent
                    font.pixelSize: 14
                    font.weight: Font.Black
                    font.family: robotoRegular.name
                }
                Text{
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: currentUserEmail
                    color: Universal.accent
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                }
            }
        }
        Rectangle{
            Layout.row: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Universal.theme === Universal.Light ? Universal.background : "#38363C"
            ListView {
                id: listViewLeftMenu
                anchors.fill: parent
                anchors.margins: 10
                model: sectionGroupModel
                clip: true
                delegate:  Component {
                    ColumnLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            Layout.topMargin: 4
                            Layout.leftMargin: 10
                            text: name
                            font.capitalization: Font.AllUppercase
                            font.pixelSize: 12
                            font.family: robotoRegular.name
                            opacity: 0.6
                            color: Universal.foreground
                            visible: name != ""
                        }
                        Repeater{
                            model: sectionGroupModel.getSectionsForsecGroup(id)
                            Item{
                                anchors.left: parent.left
                                anchors.right: parent.right
                                height: 48
                                Rectangle{
                                    anchors.fill: parent
                                    color: selectedMenuIndex === model.modelData.id ? "#1B75BC" : Universal.theme === Universal.Light ? Universal.accent : "#222222"
                                    radius: 3
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 20
                                        text: model.modelData.name
                                        font.pixelSize: 17
                                        font.weight: Font.Bold
                                        font.family: robotoRegular.name
                                        color: "White"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            navigationModel.currentView = navigationModel.getTargetView("_section", model.modelData.id)
                                            mainheader.headerTitle = model.modelData.name
                                            selectedMenuIndex = model.modelData.id
                                            sideMenuDrawer.close()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
