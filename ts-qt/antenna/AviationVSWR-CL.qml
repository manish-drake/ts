import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        border.color: "#0d000000"
        border.width: 1
        radius:5
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#0d000000"
            spread: 0
        }
        Page {
            id: item1
            anchors.fill: parent
            header: AviHeaderContent{
                id: vswrClHeader
            }

            contentItem: Rectangle {
                color: Universal.background
                Flickable {
                    width: parent.width;
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    contentWidth: parent.width;
                    contentHeight: content.height + content.y + 10
                    clip: true
                    boundsBehavior: Flickable.StopAtBounds
                    Column{
                        id: content
                        y: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        spacing: 30

                        AviChartCtrl{
                            id: chartCtrl
                        }

                        GridLayout {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            columns: 2
                            columnSpacing: 15
                            rowSpacing: 20
                            height: 140
                            Rectangle{
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                color: "transparent"
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
                                                    source: "qrc:/img/img/Expand Arrow-25.png"
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
                                                    anchors.leftMargin: 5
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
                            AviModeCtrl{}
                            AviMarkerActionsCtrl{}
                            ListModel{
                                id: markersModel
                                ListElement{num: 1; _val: 0}

                            }
                        }

                        Column{
                            Repeater{
                                model: markersModel
                                Text{
                                    font.pointSize: 10
                                    text: "M" + num + "  " + _val
                                }
                            }
                        }
                    }
                }
                AviFooterContent{}
            }
        }
    }
}
