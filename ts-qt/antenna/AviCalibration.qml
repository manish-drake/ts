import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
//import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Item {
    property string mode
    property bool isOpenMeasured
    property bool isLoadMeasured
    property bool isThruMeasured
    property bool areParametersCalculated
    RowLayout{
        anchors.fill: parent
        Rectangle{
            Layout.fillWidth: true
            Layout.maximumWidth: 650
            Layout.alignment: Qt.AlignCenter
            anchors.verticalCenter: parent.verticalCenter
            radius: 4
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            height: content.height
            ColumnLayout{
                id: content
                anchors.left:parent.left
                anchors.right:parent.right
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Text {
                        anchors.centerIn: parent
                        text: "CALIBRATE"
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        width: 35
                        Image {
                            id: closeImage
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
//                                                ColorOverlay{
//                                                    anchors.fill: closeImage
//                                                    source: closeImage
//                                                    color: Universal.accent
//                                                }
                        MouseArea {
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked:calPopup.close()
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: grid1.height
                    GridLayout{
                        id: grid1
                        anchors.left: parent.left
                        anchors.right: parent.right
                        AviBandCtrl{
                            visible: mode == "VSWR/CL"
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: grid2.height
                    GridLayout{
                        id: grid2
                        anchors.left: parent.left
                        anchors.right: parent.right
                        AviCoaxCtrl{
                            visible: mode == "COAX"
                        }
                    }
                }
                Rectangle{
                    id:calLastStatus
                    Layout.row: 2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Layout.alignment: Qt.AlignTop
                    height: 27
                    radius: 13
                    color:"#A7A9AC"
                    RowLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        Text{
                            Layout.leftMargin: 15
                            Layout.maximumWidth: parent.width
                            elide: Text.ElideRight
                            visible: mode == "VSWR/CL"
                            text: "ILS last calibrated"
                            font.pixelSize: 14
                            font.family: robotoCondensedRegular.name
                            color: "white"
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            visible: mode == "VSWR/CL"
                            text: "07/01/2017 3:15pm"
                            font.pixelSize: 14
                            font.weight: Font.ExtraBold
                            font.family: robotoRegular.name
                            color: "white"
                        }
                        Text{
                            Layout.leftMargin: 15
                            elide: Text.ElideRight
                            visible: mode == "COAX"
                            text: "PE Solid last calibrated"
                            font.pixelSize: 14
                            font.family: robotoCondensedRegular.name
                            color: "white"
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            visible: mode == "COAX"
                            text: "07/01/2017 3:15pm"
                            font.pixelSize: 14
                            font.weight: Font.ExtraBold
                            font.family: robotoRegular.name
                            color: "white"
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Layout.topMargin: 15
                    height: 240
                    RowLayout{
                        anchors.fill: parent
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
                                                font.pixelSize: 14
                                                font.weight: Font.ExtraBold

                                                font.family: robotoRegular.name
                                                text: isOpenMeasured ? "RE-MEASURE" : "MEASURE"
                                                color: "white"
                                            }
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            onPressed: parent.opacity = 0.5
                                            onReleased: parent.opacity = 1
                                            onClicked: isOpenMeasured = true
                                        }
                                    }
                                }
                            }
                            Item{
                                Layout.alignment: Qt.AlignHCenter
                                visible: isOpenMeasured
                                height: checkedImg1.height
                                width: checkedImg1.width
                                opacity: 0.4
                                Image{
                                    id: checkedImg1
                                    source: "qrc:/img/img/checked.png"
                                }
//                                                                ColorOverlay{
//                                                                    anchors.fill: checkedImg1
//                                                                    source: checkedImg1
//                                                                    color: Universal.foreground
//                                                                }
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
                                                font.pixelSize: 14
                                                font.weight: Font.Black
                                                font.family: robotoRegular.name
                                                text: isLoadMeasured ? "RE-MEASURE" : "MEASURE"
                                                color: "white"
                                            }
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            onPressed: parent.opacity = 0.5
                                            onReleased: parent.opacity = 1
                                            onClicked: isLoadMeasured = true
                                        }
                                    }
                                }
                            }
                            Item{
                                Layout.alignment: Qt.AlignHCenter
                                visible: isLoadMeasured
                                height: checkedImg1.height
                                width: checkedImg1.width
                                opacity: 0.4
                                Image{
                                    id: checkedImg2
                                    source: "qrc:/img/img/checked.png"
                                }
//                                                                ColorOverlay{
//                                                                    anchors.fill: checkedImg2
//                                                                    source: checkedImg2
//                                                                    color: Universal.foreground
//                                                                }
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
                                                font.pixelSize: 14
                                                font.weight: Font.Black
                                                font.family: robotoRegular.name
                                                text: isThruMeasured ? "RE-MEASURE" : "MEASURE"
                                                color: "white"
                                            }
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            onPressed: parent.opacity = 0.5
                                            onReleased: parent.opacity = 1
                                            onClicked: isThruMeasured = true
                                        }
                                    }
                                }
                            }
                            Item{
                                Layout.alignment: Qt.AlignHCenter
                                visible: isThruMeasured
                                height: checkedImg1.height
                                width: checkedImg1.width
                                opacity: 0.4
                                Image{
                                    id: checkedImg3
                                    source: "qrc:/img/img/checked.png"
                                }
//                                                                ColorOverlay{
//                                                                    anchors.fill: checkedImg3
//                                                                    source: checkedImg3
//                                                                    color: Universal.foreground
//                                                                }
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
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Layout.topMargin: 30
                    Layout.bottomMargin: 25
                    height: 40
                    RowLayout{
                        anchors.fill: parent
                        spacing: 8
                        Rectangle{
                            Layout.fillHeight: true
                            width: 135
                            color: Universal.accent
                            radius: 3
                            Text{
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                font.family: robotoRegular.name
                                text: "DONE"
                                color: "white"
                            }
                            MouseArea{
                                anchors.fill: parent
                                onPressed: parent.opacity = 0.5
                                onReleased: parent.opacity = 1
                                onClicked: calPopup.close()
                            }
                        }
                        Rectangle{
                            Layout.column: 1
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            enabled: isOpenMeasured && isLoadMeasured
                            color: enabled ? Universal.accent : "lightgray"
                            radius: 3
                            Text{
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.margins: 5
                                horizontalAlignment: Text.AlignHCenter
                                elide: Text.ElideRight
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                font.family: robotoRegular.name
                                text: areParametersCalculated ? "RE-CALCULATE PARAMETERS" : "CALCULATE PARAMETERS"
                                color: "white"
                            }
                            MouseArea{
                                anchors.fill: parent
                                onPressed: parent.opacity = 0.5
                                onReleased: parent.opacity = 1
                                onClicked: areParametersCalculated = true
                            }
                        }
                    }
                }
            }
        }
    }

    Popup {
        id: bandSelectionPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: AviBandSelection{
            id: bandSelection
            isEnabled: false
        }
    }

    Popup {
        id: coaxSelectionPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: AviCoaxSelection{id: coaxSelection}
    }
}
