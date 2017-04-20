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
                opacity: 0.1
            }
        }
        Rectangle{
            anchors.right: parent.right
            height: parent.height
            width: 1
            color: "#bbbbbb"
        }
    }
}
