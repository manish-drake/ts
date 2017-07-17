import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Item {
    RowLayout{
        anchors.fill: parent
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
                    ColorOverlay{
                        anchors.fill: closeImage
                        source: closeImage
                        color: Universal.accent
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
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
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
                                    ColorOverlay{
                                        anchors.fill: gpsImg
                                        source: gpsImg
                                        color: Universal.accent
                                    }
                                }
                                Text{
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.Center
                                    text: gpsSourceSwitch.text
                                    font.pixelSize: 12
                                    font.weight: Font.DemiBold
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
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
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
                                    ColorOverlay{
                                        anchors.fill: topBottomImg
                                        source: topBottomImg
                                        color: Universal.accent
                                    }
                                }
                                Text{
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.Center
                                    text: uutAntennaSwitch.text
                                    font.pixelSize: 12
                                    font.weight: Font.DemiBold
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
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
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
                                            font.weight: Font.Bold
                                            font.family: robotoRegular.name
                                            color: Universal.accent

                                        }
                                    }
                                }
                                Text{
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.Center
                                    text: otherToggleSwitch.text
                                    font.pixelSize: 12
                                    font.weight: Font.DemiBold
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
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.7
                    }
                    Item{
                        anchors.left:parent.left
                        anchors.right:parent.right
                        height: 40
                        ComboBox {
                            id: icaoAddressComboBox
                            implicitWidth: parent.width
                            implicitHeight: parent.height
                            textRole: "item"
                            style: ComboBoxStyle{
                                background: Rectangle{
                                    color: "transparent"
                                    border.width: 1
                                    border.color: Universal.accent
                                    opacity: icaoAddressComboBox.pressed ? 0.9 : 1.0
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
                                            text: control.currentText
                                            opacity: 0.5
                                        }
                                    }
                                }
                                label: Item{}
                            }
                            model: ListModel {
                                id: icaoAddressList
                                ListElement { item: "AC82EC" }
                                ListElement { item: "AC82DF" }
                                ListElement { item: "AC82FG" }
                            }
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
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
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
//                            Repeater{
//                                model: 5
                                Text{
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                    text: 50 + "FT"
                                    font.pixelSize: 12
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
                                    font.pixelSize: 12
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                    opacity: 0.5
                                }
                                Text{
                                    Layout.fillWidth: true
                                    horizontalAlignment: Text.AlignHCenter
                                    elide: Text.ElideRight
                                    text: 150 + "FT"
                                    font.pixelSize: 12
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
                                    font.pixelSize: 12
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                    opacity: 0.5
                                }
                                Text{
                                    Layout.fillWidth: true
                                    horizontalAlignment: Text.AlignRight
                                    elide: Text.ElideRight
                                    text: 250 + "FT"
                                    font.pixelSize: 12
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                    opacity: 0.5
                                }
//                            }
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
                                value: 98
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
                                            font.pixelSize: 12
                                            font.weight: Font.DemiBold
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
                                font.pixelSize: 12
                                font.weight: Font.DemiBold
                                font.family: robotoRegular.name
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            Item{
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                ComboBox {
                                    id: aicraftComboBox
                                    implicitWidth: parent.width
                                    implicitHeight: parent.height
                                    textRole: "item"
                                    style: ComboBoxStyle{
                                        background: Rectangle{
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
                                                    ColorOverlay{
                                                        anchors.fill: aircraftImg
                                                        source: aircraftImg
                                                        color: Universal.accent
                                                    }
                                                }
                                                Text{
                                                    Layout.fillWidth: true
                                                    horizontalAlignment: Text.AlignHCenter
                                                    elide: Text.ElideRight
                                                    text: control.currentText
                                                    font.pixelSize: 12
                                                    font.weight: Font.DemiBold
                                                    font.family: robotoRegular.name
                                                    color: Universal.accent
                                                }
                                            }
                                        }
                                        label: Item {}
                                    }
                                    model: ListModel {
                                        id: aircraftList
                                        ListElement { item: "Piper PA-28-161 Warrior II" }
                                        ListElement { item: "Aircraft 2" }
                                        ListElement { item: "Aircraft 3" }
                                        ListElement { item: "Aircraft 4" }
                                    }
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
                                        font.pixelSize: 12
                                        font.weight: Font.DemiBold
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                        opacity: 0.7
                                    }
                                    Item{
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        ComboBox {
                                            id: classComboBox
                                            implicitWidth: parent.width
                                            implicitHeight: parent.height
                                            textRole: "item"
                                            style: ComboBoxStyle{
                                                background: Rectangle{
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
                                                                    text: control.currentText
                                                                    font.pixelSize: 26
                                                                    font.weight: Font.Bold
                                                                    font.family: robotoRegular.name
                                                                    color: Universal.accent

                                                                }
                                                            }
                                                        }
                                                        Text{
                                                            Layout.fillWidth: true
                                                            horizontalAlignment: Text.AlignHCenter
                                                            elide: Text.ElideRight
                                                            text: "CLASS " + control.currentText
                                                            font.pixelSize: 12
                                                            font.weight: Font.DemiBold
                                                            font.family: robotoRegular.name
                                                            color: Universal.accent
                                                        }
                                                    }
                                                }
                                                label: Item {}
                                            }
                                            model: ListModel {
                                                id: classList
                                                ListElement { item: "A" }
                                                ListElement { item: "B" }
                                                ListElement { item: "C" }
                                            }
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
                                        font.pixelSize: 12
                                        font.weight: Font.DemiBold
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                        opacity: 0.7
                                    }
                                    Item{
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        ComboBox {
                                            id: connectionComboBox
                                            implicitWidth: parent.width
                                            implicitHeight: parent.height
                                            textRole: "item"
                                            style: ComboBoxStyle{
                                                background: Rectangle{
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
                                                            ColorOverlay{
                                                                anchors.fill: antennaImg1
                                                                source: antennaImg1
                                                                color: Universal.accent
                                                            }
                                                        }
                                                        Text{
                                                            Layout.fillWidth: true
                                                            horizontalAlignment: Text.AlignHCenter
                                                            elide: Text.ElideRight
                                                            text: control.currentText
                                                            font.pixelSize: 12
                                                            font.weight: Font.DemiBold
                                                            font.family: robotoRegular.name
                                                            color: Universal.accent
                                                        }
                                                    }
                                                }
                                                label: Item {}
                                            }
                                            model: ListModel {
                                                id: connectionList
                                                ListElement { item: "PORT A" }
                                                ListElement { item: "PORT B" }
                                                ListElement { item: "PORT C" }
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
    }
}
