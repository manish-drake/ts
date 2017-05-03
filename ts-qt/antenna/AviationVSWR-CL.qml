import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1


Item{
    property var selectedMarker: defaultMarkerSlider
    property int freqStartVal
    property int freqMiddleVal
    property int freqEndVal
    property double defaultMarkerVal: 0.0
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
            header: AviHeaderContent{}

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

                        ChartControl{}

                        GridLayout {
                            id: grid
                            anchors.left: parent.left
                            anchors.right: parent.right
                            columns: 2
                            columnSpacing: 15
                            rowSpacing: 20
                            Rectangle {
                                color: Universal.theme == Universal.Dark ? "#333333" : "#f5f5f5"
                                Layout.fillWidth: true
                                height: 40

                                GridLayout{
                                    anchors.fill: parent
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        leftPadding: 10
                                        font.pointSize: 10
                                        text: qsTr("BAND:")
                                        color: Universal.foreground
                                    }
                                    Rectangle{
                                        Layout.column: 1
                                        Layout.fillWidth: true
                                    }
                                    ComboBox {
                                        id: bandComboBox
                                        Layout.column: 2
                                        implicitWidth: 120
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
                                            //freqStart.text = bandList.get(currentIndex).start
                                            //freqStop.text = bandList.get(currentIndex).stop + "MHz"
                                            //freqMiddle.text = bandList.get(currentIndex).middle
                                            //defaultMarkerSlider.minimumValue = bandList.get(currentIndex).start
                                            //defaultMarkerSlider.maximumValue = bandList.get(currentIndex).stop
                                            //defaultMarkerSlider.value = bandList.get(currentIndex).defaultmarker
                                            freqStartVal = bandList.get(currentIndex).start
                                            freqMiddleVal = bandList.get(currentIndex).middle
                                            freqEndVal = bandList.get(currentIndex).stop
                                            defaultMarkerVal = bandList.get(currentIndex).defaultmarker
                                        }
                                    }
                                }
                            }
                            AviModeCtrl{}
                            AviMarkerActionsCtrl{}
                        }
                    }
                }
            }

            footer: AviFooterContent{}
        }
    }
}
