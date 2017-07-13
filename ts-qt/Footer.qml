import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQml 2.2
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0

Rectangle {
    id: rectangle4
    height: 40
    color: Universal.theme == Universal.Light ? "#A7A9AC" : "#333333"
    property bool isController: true

    Text {
        id: operatorName
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.pixelSize: 15
        text: currentOperator
        font.weight: Font.DemiBold
        font.family: robotoRegular.name
        elide:  Text.ElideRight
        color: "#FFF"
    }

    Item{
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: operatorName.right
        anchors.leftMargin: 10
        anchors.right: grid.left
        anchors.rightMargin: 10
        clip: true
        Row{
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Image{
                id: symbolImg
                anchors.verticalCenter: parent.verticalCenter
                source: isController ? "qrc:/img/img/Controller-25.png" : "qrc:/img/img/Eye-25.png"
            }
            Text {
                id: tsName
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                text: "TestSet14"
                elide: Text.ElideRight
                color: "#FFF"
            }
        }
    }

    GridLayout{
        id:grid
        height: 38
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 30
        columnSpacing: 40
        Item{
            Layout.column: 0
            Layout.fillHeight: true
            Layout.fillWidth: true
            Image {
                id: img1
                anchors.centerIn: parent
                source: "qrc:/img/img/Network Cable-22.png"
            }
            ColorOverlay{
                anchors.fill: img1
                source: img1
                color: "#ffffff"
            }
        }

        Item{
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Image {
                id: img2
                anchors.centerIn: parent
                source: "qrc:/img/img/Full Battery-25.png"
            }
        }

        Item{
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            Image {
                id: img3
                anchors.centerIn: parent
                source: "qrc:/img/img/wifi-signal-waves.png"
            }
        }

    }
}
