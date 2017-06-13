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

    Text {
        id: operatorName
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.pointSize: 10
        text: currentOperator
        elide: Text.ElideRight
        color: Universal.foreground
    }

    Text {
        id: tsName
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: operatorName.right
        anchors.leftMargin: 10
        anchors.right: grid.left
        anchors.rightMargin: 10
        font.pointSize: 10
        text: "TestSet#5"
        elide: Text.ElideRight
        color: Universal.foreground
        horizontalAlignment: Text.AlignHCenter
    }
    GridLayout{
        id:grid
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        rowSpacing: 2
        columnSpacing: 12
        Image {
            Layout.row: 0
            Layout.column: 0
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            source: "qrc:/img/img/Network Cable-25.png"
            ColorOverlay{
                anchors.fill: parent
                source: parent
                color: Universal.foreground
            }
        }
        Text{
            Layout.row: 1
            Layout.column: 0
            text:"Direct"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            elide: Text.ElideRight
            color: Universal.foreground
        }

        Image {
            Layout.row: 0
            Layout.column: 1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            fillMode: Image.Stretch
            source: "qrc:/img/img/Full Battery-25.png"
            ColorOverlay{
                anchors.fill: parent
                source: parent
                color: Universal.foreground
            }
        }
        Text{
            Layout.row: 1
            Layout.column: 1
            text:"Battery"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            elide: Text.ElideRight
            color: Universal.foreground
        }

        Image {
            Layout.row: 0
            Layout.column: 2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            source: "qrc:/img/img/wifi-signal-waves.png"
            ColorOverlay{
                anchors.fill: parent
                source: parent
                color: Universal.foreground
            }
        }
        Text{
            Layout.row: 1
            Layout.column: 2
            text:"Wifi"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            elide: Text.ElideRight
            color: Universal.foreground
        }

        Text{
            Layout.row: 0
            Layout.column: 3
            id:timeText
            font.pixelSize: 12
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            elide: Text.ElideRight
            color: Universal.foreground
        }

        Text{
            Layout.row: 1
            Layout.column: 3
            id: dateText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            elide: Text.ElideRight
            color: Universal.foreground
        }

        Timer{
            interval: 1000
            running: true
            repeat: true
            triggeredOnStart: true
            onTriggered: {
                timeText.text = Qt.formatDateTime(new Date(),"hh:mm");
                dateText.text = Qt.formatDateTime(new Date(),"M/d/yy")
            }
        }

    }
}
