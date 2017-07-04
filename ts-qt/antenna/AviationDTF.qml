import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    Page {
        id: item1
        anchors.fill: parent
        header: AviHeaderContent{
            detailTitle: "DISTANCE TO FAULT"
        }

        contentItem: Rectangle {
            color: Universal.background
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Column{
                    id: content
                    y: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    spacing: 30

                    AviChartCtrl{
                        id: chartCtrl
                        isDTFMode: true
                        markerMinVal: 0
                        markerMaxVal: 15
                        markerStepSize: 0.01
                    }

                    GridLayout {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        columns: 2
                        columnSpacing: 15
                        rowSpacing: 20
                        height: 160
                        Item{
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            ColumnLayout{
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                Text{
                                    text: "COAX"
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold
                                    opacity: 0.7
                                }
                                Item{
                                    Layout.row: 1
                                    Layout.fillWidth: true
                                    height: 50
                                    ComboBox {
                                        id: coaxComboBox
                                        implicitWidth: parent.width
                                        implicitHeight: parent.height
                                        style: ComboBoxStyle{
                                            background: Rectangle{
                                                height: coaxComboBox.height
                                                width: coaxComboBox.width
                                                color: Universal.accent
                                                opacity: coaxComboBox.pressed ? 0.9 : 1.0
                                                radius: 3
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
                                                    anchors.right: parent.right
                                                    anchors.leftMargin: 10
                                                    anchors.rightMargin: 20
                                                    elide: Text.ElideRight
                                                    font.pixelSize: 14
                                                    color: "white"
                                                    font.weight: Font.DemiBold
                                                    text: control.currentText + "  VEL " + coaxList.get(coaxComboBox.currentIndex).vel
                                                }
                                                TextField {
                                                    id: velocityField
                                                    z: 100
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    anchors.left: txt.right
                                                    visible: coaxComboBox.currentIndex == 4
                                                    implicitWidth: 50
                                                    font.pixelSize: 14
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
                        }

                        AviModeCtrl{
                            currentModeIndex: 3
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
                                font.pixelSize: 14
                                text: chartCtrl.isDTFUnitSwitched ? "M" + num + "  " + _val.toFixed(2) +" Ft" : "M" + num + "  " + _val.toFixed(2) +" m"
                            }
                        }
                    }
                }
            }
            AviFooterContent{}
        }
    }

    Popup {
        id: savedDataPopup
        width: parent.width
        height: parent.height
        padding: 40
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: "#99000000"
        }
        contentItem: DataPopupContent{}
    }
}
