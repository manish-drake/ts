import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"
    property string bandName
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        height: 50
        color: "transparent"
        ComboBox {
            id: bandComboBox
            implicitWidth: parent.width
            implicitHeight: parent.height
            textRole: "text"
            style: ComboBoxStyle{
                background: Rectangle{
                    height: bandComboBox.height
                    width: bandComboBox.width
                    color: bandComboBox.pressed ? "#D0D0D0" : "#E0E0E0"
                    Image {
                        source: "qrc:/img/img/Expand Arrow-20.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                    }
                }
                label:Item {
                    anchors.fill: parent
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 5
                        anchors.rightMargin: 20
                        elide: Text.ElideRight
                        font.pointSize: 11
                        color: "#333333"
                        text: "BAND: " + control.currentText
                    }
                }
            }
            model: ListModel {
                id: bandList
                ListElement { text: "ILS"; start: 50; stop: 350; middle: 150; defaultmarker: 150 }
                ListElement { text: "MB"; start: 50; stop: 100; middle: 75; defaultmarker: 75 }
                ListElement { text: "VHF NAV COM"; start: 100; stop: 150; middle: 125; defaultmarker: 125 }
                ListElement { text: "GS"; start: 310; stop: 360; middle: 335; defaultmarker: 360 }
                ListElement { text: "UHF COM"; start: 200; stop: 450; middle: 325; defaultmarker: 450 }
                ListElement { text: "DME/TACAN"; start: 900; stop: 1300; middle: 1100; defaultmarker: 1100 }
                ListElement { text: "XPNDR/UAT"; start: 1000; stop: 1120; middle: 1060; defaultmarker: 1060 }
                ListElement { text: "GPS/GNSS"; start: 1500; stop: 1650; middle: 1575; defaultmarker: 1575 }
                ListElement { text: "FULL"; start: 50; stop: 2000; middle: 1025; defaultmarker: 1025 }
            }
            onCurrentIndexChanged:{
                bandName = bandList.get(currentIndex).text
                chartCtrl.freqStartVal = bandList.get(currentIndex).start
                chartCtrl.freqMiddleVal = bandList.get(currentIndex).middle
                chartCtrl.freqEndVal = bandList.get(currentIndex).stop
                chartCtrl.markerMinVal = bandList.get(currentIndex).start
                chartCtrl.markerMaxVal = bandList.get(currentIndex).stop
                markersModel.get(0)._val = bandList.get(currentIndex).defaultmarker
            }
        }
    }
}
