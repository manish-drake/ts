import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import com.ti.controls 1.0



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
            header: Rectangle{
                id:testHeaderRect
                height: 40
                width: parent.width
                color: Universal.background
                Rectangle{
                    id: rectangle1
                    anchors.margins: 10
                    Layout.fillHeight: true
                    height:25
                    width: 25
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    color:"transparent"
                }

                Column{
                    topPadding: 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        id: testTitle
                        text: "VSWR"
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: Universal.foreground
                    }
                    //                PageIndicator {
                    //                    id: pageIndicator
                    //                    anchors.horizontalCenter: parent.horizontalCenter
                    //                    count: pageIdx
                    //                    currentIndex: summaryModel.currentPage
                    //                    ColorOverlay{
                    //                        anchors.fill: parent
                    //                        source: parent
                    //                        color: Universal.foreground
                    //                        visible: Universal.theme == Universal.Dark
                    //                    }
                    //                }
                }

                Rectangle{
                    id: rectangle
                    height:25
                    width: 25
                    Layout.fillHeight: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 10
                    anchors.right: parent.right
                    color:"transparent"
                    Image {
                        id: closeImage
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/img/img/Delete-25.png"
                    }
                    ColorOverlay{
                        anchors.fill: closeImage
                        source: closeImage
                        color: Universal.foreground
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                    }
                }
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
                                }
                                Text{
                                    id: freqMiddle
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    color: Universal.foreground
                                }
                                Text{
                                    id: freqStop
                                    anchors.right: parent.right
                                    color: Universal.foreground
                                }
                            }

                            Slider{
                                id: defaultMarkerSlider
                                Layout.row: 1
                                Layout.column: 1
                                Layout.topMargin: 10
                                Layout.fillWidth: true
                                implicitHeight: 20
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
                                        }
                                    }
                                }
                            }
                            ListModel{ id: userMarkersModel }
                        }

                        GridLayout {
                            id: grid
                            anchors.left: parent.left
                            anchors.right: parent.right
                            columns: 2
                            columnSpacing: 15
                            rowSpacing: 20
                            Rectangle {
                                visible: modeComboBox.currentIndex == 0 || modeComboBox.currentIndex == 1
                                color: Universal.background
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
                                        implicitWidth: 80
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
                                            freqStart.text = bandList.get(currentIndex).start
                                            freqStop.text = bandList.get(currentIndex).stop + "MHz"
                                            freqMiddle.text = bandList.get(currentIndex).middle
                                            defaultMarkerSlider.minimumValue = bandList.get(currentIndex).start
                                            defaultMarkerSlider.maximumValue = bandList.get(currentIndex).stop
                                            defaultMarkerSlider.value = bandList.get(currentIndex).defaultmarker
                                        }
                                    }
                                    Rectangle{
                                        Layout.column: 3
                                        Layout.fillWidth: true
                                    }
                                }
                            }
                            Rectangle {
                                visible: modeComboBox.currentIndex == 2
                                color: Universal.background
                                Layout.fillWidth: true
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
                                            ListElement { text: "PE Solid"; velocity: 0.66}
                                            ListElement { text: "PE Foam"; velocity: 0.85}
                                            ListElement { text: "Teflon"; velocity: 0.70}
                                            ListElement { text: "Teflon Foam"; velocity: 0.80}
                                            ListElement { text: "User"; velocity: 0.01}
                                        }
                                        onCurrentIndexChanged:{
                                            velocityText.text = coaxList.get(currentIndex).velocity * 100 + "%"
                                        }
                                    }
                                    Text {
                                        Layout.column: 3
                                        anchors.verticalCenter: parent.verticalCenter
                                        leftPadding: 10
                                        text: "VEL "
                                        color: Universal.foreground
                                    }
                                    Text {
                                        id: velocityText
                                        visible: coaxComboBox.currentIndex != 4
                                        Layout.column: 4
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.pointSize: 10
                                        color: Universal.foreground
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
                                    Rectangle{
                                        Layout.column: 5
                                        Layout.fillWidth: true
                                    }
                                }
                            }
                            Rectangle {
                                visible: modeComboBox.currentIndex == 3
                               color: Universal.background
                                Layout.fillWidth: true
                                height: 40
                                GridLayout{
                                    anchors.fill: parent
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        leftPadding: 10
                                        font.pointSize: 10
                                        text: qsTr("TYPE:")
                                        color: Universal.foreground
                                    }
                                    Rectangle{
                                        Layout.column: 1
                                        Layout.fillWidth: true
                                    }
                                    ComboBox {
                                        id: typeComboBox
                                        Layout.column: 2
                                        implicitWidth: 80
                                        model: ListModel {
                                            id: typeList
                                            ListElement { text: "SHORT";}
                                            ListElement { text: "OPEN";}
                                            ListElement { text: "LOAD";}
                                            ListElement { text: "THRU";}
                                            ListElement { text: "PREV CAL";}
                                        }
                                        onCurrentIndexChanged:{

                                        }
                                    }
                                    Rectangle{
                                        Layout.column: 3
                                        Layout.fillWidth: true
                                    }
                                }
                            }

                            Rectangle {
                                color: Universal.background
                                Layout.fillWidth: true
                                height: 40
                                GridLayout{
                                    anchors.fill: parent
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        leftPadding: 10
                                        font.pointSize: 10
                                        text: qsTr("MODE:")
                                        color: Universal.foreground
                                    }
                                    Rectangle{
                                        Layout.column: 1
                                        Layout.fillWidth: true
                                    }
                                    ComboBox {
                                        id: modeComboBox
                                        Layout.column: 2
                                        implicitWidth: 80
                                        model: ListModel {
                                            ListElement { text: "VSWR"; }
                                            ListElement { text: "LOSS"; }
                                            ListElement { text: "DTF"; }
                                            ListElement { text: "CAL"; }
                                        }
                                        onCurrentIndexChanged:{
                                            switch(currentIndex){
                                            case 0:
                                                testTitle.text = "VSWR"
                                                break;
                                            case 1:
                                                testTitle.text = "CABLE LOSS"
                                                break;
                                            case 2:
                                                testTitle.text = "DISTANCE TO FAULT"
                                                break;
                                            case 3:
                                                testTitle.text = "CALIBRATION"
                                                break;
                                            default:
                                                testTitle.text = "VSWR"
                                            }
                                        }
                                    }
                                    Rectangle{
                                        Layout.column: 3
                                        Layout.fillWidth: true
                                    }
                                }
                            }
                            Rectangle {
                                visible: modeComboBox.currentIndex != 3
                                color: Universal.background
                                Layout.fillWidth: true
                                height: 40
                                GridLayout{
                                    anchors.fill: parent
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        leftPadding: 10
                                        font.pointSize: 10
                                        text: qsTr("MARKER")
                                        color: Universal.foreground
                                    }
                                    Rectangle{
                                        Layout.column: 1
                                        Layout.fillWidth: true
                                    }
                                    Button{
                                        Layout.column: 2
                                        height: parent.height
                                        implicitWidth: 35
                                        text: "<<"
                                        onClicked: --defaultMarkerSlider.value
                                    }
                                    Button{
                                        Layout.column: 3
                                        height: parent.height
                                        implicitWidth: 35
                                        text: ">>"
                                        onClicked: defaultMarkerSlider.value++
                                    }

                                    Rectangle{
                                        Layout.column: 4
                                        Layout.fillWidth: true
                                    }
                                }
                            }


                            Rectangle {
                                visible: modeComboBox.currentIndex == 3
                                Layout.fillWidth: true
                                color: Universal.background
                                Button{
                                    implicitWidth: parent.width
                                    text: "MEASURE"
                                }
                            }

                            Rectangle {
                                visible: modeComboBox.currentIndex == 3
                                Layout.fillWidth: true
                                color: Universal.background
                                Button{
                                    implicitWidth: parent.width
                                    text: "DONE"
                                }
                            }
                        }

                        Row{
                            visible: modeComboBox.currentIndex != 3
                            Button{
                                text: "ADD"
                                onClicked: {
                                    userMarkersModel.insert(0,{"num": userMarkersModel.count+2})
                                }
                            }
                            Rectangle{color: "transparent"; height:10; width: 10}
                            Button{
                                visible: userMarkersModel.count>0
                                text: "DELETE"
                                onClicked: {
                                    userMarkersModel.remove(0,1)
                                }
                            }
                        }
                    }
                }
            }

            footer: Rectangle{
                id:testFooterRect
                height: 50
                width: parent.width
                color: Universal.background

                Rectangle {
                    id: toggleButton
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    height: 40
                    width: 40
                    property alias imageSource: buttonImage.source
                    signal selected()
                    signal pushed()
                    color: "transparent"
                    state: "off"
                    onStateChanged: {
                        if (state == "on") {
                            selected()
                        }
                        else{
                            pushed()
                        }
                    }
                    Image {
                        id: buttonImage
                        smooth: true
                        anchors.fill: parent
                        ColorOverlay{
                            anchors.fill: parent
                            source: parent
                            color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                        }
                    }
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        onPressed: {

                            if (parent.state == "off") {
                                parent.state = "on"
                            }
                            else{
                                parent.state = "off"
                            }
                        }
                    }
                    states: [
                        State {
                            name: "on"
                            PropertyChanges {
                                target: toggleButton
                                scale: 0.95
                                imageSource: "qrc:/img/img/stop-button.png"
                            }
                        },
                        State {
                            name: "off"
                            PropertyChanges {
                                target: toggleButton
                                scale: 1/0.95
                                imageSource: "qrc:/img/img/play-button.png"
                            }
                        }
                    ]
                    transitions: [
                        Transition {
                            from: "off"
                            to: "on"
                            reversible: true
                            PropertyAnimation {
                                target: toggleButton
                                properties: "scale"
                                duration: 100
                            }
                        }
                    ]
                }

            }
        }
    }
}
