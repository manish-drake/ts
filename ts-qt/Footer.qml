import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQml 2.2

Rectangle {
    id: rectangle4
    height: 50
    color: "#EEEEEE"

    Rectangle{
        id: rect1
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        Text {
            id: operatorName
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 10
            text: "Operator"
            elide: Text.ElideRight
        }
    }

    Rectangle{
        id: rect2
        anchors.fill: parent
        anchors.leftMargin: operatorName.width + 20
        anchors.rightMargin: grid.width + 20
        color: "transparent"
        clip: true
        Text {
            id: tsName
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
            text: "TestSet#5"
            elide: Text.ElideRight
        }
    }

    Rectangle {
        id: rectangle
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        GridLayout{
            id:grid
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            rowSpacing: 2
            columnSpacing: 7
            Image {
                id: directImage
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                source: "qrc:/img/img/Network Cable-25.png"
            }

            Text{
                text:"Direct"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.row: 1
                elide: Text.ElideRight
            }

            Image {
                id:imageBattery
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                fillMode: Image.Stretch
                Layout.column: 1
                source: "qrc:/img/img/battery.png"
            }

            Text{
                text:"Battery"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 1
                Layout.row: 1
                elide: Text.ElideRight
            }

            Image {
                Layout.column: 2
                id: wifiImage
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                source: "qrc:/img/img/wifi-signal-waves.png"
            }

            Text{
                Layout.column: 2
                Layout.row: 1
                text:"Wifi"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                elide: Text.ElideRight
            }

            Text{
                id:timeText
                Layout.column: 3
                Layout.row: 0
                font.pixelSize: 12
                text: Qt.formatDateTime(new Date(),"hh:mm")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                elide: Text.ElideRight
            }

            Text{
                id: dateText
                Layout.column: 3
                Layout.row: 1
                text: Qt.formatDateTime(new Date(),"M/d/yy")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                elide: Text.ElideRight
            }
        }
    }
}
