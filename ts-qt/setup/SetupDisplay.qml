import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Page {
    id: item1
    anchors.fill: parent
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.background
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("DISPLAY")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
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
            anchors.fill: parent
            contentWidth: parent.width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 20

                Text {
                    id: text1
                    Layout.row: 0
                    Layout.column:0
                    text: qsTr("THEME:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text{
                    Layout.row: 0
                    Layout.column: 1
                    text: qsTr("Indoor")
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Row{
                    Layout.row: 0
                    Layout.column: 2
                    Layout.fillHeight: true
                    Switch { //we can use delegate switch as well for binging
                        id: switch1
                        anchors.verticalCenter: parent.verticalCenter
                        checked: _theme == Universal.Dark
                        onCheckedChanged: {
                            console.log(switch1.checked)
                            if(switch1.checked) {
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
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text {
                    id: text2
                    Layout.row: 1
                    Layout.column: 0
                    text: qsTr("BRIGHTNESS:")
                    font.pixelSize: 14
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Text{
                    Layout.row: 1
                    Layout.column: 1
                    text: slider.value
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Item{
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
                        font.family: robotoRegular.name
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
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                        leftPadding: 10
                    }
                }
            }
        }
    }
}

