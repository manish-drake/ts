import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    RowLayout{
        anchors.fill: parent
        anchors.margins: 20
        Rectangle{
            Layout.fillWidth: true
            Layout.maximumWidth: 650
            Layout.alignment: Qt.AlignCenter
            radius: 4
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            height: content.height
            ColumnLayout{
                id: content
                anchors.left:parent.left
                anchors.right:parent.right
                anchors.topMargin: 10
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.bottomMargin: 20
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Text {
                        anchors.centerIn: parent
                        text: "SETUP"
                        font.pixelSize: 20
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        width: 50
                        Image {
                            id: closeImage
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: testSetupPopup.close()
                        }
                    }
                }

                Item{
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 15
                    height: 120
                    RowLayout{
                        anchors.fill: parent
                        spacing: 5
                        Item{
                            Layout.fillWidth: true
                        }
                        ColumnLayout{
                            Layout.fillHeight: true
                            Text{
                                Layout.alignment: Qt.AlignHCenter
                                horizontalAlignment: Text.Center
                                text: "GPS<br>SOURCE"
                                font.pixelSize: 14
                                font.weight: Font.Black
                                font.family: robotoRegular.name
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            SwitchDelegate {
                                id: gpsSourceSwitch
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                font.pixelSize: 14
                                text: checked ? "EXTERNAL" : "INTERNAL"
                                padding: 0
                                background: Item{}
                                indicator: Item{}
                                contentItem: ColumnLayout{
                                    Item{
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Image {
                                            id: gpsImg
                                            anchors.fill: parent
                                            anchors.margins: 2
                                            source: "qrc:/img/img/geo_fence.png"
                                            fillMode: Image.PreserveAspectFit
                                            smooth: true
                                        }
                                    }
                                    Text{
                                        Layout.alignment: Qt.AlignHCenter
                                        horizontalAlignment: Text.Center
                                        text: gpsSourceSwitch.text
                                        font.pixelSize: 13
                                        font.weight: Font.Black
                                        font.family: robotoRegular.name
                                        color: Universal.accent
                                    }
                                }
                            }
                        }
                        ColumnLayout{
                            Layout.fillHeight: true
                            Text{
                                Layout.alignment: Qt.AlignHCenter
                                horizontalAlignment: Text.Center
                                text: "UUT<br/>ANTENNA"
                                font.pixelSize: 14
                                font.weight: Font.Black
                                font.family: robotoRegular.name
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            SwitchDelegate {
                                id:uutAntennaSwitch
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                font.pixelSize: 14
                                text: checked ? "BOTTOM" : "TOP"
                                padding: 0
                                background: Item{}
                                indicator: Item{}
                                contentItem: ColumnLayout{
                                    Item{
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Image {
                                            id: topBottomImg
                                            anchors.fill: parent
                                            anchors.margins: 2
                                            source: "qrc:/img/img/top-bottom.png"
                                            fillMode: Image.PreserveAspectFit
                                            smooth: true
                                        }
                                    }
                                    Text{
                                        Layout.alignment: Qt.AlignHCenter
                                        horizontalAlignment: Text.Center
                                        text: uutAntennaSwitch.text
                                        font.pixelSize: 13
                                        font.weight: Font.Black
                                        font.family: robotoRegular.name
                                        color: Universal.accent
                                    }
                                }
                            }
                        }
                        ColumnLayout{
                            Layout.fillHeight: true
                            Text{
                                Layout.alignment: Qt.AlignHCenter
                                horizontalAlignment: Text.Center
                                text: "OTHER<br/>TOGGLE"
                                font.pixelSize: 14
                                font.weight: Font.Black
                                font.family: robotoRegular.name
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            SwitchDelegate {
                                id: otherToggleSwitch
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                font.pixelSize: 14
                                text: checked ? "OFF" : "ON"
                                padding: 0
                                background: Item{}
                                indicator: Item{}
                                contentItem: ColumnLayout{
                                    Item{
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        Rectangle{
                                            anchors.centerIn: parent
                                            width: 45
                                            height: 45
                                            color: "transparent"
                                            border.width: 1.5
                                            border.color: Universal.accent
                                            radius: height/2
                                            Text{
                                                anchors.centerIn: parent
                                                text: otherToggleSwitch.checked ? "OFF" : "ON"
                                                font.pixelSize: 18
                                                font.weight: Font.Black
                                                font.family: robotoRegular.name
                                                color: Universal.accent

                                            }
                                        }
                                    }
                                    Text{
                                        Layout.alignment: Qt.AlignHCenter
                                        horizontalAlignment: Text.Center
                                        text: otherToggleSwitch.text
                                        font.pixelSize: 13
                                        font.weight: Font.Black
                                        font.family: robotoRegular.name
                                        color: Universal.accent
                                    }
                                }
                            }
                        }
                        Item{
                            Layout.fillWidth: true
                        }
                    }
                }

                Item{
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 15
                    height: column1.height
                    ColumnLayout{
                        id: column1
                        anchors.left:parent.left
                        anchors.right:parent.right
                        Text{
                            text: "TEST SET ICAO ADDRESS"
                            font.pixelSize: 14
                            font.weight: Font.Black
                            font.family: robotoRegular.name
                            color: Universal.foreground
                            opacity: 0.7
                        }
                        Rectangle{
                            anchors.left:parent.left
                            anchors.right:parent.right
                            height: 40
                            color: "transparent"
                            border.width: 1
                            border.color: Universal.accent
                            radius: 3
                            RowLayout {
                                anchors.fill: parent
                                Text {
                                    Layout.leftMargin: 10
                                    Layout.alignment: Qt.AlignVCenter
                                    font.pixelSize: 16
                                    font.weight: Font.DemiBold
                                    font.family: robotoRegular.name
                                    color: Universal.foreground
                                    text: icaoAdressSelection.selectedIcaoAdress
                                    opacity: 0.5
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: icaoAdressSelectionPopup.open()
                            }
                        }
                    }
                }

                Item{
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 15
                    height: column2.height
                    ColumnLayout{
                        id: column2
                        anchors.left:parent.left
                        anchors.right:parent.right
                        Text{
                            Layout.bottomMargin: 5
                            text: "DISTANCE TO UUT"
                            font.pixelSize: 14
                            font.weight: Font.Black
                            font.family: robotoRegular.name
                            color: Universal.foreground
                            opacity: 0.7
                        }
                        Item{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 45
                            anchors.rightMargin: 45
                            RowLayout{
                                anchors.left: parent.left
                                anchors.right: parent.right
                                spacing: 5
                                Text{
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                    text: 50 + "FT"
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                    opacity: 0.5
                                }
                                Text{
                                    Layout.fillWidth: true
                                    Layout.rightMargin: 5
                                    horizontalAlignment: Text.AlignHCenter
                                    elide: Text.ElideRight
                                    text: 100 + "FT"
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                    opacity: 0.5
                                }
                                Text{
                                    Layout.fillWidth: true
                                    horizontalAlignment: Text.AlignHCenter
                                    elide: Text.ElideRight
                                    text: 150 + "FT"
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                    opacity: 0.5
                                }
                                Text{
                                    Layout.fillWidth: true
                                    Layout.leftMargin: 5
                                    horizontalAlignment: Text.AlignHCenter
                                    elide: Text.ElideRight
                                    text: 200 + "FT"
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                    opacity: 0.5
                                }
                                Text{
                                    Layout.fillWidth: true
                                    horizontalAlignment: Text.AlignRight
                                    elide: Text.ElideRight
                                    text: 250 + "FT"
                                    font.pixelSize: 13
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                    opacity: 0.5
                                }
                            }
                        }
                        Item{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 40
                            RowLayout{
                                anchors.fill: parent
                                Rectangle{
                                    Layout.fillHeight: true
                                    width: 35
                                    color: Universal.accent
                                    radius: 3
                                    enabled: distanceSlider.value > 50
                                    opacity: enabled ? 1 : 0.8
                                    Image{
                                        anchors.centerIn: parent
                                        height: 15
                                        width: 15
                                        source: "qrc:/img/img/Arrow-left.png"
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: distanceSlider.value = distanceSlider.value - 1
                                        onPressed: parent.opacity = 0.9
                                        onReleased: parent.opacity = 1
                                    }
                                }
                                Slider{
                                    id: distanceSlider
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignVCenter
                                    Layout.leftMargin: 10
                                    Layout.rightMargin: 10
                                    Layout.minimumWidth: 0
                                    minimumValue: 50
                                    maximumValue: 250
                                    value: distanceInput.uutDistance
                                    style: SliderStyle {
                                        groove:  Rectangle{
                                            Layout.fillWidth: parent
                                            height: 1
                                            color: Universal.foreground
                                            opacity: 0.2
                                        }
                                        handle: Rectangle {
                                            opacity: control.pressed ? 0.9 : 1
                                            color: Universal.accent
                                            implicitWidth: 20
                                            implicitHeight: 20
                                            radius: 3
                                            Text{
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                anchors.top: parent.bottom
                                                color: Universal.accent
                                                text: control.value.toFixed(0) + " FT"
                                                font.pixelSize: 14
                                                font.weight: Font.DemiBold
                                                MouseArea{
                                                    anchors.fill: parent
                                                    onClicked: distanceInputPopup.open()
                                                }
                                            }
                                        }
                                    }
                                }
                                Rectangle{
                                    Layout.fillHeight: true
                                    width: 35
                                    color: Universal.accent
                                    radius: 3
                                    enabled: distanceSlider.value < 250
                                    opacity: enabled ? 1 : 0.8
                                    Image{
                                        anchors.centerIn: parent
                                        height: 15
                                        width: 15
                                        source: "qrc:/img/img/Arrow-right.png"
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: distanceSlider.value = distanceSlider.value + 1
                                        onPressed: parent.opacity = 0.9
                                        onReleased: parent.opacity = 1
                                    }
                                }
                            }
                        }
                    }
                }
                Item{
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 15
                    Layout.bottomMargin: 20
                    height: 120
                    RowLayout{
                        anchors.fill: parent
                        spacing: 20
                        Item{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            ColumnLayout{
                                anchors.fill: parent
                                Text{
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                    text: "TARGET AIRCRAFT"
                                    font.pixelSize: 14
                                    font.weight: Font.Black
                                    font.family: robotoRegular.name
                                    color: Universal.foreground
                                    opacity: 0.7
                                }
                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    color: "transparent"
                                    border.width: 1
                                    border.color: Universal.accent
                                    radius: 3
                                    ColumnLayout{
                                        anchors.fill: parent
                                        anchors.margins: 5
                                        Item{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            Image {
                                                id: aircraftImg
                                                anchors.fill: parent
                                                anchors.margins: 2
                                                source: "qrc:/img/img/target_aircraft.png"
                                                fillMode: Image.PreserveAspectFit
                                            }
                                        }
                                        Text{
                                            Layout.fillWidth: true
                                            horizontalAlignment: Text.AlignHCenter
                                            elide: Text.ElideRight
                                            text: aircraftSelection.selectedAircraft
                                            font.pixelSize: 14
                                            font.weight: Font.Black
                                            font.family: robotoRegular.name
                                            color: Universal.accent
                                        }
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: aircraftSelectionPopup.open()
                                    }
                                }
                            }
                        }
                        Item{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            RowLayout{
                                anchors.fill: parent
                                spacing: 20
                                Item{
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    ColumnLayout{
                                        anchors.fill: parent
                                        Text{
                                            Layout.fillWidth: true
                                            elide: Text.ElideRight
                                            text: "CLASS"
                                            font.pixelSize: 14
                                            font.weight: Font.Black
                                            font.family: robotoRegular.name
                                            color: Universal.foreground
                                            opacity: 0.7
                                        }
                                        Rectangle{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            color: "transparent"
                                            border.width: 1
                                            border.color: Universal.accent
                                            radius: 3
                                            ColumnLayout{
                                                anchors.fill: parent
                                                anchors.margins: 5
                                                Item{
                                                    Layout.fillWidth: true
                                                    Layout.fillHeight: true
                                                    Rectangle{
                                                        anchors.centerIn: parent
                                                        width: 45
                                                        height: 45
                                                        color: "transparent"
                                                        border.width: 1.5
                                                        border.color: Universal.accent
                                                        radius: height/2
                                                        Text{
                                                            anchors.centerIn: parent
                                                            text: classSelection.selectedClass
                                                            font.pixelSize: 28
                                                            font.weight: Font.Black
                                                            font.family: robotoRegular.name
                                                            color: Universal.accent
                                                        }
                                                    }
                                                }
                                                Text{
                                                    Layout.fillWidth: true
                                                    horizontalAlignment: Text.AlignHCenter
                                                    elide: Text.ElideRight
                                                    text: "CLASS " + classSelection.selectedClass
                                                    font.pixelSize: 14
                                                    font.weight: Font.Black
                                                    font.family: robotoRegular.name
                                                    color: Universal.accent
                                                }
                                            }
                                            MouseArea{
                                                anchors.fill: parent
                                                onClicked: classSelectionPopup.open()
                                            }
                                        }
                                    }
                                }

                                Item{
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    ColumnLayout{
                                        anchors.fill: parent
                                        Text{
                                            Layout.fillWidth: true
                                            elide: Text.ElideRight
                                            text: "CONNECTION"
                                            font.pixelSize: 14
                                            font.weight: Font.Black
                                            font.family: robotoRegular.name
                                            color: Universal.foreground
                                            opacity: 0.7
                                        }
                                        Rectangle{
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            color: "transparent"
                                            border.width: 1
                                            border.color: Universal.accent
                                            radius: 3
                                            ColumnLayout{
                                                anchors.fill: parent
                                                anchors.margins: 5
                                                Item{
                                                    Layout.fillWidth: true
                                                    Layout.fillHeight: true
                                                    Image {
                                                        id: antennaImg1
                                                        anchors.fill: parent
                                                        anchors.margins: 2
                                                        source: "qrc:/img/img/antenna.png"
                                                        fillMode: Image.PreserveAspectFit
                                                    }
                                                }
                                                Text{
                                                    Layout.fillWidth: true
                                                    horizontalAlignment: Text.AlignHCenter
                                                    elide: Text.ElideRight
                                                    text: connectionSelection.selectedConnection
                                                    font.pixelSize: 14
                                                    font.weight: Font.Black
                                                    font.family: robotoRegular.name
                                                    color: Universal.accent
                                                }
                                            }
                                            MouseArea{
                                                anchors.fill: parent
                                                onClicked: connectionSelectionPopup.open()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Popup {
        id: distanceInputPopup
        height: parent.height
        width: parent.width
        z: 0
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: SetupDistanceInput{id: distanceInput}
        onOpened: testSetupPopup.opacity = 0
        onClosed: testSetupPopup.opacity = 1
    }

    Popup {
        id: icaoAdressSelectionPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: SetupIcaoAddressSelection{id: icaoAdressSelection}
        onOpened: testSetupPopup.opacity = 0
        onClosed: testSetupPopup.opacity = 1
    }

    Popup {
        id: aircraftSelectionPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: SetupAircraftSelection{id: aircraftSelection}
        onOpened: testSetupPopup.opacity = 0
        onClosed: testSetupPopup.opacity = 1
    }

    Popup {
        id: classSelectionPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: SetupClassSelection{id: classSelection}
        onOpened: testSetupPopup.opacity = 0
        onClosed: testSetupPopup.opacity = 1
    }

    Popup {
        id: connectionSelectionPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: SetupConnectionSelection{id: connectionSelection}
        onOpened: testSetupPopup.opacity = 0
        onClosed: testSetupPopup.opacity = 1
    }
}
