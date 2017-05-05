import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
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
                id: aviHeader
                detailTitle: "DISTANCE TO FAULT"
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
                            isDTFMode: true
                            markerMinVal: 0
                            markerMaxVal: 15
                            markerStepSize: 0.1
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
                                        id: coaxComboBox
                                        implicitWidth: parent.width
                                        implicitHeight: parent.height
                                        style: ComboBoxStyle{
                                            background: Rectangle{
                                                height: coaxComboBox.height
                                                width: coaxComboBox.width
                                                color: coaxComboBox.pressed ? "#D0D0D0" : "#E0E0E0"
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
                                                    id: txt
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    anchors.left: parent.left
                                                    anchors.leftMargin: 5
                                                    font.pointSize: 11
                                                    color: "#333333"
                                                    text: "COAX: " + control.currentText + "  VEL " + coaxList.get(coaxComboBox.currentIndex).vel
                                                }
                                                TextField {
                                                    id: velocityField
                                                    z: 100
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    anchors.left: txt.right
                                                    visible: coaxComboBox.currentIndex == 4
                                                    implicitWidth: 50
                                                    font.pointSize: 10
                                                    placeholderText: "0.01-1.00"
                                                    validator: RegExpValidator{
                                                        regExp:  /((0(\.[1-9]{2})?)|(1(\.0)?))/
                                                    }
                                                }
                                            }
                                        }
                                        model: ListModel {
                                            id: coaxList
                                            ListElement { text: "PE Solid"; vel: "66%"}
                                            ListElement { text: "PE Foam"; vel: "85%"}
                                            ListElement { text: "Teflon"; vel: "70%"}
                                            ListElement { text: "Teflon Foam"; vel: "80%"}
                                            ListElement { text: "User"; vel: ""}
                                        }
                                    }

                                }
                            }

                            AviModeCtrl{
                                currentModeIndex: 2
                            }

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
                                    color: Universal.foreground
                                    font.pointSize: 10
                                    text: chartCtrl.isDTFUnitSwitched ? "M" + num + "  " + _val.toFixed(1) +" Ft" : "M" + num + "  " + _val.toFixed(1) +" m"
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
