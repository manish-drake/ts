import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    Rectangle{
        anchors.fill: parent
        anchors.margins: 10
        clip: true
        border.color: "#0d000000"
        border.width: 1
        radius: 5
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#0d000000"
            spread: 0
        }
        Column{
            anchors.fill: parent
            Rectangle{
                id: header
                anchors.left: parent.left
                anchors.right: parent.right
                height:40
                color:"transparent"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("DISPLAY")
                    elide:Text.ElideRight
                    font.pointSize: 13
                    font.weight: Font.DemiBold
                    clip:true
                }
                Rectangle{
                    id: rectangle
                    width: 40
                    Layout.fillHeight: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    color:"transparent"
                    Text{
                        anchors.centerIn: parent
                        text: "X"
                        font.pixelSize: 14
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                }
            }

            Flickable {
                width: parent.width;
                anchors.top: header.bottom
                anchors.bottom: parent.bottom
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                clip: true

                GridLayout {
                    id: grid
                    y: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    rowSpacing: 25
                    columnSpacing: 30

                    Text {
                        id: text1
                        Layout.row: 0
                        Layout.column:0
                        text: qsTr("THEME")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        id:switchText
                        Layout.row: 0
                        Layout.column: 1
                        Layout.minimumWidth: 50
                        text:switch1.checked ? qsTr("Outdoor"):qsTr("Indoor")
                        font.pixelSize: 14
                    }

                    Row{
                        Layout.row: 0
                        Layout.column: 2
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Switch { //we can use delegate switch as well for binging
                            id: switch1
                            anchors.verticalCenter: parent.verticalCenter
                            onCheckedChanged: {
                                console.log(switch1.checked)
                            }
                        }
                    }

                    Text {
                        id: text2
                        Layout.row: 1
                        Layout.column: 0
                        text: qsTr("BRIGHTNESS")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                    }

                    Text{
                        Layout.row: 1
                        Layout.column: 1
                        text: slider.value
                        font.pixelSize: 14
                    }

                    Row{
                        Layout.row: 1
                        Layout.column: 2
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Text {
                            id: startValue
                            anchors.verticalCenter: parent.verticalCenter
                            text: slider.minimumValue
                            font.pixelSize: 14
                            color:"gray"
                            rightPadding: 10
                        }

                        Slider {
                            id: slider
                            anchors.left: startValue.right
                            anchors.right: endValue.left
                            anchors.verticalCenter: parent.verticalCenter
                            minimumValue: 1
                            maximumValue: 10
                            stepSize: 1
                            value: 0.5
                            updateValueWhileDragging: true
                            onValueChanged: {
                                console.log(slider.value)
                            }
                        }
                        Text {
                            id: endValue
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            text: slider.maximumValue
                            font.pixelSize: 14
                            color:"gray"
                            leftPadding: 10
                        }
                    }
                }
            }
        }
    }
}
