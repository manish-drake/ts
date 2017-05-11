import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import Graphs 1.0

GridLayout{
    property int freqStartVal
    property int freqMiddleVal
    property int freqEndVal
    property double markerMinVal
    property double markerMaxVal
    property double markerStepSize: 1
    property int selectedMarkerIndex: 0
    property bool isDTFMode
    property bool isDTFUnitSwitched
    property bool areControlsAvailble: true
    property bool isScaleChecked
    anchors.horizontalCenter: parent.horizontalCenter
    rowSpacing: 0
    columnSpacing: 0
    SwitchDelegate{
        id: rlScaleSwitch
        enabled: areControlsAvailble
        opacity: areControlsAvailble ? 1.0 : 0.6
        Layout.columnSpan: 2
        Layout.bottomMargin: 10
        spacing: 0
        implicitHeight: 30
        implicitWidth: 45
        checked: vswrScaleSwitch.checked
        indicator:Rectangle{
            anchors.fill: parent
            color: parent.checked ? "#bbbbbb" : "#cccccc"
            Text{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Return<br>Loss"
                horizontalAlignment: Text.AlignHCenter
            }
        }
        onCheckedChanged: {
            isScaleChecked = checked
        }
    }

    SwitchDelegate{
        id: vswrScaleSwitch
        enabled: areControlsAvailble
        opacity: enabled ? 1.0 : 0.6
        Layout.column: 1
        Layout.alignment: Qt.AlignRight
        Layout.columnSpan: 2
        Layout.bottomMargin: 10
        spacing: 0
        implicitHeight: 30
        implicitWidth: 45
        checked: rlScaleSwitch.checked
        indicator:Rectangle{
            anchors.fill: parent
            color: parent.checked ? "#bbbbbb" : "#cccccc"
            Text{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: "VSWR"
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    Image{
        id: graphImage
        Layout.row: 2
        Layout.column: 1
        Layout.alignment: Qt.AlignCenter
        width: 400;
        height: 256
        source: "qrc:/img/img/graph-back.png"
        fillMode: Image.Stretch
    }

    LineGraph{
        visible: areControlsAvailble
        color: "green"
        Layout.row: 2
        Layout.column: 1
        Layout.alignment: Qt.AlignCenter
        width: 400;
        height: 256
        points: dummy.points
        size: 400
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
            Rectangle{
                width: parent.width
                height: (rLValsList.height - 9)/(rLValsModel.count - 1)
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: val
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
            Rectangle{
                width: parent.width
                height: (vswrValsList.height - 9)/(vswrValsModel.count - 1)
                color: "transparent"
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: val
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
            Rectangle{
                height: parent.width
                width: (impFreqList.width - 30)/(impFreqModel.count - 1)
                Text{
                    text: val
                }
            }
        }
        ListModel{
            id: impFreqModel
        }
    }

    Rectangle{
        id: freqValsList
        visible: freqEndVal != 0
        Layout.row: 4
        Layout.columnSpan: 3
        Layout.fillWidth: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20
        Text{
            id: freqStart
            color: Universal.foreground
            text: freqStartVal
        }
        Text{
            id: freqMiddle
            anchors.horizontalCenter: parent.horizontalCenter
            color: Universal.foreground
            text: freqMiddleVal
        }
        Text{
            id: freqStop
            anchors.right: parent.right
            color: Universal.foreground
            text: freqEndVal + " MHz"
        }
    }

    Rectangle{
        visible: isDTFMode
        Layout.row: 4
        Layout.column: 1
        Layout.columnSpan: 2
        Layout.fillWidth: true
        ListView{
            id: lengthScale
            anchors.left: parent.left
            anchors.right: lengthUnitSwitch.left
            anchors.top: parent.top
            orientation: ListView.Horizontal
            model: lengthUnitSwitch.checked ? feetScaleList : meterScaleList
            delegate: Component{
                Rectangle{
                    width: (lengthScale.width - 15)/3
                    color: "transparent"
                    Text{
                        text: val
                        color: Universal.foreground
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
            implicitHeight: 20
            implicitWidth: 25
            indicator:Rectangle{
                anchors.fill: parent
                color: parent.checked ? "#bbbbbb" : "#cccccc"
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "M"
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onCheckedChanged: {
                isDTFUnitSwitched = checked
                markerMaxVal = checked ? 49 : 15;
                markersModel.get(selectedMarkerIndex)._val = checked ? (markersModel.get(selectedMarkerIndex)._val * 3.28084) : (markersModel.get(selectedMarkerIndex)._val / 3.28084)
            }
        }
    }
    Rectangle{
        Layout.row: 1
        Layout.column: 1
        height: 20
        color: "transparent"
    }

    Repeater{
        visible: areControlsAvailble
        model: markersModel
        Slider{
            id: markerSlider
            Layout.row: 1
            Layout.column: 1
            Layout.fillWidth: true
            implicitHeight: 20
            minimumValue: markerMinVal
            maximumValue: markerMaxVal
            stepSize: markerStepSize
            value: _val
            style: SliderStyle {
                groove: Rectangle {
                    Layout.fillWidth: parent
                    color: "transparent"
                }
                handle:
                    Rectangle {
                    color: control.pressed ? "#dddddd" : "#eeeeee"
                    border.color: "#aaaaaa"
                    border.width: 1
                    implicitWidth: 22
                    implicitHeight: 20
                    radius: 2
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "M" + num
                    }
                    Rectangle{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        color: "orange"
                        width: 1.5
                        height: graphImage.height
                    }
                    Text{
                        visible: !isDTFMode
                        anchors.right: parent.left
                        anchors.rightMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        text: markerSlider.value;
                    }
                    Text{
                        visible: isDTFMode
                        anchors.right: parent.left
                        anchors.rightMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        text: lengthUnitSwitch.checked ? (markerSlider.value).toFixed(1) + " Ft" : (markerSlider.value).toFixed(1) + " m"
                    }
                    MouseArea{
                        anchors.fill: parent
                    }
                }
            }
            onValueChanged: _val = value;
        }
    }
}


