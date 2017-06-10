import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQml 2.2
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0

Rectangle {
    id: rectangle4
    height: 50
    color: Universal.theme == Universal.Dark ? "black" : "#EEEEEE"
    property string currentOperator
     Item{
        id: rect1
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        Text {
            id: operatorName
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 10
            text: currentOperator
            elide: Text.ElideRight
            color: Universal.foreground
        }
    }

     Item{
        id: rect2
        anchors.fill: parent
        anchors.leftMargin: operatorName.width + 20
        anchors.rightMargin: grid.width + 20
        clip: true
        Text {
            id: tsName
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
            text: "TestSet#5"
            elide: Text.ElideRight
            color: Universal.foreground
        }
    }

    Item{
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
            columnSpacing: 12
            Image {
                id: directImage
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                source: "qrc:/img/img/Network Cable-25.png"
            }
            ColorOverlay{
                anchors.fill: directImage
                source: directImage
                color: Universal.foreground
            }

            Text{
                text:"Direct"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.row: 1
                elide: Text.ElideRight
                color: Universal.foreground
            }

            Image {
                id:imageBattery
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                fillMode: Image.Stretch
                Layout.column: 1
                source: "qrc:/img/img/Full Battery-25.png"
            }
            ColorOverlay{
                anchors.fill: imageBattery
                source: imageBattery
                color: Universal.foreground
            }

            Text{
                text:"Battery"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 1
                Layout.row: 1
                elide: Text.ElideRight
                color: Universal.foreground
            }

            Image {
                Layout.column: 2
                id: wifiImage
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                source: "qrc:/img/img/wifi-signal-waves.png"
            }
            ColorOverlay{
                anchors.fill: wifiImage
                source: wifiImage
                color: Universal.foreground
            }

            Text{
                Layout.column: 2
                Layout.row: 1
                text:"Wifi"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                elide: Text.ElideRight
                color: Universal.foreground
            }

            Timer{
                interval: 1000
                running: true
                repeat: true
                triggeredOnStart: true
                onTriggered: timeText.text = Qt.formatDateTime(new Date(),"hh:mm")
            }

            Text{
                id:timeText
                Layout.column: 3
                Layout.row: 0
                font.pixelSize: 12
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                elide: Text.ElideRight
                color: Universal.foreground
            }

            Timer{
                interval: 1000
                running: true
                repeat: true
                triggeredOnStart: true
                onTriggered: dateText.text = Qt.formatDateTime(new Date(),"M/d/yy")
            }

            Text{
                id: dateText
                Layout.column: 3
                Layout.row: 1
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                elide: Text.ElideRight
                color: Universal.foreground
            }
        }
    }
}
