import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{
    border.color: "gray"
    border.width: 1
    property string mode
    property bool isOpenMeasured
    property bool isLoadMeasured
    property bool isThruMeasured
    property bool areParametersCalculated
    Page {
        id: item1
        anchors.fill: parent
        anchors.margins: 1
        header: Rectangle{
            id:testHeaderRect
            height: 40
            anchors.left:parent.left
            anchors.right:parent.right
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            Text {
                id: testTitle
                anchors.centerIn: parent
                text: "CALIBRATE"
                font.pixelSize: 14
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
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
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
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
                    Layout.alignment: Qt.AlignTop
                    height: 27
                    radius: 3
                    color:"#A7A9AC"
                    RowLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        clip: true
                        Text{
                            Layout.leftMargin: 15
                            elide: Text.ElideRight
                            visible: mode == "VSWR/CL"
                            text: "ILS last calibrated"
                            font.pixelSize: 12
                            font.family: robotoCondensedRegular.name
                            color: "white"
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            visible: mode == "VSWR/CL"
                            text: "07/01/2017 3:15pm"
                            font.pixelSize: 12
                            font.weight: Font.ExtraBold
                            font.family: robotoRegular.name
                            color: "white"
                        }
                        Text{
                            Layout.leftMargin: 15
                            elide: Text.ElideRight
                            visible: mode == "COAX"
                            text: "PE Solid last calibrated"
                            font.pixelSize: 12
                            font.family: robotoCondensedRegular.name
                            color: "white"
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            visible: mode == "COAX"
                            text: "07/01/2017 3:15pm"
                            font.pixelSize: 12
                            font.weight: Font.ExtraBold
                            font.family: robotoRegular.name
                            color: "white"
                        }
                    }
                }
                RowLayout{
                    Layout.row: 3
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter
                    Layout.topMargin: 15
                    Layout.maximumHeight: 240
                    ColumnLayout{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Text{
                            Layout.fillWidth: true
                            text: "OPEN"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
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
                                Image {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Layout.margins: 15
                                    source: "qrc:/img/img/Open.png"
                                    fillMode: Image.PreserveAspectFit
                                }
                                Rectangle{
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea2.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Row{
                                        anchors.centerIn: parent
                                        spacing: 5
                                        Image{
                                            Layout.alignment: Qt.AlignVCenter
                                            source: isOpenMeasured ? "qrc:/img/img/Reset-18.png" : "qrc:/img/img/Hunt-16.png"
                                        }
                                        Text{
                                            Layout.alignment: Qt.AlignVCenter
                                            elide: Text.ElideRight
                                            font.pixelSize: 12
                                            font.weight: Font.DemiBold
                                            font.family: robotoRegular.name
                                            text: isOpenMeasured ? "RE-MEASURE" : "MEASURE"
                                            color: "white"
                                        }
                                    }
                                    MouseArea{
                                        id: mouseArea2
                                        anchors.fill: parent
                                        onClicked: isOpenMeasured = true
                                    }
                                }
                            }
                        }
                        Image{
                            Layout.alignment: Qt.AlignHCenter
                            visible: isOpenMeasured
                            source: "qrc:/img/img/checked.png"
                            opacity: 0.4
                        }
                        Text{
                            Layout.fillWidth: true
                            visible: !isOpenMeasured
                            text: "REQUIRED"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
                            color: Universal.foreground
                            opacity: 0.7
                        }
                    }
                    ColumnLayout{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Text{
                            Layout.fillWidth: true
                            text: "LOAD"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
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
                                Image {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Layout.margins: 15
                                    source: "qrc:/img/img/Load.png"
                                    fillMode: Image.PreserveAspectFit
                                }
                                Rectangle{                                    
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea9.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Row{
                                        anchors.centerIn: parent
                                        spacing: 5
                                        Image{
                                            Layout.alignment: Qt.AlignVCenter
                                            source: isLoadMeasured ? "qrc:/img/img/Reset-18.png" : "qrc:/img/img/Hunt-16.png"
                                        }
                                        Text{
                                            Layout.alignment: Qt.AlignVCenter
                                            elide: Text.ElideRight
                                            font.pixelSize: 12
                                            font.weight: Font.DemiBold
                                            font.family: robotoRegular.name
                                            text: isLoadMeasured ? "RE-MEASURE" : "MEASURE"
                                            color: "white"
                                        }
                                    }
                                    MouseArea{
                                        id: mouseArea9
                                        anchors.fill: parent
                                        onClicked: isLoadMeasured = true
                                    }
                                }
                            }
                        }
                        Image{
                            Layout.alignment: Qt.AlignHCenter
                            visible: isLoadMeasured
                            source: "qrc:/img/img/checked.png"
                            opacity: 0.4
                        }
                        Text{
                            Layout.fillWidth: true
                            visible: !isLoadMeasured
                            text: "REQUIRED"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
                            color: Universal.foreground
                            opacity: 0.7
                        }
                    }
                    ColumnLayout{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Text{
                            Layout.fillWidth: true
                            text: "THRU"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
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
                                Image {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Layout.margins: 15
                                    source: "qrc:/img/img/Thru.png"
                                    fillMode: Image.PreserveAspectFit
                                }
                                Rectangle{
                                    Layout.fillWidth: true
                                    height: 35
                                    color: Universal.accent
                                    opacity: mouseArea6.pressed ? 0.8 : 1.0
                                    radius: 3
                                    Row{
                                        anchors.centerIn: parent
                                        spacing: 5
                                        Image{
                                            Layout.alignment: Qt.AlignVCenter
                                            source: isThruMeasured ? "qrc:/img/img/Reset-18.png" : "qrc:/img/img/Hunt-16.png"
                                        }
                                        Text{
                                            Layout.alignment: Qt.AlignVCenter
                                            elide: Text.ElideRight
                                            font.pixelSize: 12
                                            font.weight: Font.DemiBold
                                            font.family: robotoRegular.name
                                            text: isThruMeasured ? "RE-MEASURE" : "MEASURE"
                                            color: "white"
                                        }
                                    }
                                    MouseArea{
                                        id: mouseArea6
                                        anchors.fill: parent
                                        onClicked: isThruMeasured = true
                                    }
                                }
                            }
                        }
                        Image{
                            Layout.alignment: Qt.AlignHCenter
                            visible: isThruMeasured
                            source: "qrc:/img/img/checked.png"
                            opacity: 0.4
                        }
                        Text{
                            Layout.fillWidth: true
                            visible: !isThruMeasured
                            text: "OPTIONAL"
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
                            color: Universal.foreground
                            opacity: 0.4
                        }
                    }
                }
            }
        }
        footer: Rectangle {
            height: 80
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
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
                        font.family: robotoRegular.name
                        text: "DONE"
                        color: "white"
                    }
                    MouseArea{
                        id: mouseArea4
                        anchors.fill: parent
                        onClicked: calPopup.close()
                    }
                }
                Rectangle{
                    Layout.column: 1
                    Layout.columnSpan: 2
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    enabled: isOpenMeasured && isLoadMeasured
                    color: enabled ? Universal.accent : "lightgray"
                    opacity: mouseArea.pressed ? 0.8 : 1.0
                    radius: 3
                    Text{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.margins: 5
                        horizontalAlignment: Text.AlignHCenter
                        elide: Text.ElideRight
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        text: areParametersCalculated ? "RE-CALCULATE PARAMETERS" : "CALCULATE PARAMETERS"
                        color: "white"
                    }
                    MouseArea{
                        id: mouseArea
                        anchors.fill: parent
                        onClicked: areParametersCalculated = true
                    }
                }
            }
        }
    }
}
