import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0


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
                            height: 200
                            Rectangle{
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                Rectangle {
                                    color: Universal.theme == Universal.Dark ? "#333333" : "#f5f5f5"
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    height: 40
                                    GridLayout{
                                        anchors.fill: parent
                                        Text {
                                            anchors.verticalCenter: parent.verticalCenter
                                            leftPadding: 10
                                            font.pointSize: 10
                                            text: qsTr("COAX:")
                                            color: Universal.foreground
                                        }
                                        Rectangle{
                                            Layout.column: 1
                                            Layout.fillWidth: true
                                        }
                                        ComboBox {
                                            id: coaxComboBox
                                            Layout.column: 2
                                            implicitWidth: 70
                                            model: ListModel {
                                                id: coaxList
                                                ListElement { text: "PE Solid"}
                                                ListElement { text: "PE Foam"}
                                                ListElement { text: "Teflon"}
                                                ListElement { text: "Teflon Foam"}
                                                ListElement { text: "User"}
                                            }
                                        }
                                        Text {
                                            Layout.column: 3
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "VEL "
                                            color: Universal.foreground
                                        }
                                        ComboBox {
                                            id: coaxVelComboBox
                                            Layout.column: 4
                                            implicitWidth: 50
                                            visible: coaxComboBox.currentIndex != 4
                                            model: ListModel {
                                                ListElement { text: "66%"}
                                                ListElement { text: "85%"}
                                                ListElement { text: "70%"}
                                                ListElement { text: "80%"}
                                            }
                                        }
                                        TextField {
                                            id: velocityField
                                            visible: coaxComboBox.currentIndex == 4
                                            Layout.column: 4
                                            implicitWidth: 50
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pointSize: 10
                                            placeholderText: "0.01-1.00"
                                            validator: RegExpValidator{
                                                regExp:  /((0(\.[1-9]{2})?)|(1(\.0)?))/
                                            }
                                        }
                                    }
                                }
                            }

                            AviModeCtrl{
                                currentModeIndex: 2
                            }

                            AviMarkerActionsCtrl{}
                            ListModel{ id: userMarkersModel }
                        }
                    }
                }
            }

            footer: AviFooterContent{}
        }
    }
}
