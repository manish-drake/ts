import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Graphs 1.0


RowLayout{
    property int freqStartVal
    property int freqMiddleVal
    property int freqEndVal
    property double markerMinVal
    property double markerMaxVal
    property double markerStepSize: 1
    property int selectedMarkerIndex: 0
    property double selectedMarkerVal
    property bool isDTFMode
    property bool isDTFUnitSwitched
    property bool areControlsAvailble: true
    property bool isScaleChecked
    property var refData
    anchors.left: parent.left
    anchors.right: parent.right
    spacing: 0
    GridLayout{
        Layout.fillWidth: true
        Layout.maximumWidth: 450
        Layout.alignment: Qt.AlignHCenter
        rowSpacing: 0
        columnSpacing: 0
        Item{
            Layout.columnSpan: 3
            Layout.fillWidth: true
            Layout.bottomMargin: 10
            height: 32
            SwitchDelegate{
                id: rlScaleSwitch
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 50
                enabled: areControlsAvailble
                opacity: enabled ? 1 : 0
                spacing: 0
                checked: vswrScaleSwitch.checked
                indicator:Rectangle{
                    anchors.fill: parent
                    radius: 3
                    color: parent.checked ? "#dddddd" : "#ededed"
                    border.width: 1
                    border.color: "lightgray"
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Return<br>Loss"
                        font.pixelSize: 12
                        font.family: robotoRegular.name
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                onPressed: opacity = 0.5
                onReleased: opacity = 1
                onCheckedChanged: {
                    isScaleChecked = checked
                }
            }
            SwitchDelegate{
                id: vswrScaleSwitch
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 50
                enabled: areControlsAvailble
                opacity: enabled ? 1 : 0
                spacing: 0
                implicitWidth: 50
                checked: rlScaleSwitch.checked
                indicator:Rectangle{
                    anchors.fill: parent
                    radius: 3
                    color: parent.checked ? "#dddddd" : "#ededed"
                    border.width: 1
                    border.color: "lightgray"
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "VSWR"
                        font.pixelSize: 12
                        font.family: robotoRegular.name
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                onPressed: opacity = 0.5
                onReleased: opacity = 1
            }
        }

        Rectangle{
            Layout.row: 2
            Layout.column: 1
            Layout.fillWidth: true
            Layout.maximumWidth: 400
            height: 256
            Image{
                id: graphImage
                anchors.fill: parent
                source: "qrc:/img/img/graph-back.png"
                fillMode: Image.Stretch
            }
            LineGraph{
                visible: areControlsAvailble
                refColor: "yellow"
                color: "green"
                width: parent.width
                height: parent.height
                points: dummy.points
                refPoints: refData
                size: 400
            }
        }

        ListView{
            id: rLValsList
            Layout.row: 2
            Layout.column: 0
            Layout.fillHeight: true
            width: 25
            enabled: false
            model: rlScaleSwitch.checked ? rLVals2Model : rLValsModel
            delegate: Component{
                Item{
                    anchors.left:parent.left
                    anchors.right:parent.right
                    height: (rLValsList.height - 9)/(rLValsModel.count - 1)
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: val
                        font.pixelSize: 12
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                }
            }
            ListModel{
                id: rLValsModel
                ListElement{ val: "0dB" }
                ListElement{ val: "-5" }
                ListElement{ val: "-10" }
                ListElement{ val: "-15" }
                ListElement{ val: "-20" }
                ListElement{ val: "-25" }
                ListElement{ val: "-30" }
            }
            ListModel{
                id: rLVals2Model
                ListElement{ val: "-6dB" }
                ListElement{ val: "-8" }
                ListElement{ val: "-10" }
                ListElement{ val: "-12" }
                ListElement{ val: "-14" }
                ListElement{ val: "-16" }
                ListElement{ val: "-18" }
            }
        }

        ListView{
            id: vswrValsList
            Layout.row: 2
            Layout.column: 2
            Layout.fillHeight: true
            width: 25
            enabled: false
            model: rlScaleSwitch.checked ? vswrVals2Model : vswrValsModel
            delegate: Component{
                Item{
                    anchors.left:parent.left
                    anchors.right:parent.right
                    height: (vswrValsList.height - 9)/(vswrValsModel.count - 1)
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: val
                        font.pixelSize: 12
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                }
            }
            ListModel{
                id: vswrValsModel
                ListElement{ val: "" }
                ListElement{ val: "3.6" }
                ListElement{ val: "1.9" }
                ListElement{ val: "1.4" }
                ListElement{ val: "1.2" }
                ListElement{ val: "1.1" }
                ListElement{ val: "1.0" }
            }
            ListModel{
                id: vswrVals2Model
                ListElement{ val: "" }
                ListElement{ val: "2.4" }
                ListElement{ val: "1.9" }
                ListElement{ val: "1.6" }
                ListElement{ val: "1.4" }
                ListElement{ val: "1.3" }
                ListElement{ val: "1.2" }
            }
        }

        ListView{
            id: impFreqList
            Layout.row: 3
            Layout.columnSpan: 2
            Layout.fillWidth: true
            height: 10
            leftMargin: 15
            rightMargin: 15
            orientation: ListView.Horizontal
            model: impFreqModel
            delegate: Component{
                Item{
                    width: (impFreqList.width - 30)/(impFreqModel.count - 1)
                    Text{
                        text: val
                        font.family: robotoRegular.name
                    }
                }
            }
            ListModel{
                id: impFreqModel
            }
        }

        Item{
            Layout.row: 4
            Layout.columnSpan: 3
            Layout.fillWidth: true
            Layout.leftMargin: 25
            Item{
                id: freqValsList
                visible: !isDTFMode
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 20
                Text{
                    id: freqStart
                    color: Universal.foreground
                    text: freqStartVal
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                }
                Text{
                    id: freqMiddle
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
                    text: freqMiddleVal
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                }
                Text{
                    id: freqStop
                    anchors.right: parent.right
                    color: Universal.foreground
                    text: freqEndVal + " MHz"
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                }
            }
            Item{
                visible: isDTFMode
                anchors.left: parent.left
                anchors.right: parent.right
                ListView{
                    id: lengthScale
                    anchors.left: parent.left
                    anchors.right: lengthUnitSwitch.left
                    anchors.top: parent.top
                    orientation: ListView.Horizontal
                    model: lengthUnitSwitch.checked ? feetScaleList : meterScaleList
                    delegate: Component{
                        Item{
                            width: (lengthScale.width - 15)/3
                            Text{
                                text: val
                                color: Universal.foreground
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                            }
                        }
                    }
                    ListModel{
                        id: meterScaleList
                        ListElement{ val: "0" }
                        ListElement{ val: "5" }
                        ListElement{ val: "10" }
                        ListElement{ val: "15" }
                    }
                    ListModel{
                        id: feetScaleList
                        ListElement{ val: "0" }
                        ListElement{ val: "16" }
                        ListElement{ val: "33" }
                        ListElement{ val: "49" }
                    }
                }
                SwitchDelegate{
                    id: lengthUnitSwitch
                    anchors.right: parent.right
                    spacing: 0
                    implicitHeight: 22
                    implicitWidth: 25
                    indicator:Rectangle{
                        anchors.fill: parent
                        color: "#ededed"
                        border.width: 1
                        border.color: "lightgray"
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: lengthUnitSwitch.checked ? "Ft" : "M"
                            horizontalAlignment: Text.AlignHCenter
                            font.family: robotoRegular.name
                        }
                    }
                    onCheckedChanged: {
                        isDTFUnitSwitched = checked
                        markerMaxVal = checked ? 49.21 : 15;
                        markersModel.get(selectedMarkerIndex)._val = checked ? (markersModel.get(selectedMarkerIndex)._val * 3.28084) : (markersModel.get(selectedMarkerIndex)._val / 3.28084)
                    }
                    onPressed: opacity = 0.5
                    onReleased: opacity = 1
                }
            }
        }
        Item{
            Layout.row: 1
            Layout.column: 1
            Layout.fillWidth: true
            Layout.leftMargin: -16
            Layout.rightMargin: -16
            height: 32
            Repeater{
                visible: areControlsAvailble
                model: markersModel
                Slider{
                    id: markerSlider
                    anchors.left: parent.left
                    anchors.right: parent.right
                    z: index == selectedMarkerIndex ? 1 : 0
                    implicitHeight: 32
                    minimumValue: markerMinVal
                    maximumValue: markerMaxVal
                    stepSize: markerStepSize
                    value: _val
                    style: SliderStyle {
                        groove:  Item{
                            Layout.fillWidth: parent
                        }
                        handle: Rectangle {
                            id: markerHandle
                            color: Universal.theme == Universal.Light ? Universal.background : "#414048"
                            border.color: index == selectedMarkerIndex ? Universal.accent : Universal.theme == Universal.Light ? "#66000000" : "#66ffffff"
                            border.width: 2
                            implicitWidth: 32
                            implicitHeight: 32
                            radius: 16
                            opacity: control.pressed ? 0.8 : 1
                            Text{
                                anchors.centerIn: parent
                                text: num
                                font.pixelSize: 16
                                font.family: robotoRegular.name
                                font.weight: Font.Black
                                color: index == selectedMarkerIndex ? Universal.accent : Universal.theme == Universal.Light ? "#80000000" : "#80ffffff"
                            }
                            Rectangle{
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.bottom
                                color: index == selectedMarkerIndex ? "orange" : "#99ffffff"
                                width: 2
                                height: graphImage.height
                            }
                            Text{
                                visible: !isDTFMode && index == selectedMarkerIndex
                                anchors.right: parent.left
                                anchors.rightMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                text: markerSlider.value;
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                                opacity: 0.8
                            }
                            Text{
                                visible: isDTFMode && index == selectedMarkerIndex
                                anchors.right: parent.left
                                anchors.rightMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                text: lengthUnitSwitch.checked ? (markerSlider.value).toFixed(2) + " Ft" : (markerSlider.value).toFixed(2) + " m"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                                opacity: 0.8
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: console.log("marker selected")
                            }
                        }
                    }
                    onValueChanged: {
                        _val = value
                        selectedMarkerVal = value
                    }
                }
            }
        }
    }
}


