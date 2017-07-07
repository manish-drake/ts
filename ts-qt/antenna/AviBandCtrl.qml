import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item{
    Layout.row: 1
    Layout.column: 0
    Layout.fillWidth: true
    property string bandName
    property bool isEnabled: true
    height: content1.height
    ColumnLayout{
        id: content1
        anchors.left: parent.left
        anchors.right: parent.right
        Text{
            text: "BAND"
            font.pixelSize: 13
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            opacity: 0.7
        }
        Item{
            Layout.row: 1
            Layout.fillWidth: true
            height: 50
            ComboBox {
                id: bandComboBox
                implicitWidth: parent.width
                implicitHeight: parent.height
                currentIndex: 0
                textRole: "text"
                style: ComboBoxStyle{
                    background: Rectangle{
                        height: bandComboBox.height
                        width: bandComboBox.width
                        color: Universal.accent
                        opacity: bandComboBox.pressed ? 0.9 : 1.0
                        radius: 3
                        Image {
                            source: "qrc:/img/img/Expand Arrow-20.png"
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                        }
                    }
                    label:RowLayout {
                        anchors.fill: parent                        
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
                            color: "White"
                            text: control.currentText
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
                    if(isEnabled){
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
    }
}
