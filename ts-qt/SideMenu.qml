import QtQuick 2.7

Item {
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
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        navigationModel.currentView = navigationModel.getTargetView("_section", id)
                        listViewLeftMenu.currentIndex = index
                        sideMenuPopup.close()
                    }
                }
            }
        }
        highlight: Rectangle {
            color: '#0d000000'
        }
    }
}
