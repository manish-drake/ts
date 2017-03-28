import QtQuick 2.0

Item {
    anchors.centerIn: parent
    anchors.fill: parent
    Rectangle {
        anchors.fill: parent
        anchors.centerIn: parent
        Text {
            id: txt
            text: testModel.getName()
        }
    }


    Component {
        id: testCardDelegate
        Item {
            width: grid.cellWidth; height: grid.cellHeight
            Column {
                anchors.fill: parent
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Card"
                }
            }
        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 80; cellHeight: 80

        model: testModel
        delegate: testCardDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
    }
}
