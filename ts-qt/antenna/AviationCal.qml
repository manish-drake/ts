import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    property string mode
    Page {
        id: item1
        anchors.fill: parent
        header: Rectangle{
            id:testHeaderRect
            height: 40
            anchors.left:parent.left
            anchors.right:parent.right
            color: Universal.background
            Text {
                id: testTitle
                anchors.centerIn: parent
                text: "CALIBRATE"
                font.pixelSize: 14
                font.weight: Font.DemiBold
                color: Universal.foreground
            }
            Item{
                id: rectangle
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: 50
                Image {
                    id: closeImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Delete-25.png"
                }
                ColorOverlay{
                    anchors.fill: closeImage
                    source: closeImage
                    color: Universal.accent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:calPopup.close()
                }
            }
        }
        contentItem: Rectangle {
            color: Universal.background
            ColumnLayout{
                anchors.fill: parent
                anchors.margins: 20
                spacing: 5
                Item{}
                AviBandCtrl{
                    visible: mode == "VSWR/CL"
                    isEnabled: false
                }
                AviCoaxCtrl{visible: mode == "COAX"}
                Rectangle{
                    id:calLastStatus
                    Layout.row: 2
                    Layout.fillWidth: true
                    height: 25
                    radius: 3
                    color:"#A7A9AC"

                    Text{
                        visible: mode == "VSWR/CL"
                        Layout.fillWidth: true
                        text: "ILS last calibrated 07/01/2017 3:15pm"
                        anchors.horizontalCenter: calLastStatus.horizontalCenter
                        anchors.verticalCenter: calLastStatus.verticalCenter
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
                        color: "white"
                    }
                    Text{
                        visible: mode == "COAX"
                        Layout.fillWidth: true
                        text: "PE Solid last calibrated 07/01/2017 3:15pm"
                        anchors.horizontalCenter: calLastStatus.horizontalCenter
                        anchors.verticalCenter: calLastStatus.verticalCenter
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
                        color: "white"
                    }
                }

                RowLayout{
                    Layout.row: 3
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignCenter
                    Layout.topMargin: 15
                    ColumnLayout{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Text{
                            Layout.fillWidth: true
                            text: "OPEN"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            color: Universal.foreground
                            opacity: 0.7
                        }
                        Rectangle{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "#E6E7E8"
                            radius: 3
                            ColumnLayout{
                                anchors.fill: parent
                                Item{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Image {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        source: "qrc:/img/img/Open.png"
                                    }
                                }
                                Rectangle{
                                    visible: false
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea2.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Text{
                                        anchors.centerIn: parent
                                        font.pixelSize: 12
                                        font.weight: Font.DemiBold
                                        text: "MEASURE"
                                        color: "white"
                                    }
                                    MouseArea{
                                        id: mouseArea2
                                        anchors.fill: parent
                                        onClicked: {}
                                    }
                                }
                                Rectangle{
                                    visible: true
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea3.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Text{
                                        anchors.centerIn: parent
                                        font.pixelSize: 11
                                        font.weight: Font.DemiBold
                                        text: "RE-MEASURE"
                                        color: "white"
                                    }
                                    MouseArea{
                                        id: mouseArea3
                                        anchors.fill: parent
                                        onClicked: {}
                                    }
                                }
                            }
                        }
                    }
                    ColumnLayout{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Text{
                            Layout.fillWidth: true
                            text: "LOAD"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            color: Universal.foreground
                            opacity: 0.7
                        }
                        Rectangle{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "#E6E7E8"
                            radius: 3
                            ColumnLayout{
                                anchors.fill: parent
                                Item{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Image {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        source: "qrc:/img/img/Load.png"
                                    }
                                }
                                Rectangle{
                                    visible: false
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea9.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Text{
                                        anchors.centerIn: parent
                                        font.pixelSize: 12
                                        font.weight: Font.DemiBold
                                        text: "MEASURE"
                                        color: "white"
                                    }
                                    MouseArea{
                                        id: mouseAre9
                                        anchors.fill: parent
                                        onClicked: {}
                                    }
                                }
                                Rectangle{
                                    visible: true
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea5.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Text{
                                        anchors.centerIn: parent
                                        font.pixelSize: 11
                                        font.weight: Font.DemiBold
                                        text: "RE-MEASURE"
                                        color: "white"
                                    }
                                    MouseArea{
                                        id: mouseArea5
                                        anchors.fill: parent
                                        onClicked: {}
                                    }
                                }
                            }
                        }
                    }
                    ColumnLayout{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Text{
                            Layout.fillWidth: true
                            text: "THRU"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            color: Universal.foreground
                            opacity: 0.7
                        }
                        Rectangle{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "#E6E7E8"
                            radius: 3
                            ColumnLayout{
                                anchors.fill: parent
                                Item{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Image {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        source: "qrc:/img/img/Thru.png"
                                    }
                                }
                                Rectangle{
                                    visible: true
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea6.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Text{
                                        anchors.centerIn: parent
                                        font.pixelSize: 12
                                        font.weight: Font.DemiBold
                                        text: "MEASURE"
                                        color: "white"
                                    }
                                    MouseArea{
                                        id: mouseArea6
                                        anchors.fill: parent
                                        onClicked: {}
                                    }
                                }
                                Rectangle{
                                    visible: false
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea7.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Text{
                                        anchors.centerIn: parent
                                        font.pixelSize: 11
                                        font.weight: Font.DemiBold
                                        text: "RE-MEASURE"
                                        color: "white"
                                    }
                                    MouseArea{
                                        id: mouseArea7
                                        anchors.fill: parent
                                        onClicked: {}
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        footer: Rectangle {
            height: 80
            color: Universal.background
            RowLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                height: 40
                spacing: 8
                Rectangle{
                    Layout.fillHeight: true
                    width: 135
                    color: Universal.accent
                    opacity: mouseArea4.pressed ? 0.8 : 1.0
                    radius: 3
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
                        text: "DONE"
                        color: "white"
                    }
                    MouseArea{
                        id: mouseArea4
                        anchors.fill: parent
                        onClicked: {}
                    }
                }
                Rectangle{
                    Layout.column: 1
                    Layout.columnSpan: 2
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: Universal.accent
                    opacity: mouseArea.pressed ? 0.8 : 1.0
                    radius: 3
                    Text{
                        anchors.centerIn: parent
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
                        text: "CALCULATE PARAMETERS"
                        color: "white"
                    }
                    MouseArea{
                        id: mouseArea
                        anchors.fill: parent
                        onClicked: {}
                    }
                }
            }
        }
    }
}
