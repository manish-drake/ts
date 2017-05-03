import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Rectangle {
    Layout.row: 1
    Layout.fillWidth: true
    height: 40
    color: Universal.theme == Universal.Dark ? "#333333" : "#f5f5f5"
    GridLayout{
        anchors.fill: parent
        columnSpacing: 0
        Text {
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 10
            font.pointSize: 10
            text: qsTr("MARKER")
            color: Universal.foreground
        }
        Rectangle{
            Layout.column: 1
            Layout.fillWidth: true
        }
        Button{
            Layout.column: 2
            height: parent.height
            implicitWidth: 35
            text: "+"
            enabled: userMarkersModel.count < 3
            onClicked: userMarkersModel.append({"num": userMarkersModel.count+2})
        }
        Button{
            Layout.column: 3
            height: parent.height
            implicitWidth: 35
            text: "X"
            visible: userMarkersModel.count>0
            onClicked: userMarkersModel.remove(userMarkersModel.count-1,1)
        }
        Button{
            Layout.column: 4
            height: parent.height
            implicitWidth: 35
            text: "<<"
            onClicked: --selectedMarker.value
        }
        Button{
            Layout.column: 5
            height: parent.height
            implicitWidth: 35
            text: ">>"
            onClicked: selectedMarker.value++
        }
    }
}
