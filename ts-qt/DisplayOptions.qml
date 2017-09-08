import QtQuick 2.5
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
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            height: content.height + 20
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
                        text: "DISPLAY OPTIONS"
                        font.pixelSize: 18
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
                        Image{
                            id: closeImage
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                            asynchronous: true
                        }
                        MouseArea {
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked: displayOptionsPopup.close()
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
                            Layout.bottomMargin: 5
                            text: "THEME"
                            font.pixelSize: 14
                            font.weight: Font.Black
                            font.family: robotoRegular.name
                            color: Universal.foreground
                            opacity: 0.7
                        }
                        SwitchDelegate {
                            id: brightnessSwitch
                            Layout.fillWidth: true
                            height: 50
                            font.pixelSize: 14
                            checked: _theme === Universal.Dark
                            text: checked ? "OUTDOOR" : "INDOOR"
                            padding: 0
                            background: Item{}
                            indicator: Item{}
                            contentItem:Rectangle{
                                color: "transparent"
                                border.color: Universal.accent
                                border.width: 2
                                radius: 3
                                RowLayout{
                                    anchors.fill: parent
                                    Image{
                                        id: themeImg
                                        Layout.leftMargin: 15
                                        Layout.alignment: Qt.AlignVCenter
                                        source: "qrc:/img/img/screen-brightness.png"
                                        asynchronous: true
                                    }
                                    Text{
                                        Layout.fillWidth: true
                                        Layout.alignment: Qt.AlignVCenter
                                        Layout.leftMargin: 15
                                        text: brightnessSwitch.text
                                        elide: Text.ElideRight
                                        font.pixelSize: 15
                                        font.weight: Font.Black
                                        font.family: robotoRegular.name
                                        color: Universal.accent
                                    }
                                }
                            }
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onCheckedChanged: {
                                if(checked) {
                                    _theme = Universal.Dark
                                }
                                else {_theme = Universal.Light}
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
                            text: "BRIGHTNESS"
                            font.pixelSize: 14
                            font.weight: Font.Black
                            font.family: robotoRegular.name
                            color: Universal.foreground
                            opacity: 0.7
                        }
                        Item{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 30
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
}
