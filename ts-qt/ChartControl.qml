import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

GridLayout{
    anchors.left: parent.left
    anchors.right: parent.right
    rowSpacing: 0
    SwitchDelegate{
        id: rlScaleSwitch
        Layout.columnSpan: 2
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
    }

    SwitchDelegate{
        id: vswrScaleSwitch
        Layout.column: 1
        Layout.alignment: Qt.AlignRight
        Layout.columnSpan: 2
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
        Layout.fillHeight: true
        Layout.fillWidth: true
        source: "qrc:/img/img/graph-back.png"
        fillMode: Image.Stretch
    }

    ListView{
        id: rLValsList
        Layout.row: 2
        Layout.column: 0
        Layout.fillHeight: true
        width: 20
        model: rlScaleSwitch.checked ? rLVals2Model : rLValsModel
        delegate: Component{
            Rectangle{
                width: parent.width
                height: (rLValsList.height - 9)/(rLValsModel.count - 1)
                color: Universal.background
                Text{
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
        width: 20
        model: rlScaleSwitch.checked ? vswrVals2Model : vswrValsModel
        delegate: Component{
            Rectangle{
                width: parent.width
                height: (vswrValsList.height - 9)/(vswrValsModel.count - 1)
                color: Universal.background
                Text{
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

    Slider{
        id: defaultMarkerSlider
        Layout.row: 1
        Layout.column: 1
        Layout.topMargin: 10
        Layout.fillWidth: true
        implicitHeight: 20
        value: defaultMarkerVal
        style: SliderStyle {
            groove: Rectangle {
                Layout.fillWidth: parent
                color: "transparent"
            }
            handle:
                Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "#dddddd" : "#eeeeee"
                border.color: "#aaaaaa"
                border.width: 1
                implicitWidth: 22
                implicitHeight: 20
                radius: 2
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "M1"
                }
                Rectangle{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.bottom
                    color: "orange"
                    width: 1.5
                    height: graphImage.height
                }
                MouseArea{
                    anchors.fill: parent
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    onClicked: {console.log("default marker selected") }
                }
            }
        }
    }
    Repeater{
        model: userMarkersModel
        Slider{
            id: userMarkerSlider
            Layout.row: 1
            Layout.column: 1
            Layout.topMargin: 10
            Layout.fillWidth: true
            implicitHeight: 20
            minimumValue: defaultMarkerSlider.minimumValue
            maximumValue: defaultMarkerSlider.maximumValue
            style: SliderStyle {
                groove: Rectangle {
                    Layout.fillWidth: parent
                    color: "transparent"
                }
                handle:
                    Rectangle {
                    anchors.centerIn: parent
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
                        color: "yellow"
                        width: 1.5
                        height: graphImage.height
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: selectedMarker = userMarkerSlider
                    }
                }
            }
        }
    }
    ListModel{ id: userMarkersModel }
}

