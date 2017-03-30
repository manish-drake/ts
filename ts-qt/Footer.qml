import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle {
    id: rectangle4
    height: 50
    color: "#EEEEEE"

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        height: 30
        width: 80
        color: "transparent"

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "Operator"
            font.capitalization: Font.AllUppercase
            fontSizeMode: Text.HorizontalFit
            color: "#000000"
            font.pointSize: 10
            anchors.leftMargin: 10
        }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "TestSet#5"
    }

    Rectangle {
        id: rectangle
        anchors.verticalCenterOffset: -20
        anchors.right: parent.right
        anchors.rightMargin: 110
        anchors.verticalCenter: parent.verticalCenter
        GridLayout{

            Image {
                id: directImage
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    source: "qrc:/img/img/direct.png"
                }

            Text{
                text:"Direct"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.row: 1
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
                }

                Image {
                    Layout.column: 2
                    id: wifiImage
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    source: "qrc:/img/img/wifi.png"
                }

                Text{
                    Layout.column: 2
                    Layout.row: 1
                    text:"Wifi"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
        }
    }
}
