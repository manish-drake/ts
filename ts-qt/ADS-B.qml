import QtQuick 2.0

Item {
    anchors.centerIn: parent
    anchors.fill: parent
    anchors.leftMargin: 5
    anchors.topMargin: 5
    Component {
        id: testCardDelegate        
        Rectangle {
            id: wrapper
            border.color: "gray"
            border.width: 1
            radius: 5
            width: grid.cellWidth - 5;
            height: grid.cellHeight - 5

            Text {
                anchors.centerIn: parent
                text: name
            }

            MouseArea {
                anchors.fill: parent
                onClicked: navigationModel.currentView = navigationModel.getTargetView("_test", id)
            }
        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: grid.width/2; cellHeight: 200
        model: testModel
        delegate: testCardDelegate
        focus: true
    }
}
