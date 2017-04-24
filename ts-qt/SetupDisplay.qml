import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item {
    Rectangle{
        anchors.fill: parent
        anchors.margins: 10
        clip: true
        color: Universal.background
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
                    color: Universal.foreground
                }
                Rectangle{
                    id: rectangle
                    width: 40
                    height: parent.height
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
                        onClicked: {
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
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
                boundsBehavior: Flickable.StopAtBounds
                GridLayout {
                    id: grid
                    y: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    rowSpacing: 25
                    columnSpacing: 20

                    Text {
                        id: text1
                        Layout.row: 0
                        Layout.column:0
                        text: qsTr("THEME:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Text{
                        Layout.row: 0
                        Layout.column: 1
                        text: qsTr("Indoor")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Row{
                        Layout.row: 0
                        Layout.column: 2
                        Layout.fillHeight: true
                        Switch { //we can use delegate switch as well for binging
                            id: switch1
                            anchors.verticalCenter: parent.verticalCenter                            
                            onCheckedChanged: {
                                console.log(switch1.checked)
                                if(Universal.theme == Universal.Light) {
                                    _theme = Universal.Dark
                                }
                                else {_theme = Universal.Light}
                            }
                        }
                    }

                    Text{
                        Layout.row: 0
                        Layout.column: 3
                        Layout.fillWidth: true
                        text: qsTr("Outdoor")
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Text {
                        id: text2
                        Layout.row: 1
                        Layout.column: 0
                        text: qsTr("BRIGHTNESS:")
                        font.pixelSize: 14
                        font.bold: Font.Medium
                        color: Universal.foreground
                    }

                    Text{
                        Layout.row: 1
                        Layout.column: 1
                        text: slider.value
                        font.pixelSize: 14
                        color: Universal.foreground
                    }

                    Row{
                        Layout.row: 1
                        Layout.column: 2
                        Layout.columnSpan: 2
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Text {
                            id: startValue
                            anchors.verticalCenter: parent.verticalCenter
                            text: slider.minimumValue
                            font.pixelSize: 14
                            color: Universal.foreground
                            opacity: 0.8
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
                            value: 7
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
                            color: Universal.foreground
                            opacity: 0.8
                            leftPadding: 10
                        }
                    }
                }
            }
        }
    }
}
