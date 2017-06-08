import QtQuick 2.7
import QtQuick.Controls.Universal 2.1

Item {
    Rectangle{
        anchors.fill: parent
        color: Universal.background
        ListView {
            id: listViewLeftMenu
            anchors.fill: parent
            model: sectionModel
            clip:true
            focus: true
            delegate:  Component {
                Item{
                    height: 50
                    width: parent.width
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        padding:10
                        text: name
                        font.weight: Font.DemiBold
                        font.pointSize: 12
                        color: Universal.foreground
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        source: "qrc:/img/img/Forward-16.png"
                    }
                    Rectangle{
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: Universal.foreground
                        opacity: Universal.theme == Universal.Light ? 0.05 : 0.15
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
            highlight: Rectangle {
                color: Universal.foreground
                opacity: Universal.theme == Universal.Light ? 0.05 : 0.15
            }
        }
        Rectangle{
            anchors.right: parent.right
            height: parent.height
            width: 1
            color: Universal.foreground
            opacity: Universal.theme == Universal.Light ? 0.05 : 0.15
        }
    }
}
