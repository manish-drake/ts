import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Universal 2.1

Page {
    id: item1
    anchors.fill: parent
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("DISPLAY")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
        }
    }

    contentItem: Rectangle {
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Flickable {
            anchors.fill: parent
            contentWidth: parent.width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            ColumnLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                spacing: 22
                RowLayout{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 20
                    Text {
                        id: text1
                        Layout.column:0
                        Layout.fillWidth: true
                        text: qsTr("THEME")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Text{
                        Layout.column: 1
                        text: switch1.checked ? "Outdoor" : "Indoor"
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                    Switch { //we can use delegate switch as well for binging
                        id: switch1
                        Layout.column: 2
                        Layout.alignment: Qt.AlignRight
                        anchors.verticalCenter: parent.verticalCenter
                        checked: _theme === Universal.Dark
                        onCheckedChanged: {
                            console.log(switch1.checked)
                            if(switch1.checked) {
                                _theme = Universal.Dark
                            }
                            else {_theme = Universal.Light}
                        }
                        style: SwitchStyle {
                            groove: Rectangle {
                                implicitWidth: 60
                                implicitHeight: 30
                                radius: 15
                                color: "lightgray"
                            }
                            handle: Rectangle {
                                implicitWidth: 30
                                implicitHeight: 30
                                radius: 15
                                color: control.checked ? Universal.accent : "gray"
                            }
                        }
                    }
                }

                RowLayout{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 20
                    Text {
                        id: text2
                        text: qsTr("BRIGHTNESS")
                        font.pixelSize: 14
                        font.family: robotoRegular.name
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Slider{
                            id: brightnessSlider
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 5
                            anchors.rightMargin: 5
                            minimumValue: 1
                            maximumValue: 10
                            value: 7
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
                                    implicitWidth: 30
                                    implicitHeight: 30
                                    radius: 15
                                    Text{
                                        anchors.centerIn: parent
                                        color: "white"
                                        text: control.value.toFixed(1)
                                        font.pixelSize: 13
                                        font.weight: Font.DemiBold
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

