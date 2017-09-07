import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Rectangle{
    color: Universal.theme === Universal.Light ? "#F1F2F2" : "#494949"
    Universal.accent: "#34BFCE"
    property int selectedMenuIndex: 1
    ColumnLayout{
        anchors.fill: parent
        spacing: 0
        Image {
            id:profileImage
            Layout.topMargin: 10
            Layout.bottomMargin: 10
            Layout.leftMargin: 12
            source: "qrc:/img/img/profile-circle2.png"
        }
        Rectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            height: 1
            color: "black"
            opacity: Universal.theme === Universal.Light ? 0.15 : 0.3
        }
        Item{
            anchors.left: parent.left
            anchors.right: parent.right
            height: 60
            GridLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 12
                rowSpacing: 0
                Text{
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: currentUser
                    color: Universal.accent
                    font.pixelSize: 16
                    font.weight: Font.Black
                    font.family: robotoRegular.name
                }
                Text{
                    Layout.row: 1
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: currentUserEmail
                    color: Universal.accent
                    font.pixelSize: 14
                    font.weight: Font.Black
                    font.family: robotoRegular.name
                }
                Image{
                    Layout.column: 1
                    Layout.rowSpan: 2
                    source: "qrc:/img/img/Expand Arrow.png"
                }
            }
        }
        Rectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            height: 1
            color: "black"
            opacity: Universal.theme === Universal.Light ? 0.15 : 0.3
        }
        Rectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            Layout.fillHeight: true
            color: Universal.theme === Universal.Light ? Universal.background : "#38363C"
            ListView {
                id: listViewLeftMenu
                anchors.fill: parent
                anchors.topMargin: 8
                anchors.bottomMargin: 8
                model: sectionGroupModel
                delegate:  Component {
                    ColumnLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        spacing: 0
                        Text{
                            Layout.topMargin: 2.5
                            Layout.bottomMargin: 2.5
                            Layout.leftMargin: 20
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
                            Item {
                                anchors.left: parent.left
                                anchors.right: parent.right
                                height: 54
                                Item {
                                    anchors.fill: parent
                                    anchors.rightMargin: 30
                                    anchors.topMargin: 3
                                    anchors.bottomMargin: 3
                                    Rectangle {
                                        anchors.fill: parent
                                        anchors.leftMargin: -radius
                                        radius: 24
                                        border.width: 2
                                        border.color: selectedMenuIndex === model.modelData.id ? "#26909C" : Universal.accent
                                        color: selectedMenuIndex === model.modelData.id ? "#26909C" : "transparent"
                                        RowLayout{
                                            anchors.fill: parent
                                            Text {
                                                Layout.fillWidth: true
                                                Layout.alignment: Qt.AlignVCenter
                                                Layout.leftMargin: 54
                                                text: model.modelData.name
                                                font.pixelSize: 17
                                                font.weight: Font.Bold
                                                font.family: robotoRegular.name
                                                elide: Text.ElideRight
                                                color: selectedMenuIndex === model.modelData.id ? "White" : Universal.accent
                                            }
                                            Rectangle{
                                                Layout.rightMargin: 15
                                                Layout.alignment: Qt.AlignVCenter
                                                height: 20
                                                width: 20
                                                radius: 10
                                                color: Universal.theme === Universal.Light ? Universal.background : "#38363C"
                                                visible: selectedMenuIndex === model.modelData.id
                                                Rectangle{
                                                    anchors.centerIn: parent
                                                    height: 10
                                                    width: 10
                                                    radius: 5
                                                    color: "#26909C"
                                                }
                                            }
                                        }
                                    }
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: parent.opacity = 0.2
                                    onReleased: parent.opacity = 1
                                    onCanceled: parent.opacity = 1
                                    onClicked: {
                                        navigationModel.currentView = navigationModel.getTargetView("_section", model.modelData.id)
                                        headerTitle = model.modelData.name
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
    Rectangle{
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 1
        color: Universal.foreground
        opacity: 0.1
    }
}
