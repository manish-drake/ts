import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Rectangle {
    color: Universal.background
    radius: 4
    ColumnLayout{
        anchors.fill: parent
        Item{
            Layout.fillWidth: true
            height: 50
            Item{
                id: rectangle1
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 25
                opacity: 0.4
                Image {
                    id: viewImage
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Info-24.png"
                }
            }
            Text {
                id: title
                anchors.centerIn: parent
                text: "%1 GUIDE".arg(guideTestName)
                font.pixelSize: 16
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                color: Universal.foreground
            }
            Item{
                id: rectangle
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: 50
                Image {
                    id: closeImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Delete-25.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: guidePopup.close()
                }
            }
        }
        Flickable {
            Layout.fillHeight: true
            Layout.fillWidth: true
            contentWidth: parent.width;
            contentHeight: content.height + content.y + 10
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            Column{
                id: content
                y: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                spacing: 20
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    color: "transparent"
                    border.color: Universal.foreground
                    border.width: 1
                    height: 150
                    GridLayout{
                        anchors.fill: parent
                        anchors.margins: 10
                        Item{
                            Layout.row: 0
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            GridLayout{
                                anchors.fill: parent
                                GridLayout{
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignHCenter
                                    Rectangle{
                                        height: 40
                                        width: 40
                                        Layout.alignment: Qt.AlignHCenter
                                        border.width: 1
                                        radius: 20
                                        border.color: Universal.foreground
                                        color: "transparent"
                                        Rectangle{
                                            anchors.centerIn: parent
                                            height: 14
                                            width: 14
                                            border.width: 1
                                            radius: 7
                                            border.color: Universal.foreground
                                            color: "transparent"
                                        }
                                    }
                                    Text{
                                        Layout.row: 1
                                        Layout.alignment: Qt.AlignHCenter
                                        text:"Direct"
                                        font.pixelSize: 14
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                    }
                                }
                                GridLayout{
                                    Layout.column: 1
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignHCenter
                                    Rectangle{
                                        height: 40
                                        width: 40
                                        Layout.alignment: Qt.AlignHCenter
                                        border.width: 1
                                        radius: 20
                                        border.color: Universal.foreground
                                        color: "transparent"
                                        Rectangle{
                                            anchors.centerIn: parent
                                            height: 14
                                            width: 14
                                            border.width: 1
                                            radius: 7
                                            border.color: Universal.foreground
                                            color: "transparent"
                                        }
                                    }
                                    Text{
                                        Layout.row: 1
                                        Layout.alignment: Qt.AlignHCenter
                                        text:"Port A"
                                        font.pixelSize: 14
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                    }
                                }
                                GridLayout{
                                    Layout.column: 2
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignHCenter
                                    Rectangle{
                                        height: 40
                                        width: 40
                                        Layout.alignment: Qt.AlignHCenter
                                        border.width: 1
                                        radius: 20
                                        border.color: Universal.foreground
                                        color: "transparent"
                                        Rectangle{
                                            anchors.centerIn: parent
                                            height: 14
                                            width: 14
                                            border.width: 1
                                            radius: 7
                                            border.color: Universal.foreground
                                            color: "transparent"
                                        }
                                    }
                                    Text{
                                        Layout.row: 1
                                        Layout.alignment: Qt.AlignHCenter
                                        text:"Port B"
                                        font.pixelSize: 14
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                    }
                                }
                            }
                        }
                        Item{
                            Layout.row: 1
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            GridLayout{
                                anchors.fill: parent
                                GridLayout{
                                    Layout.column: 0
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignRight
                                    Layout.rightMargin: 30
                                    Rectangle{
                                        height: 40
                                        width: 40
                                        Layout.alignment: Qt.AlignHCenter
                                        border.width: 1
                                        radius: 20
                                        border.color: Universal.foreground
                                        color: "transparent"
                                        Rectangle{
                                            anchors.centerIn: parent
                                            height: 14
                                            width: 14
                                            border.width: 1
                                            radius: 7
                                            border.color: Universal.foreground
                                            color: "transparent"
                                        }
                                    }
                                    Text{
                                        Layout.row: 1
                                        Layout.alignment: Qt.AlignHCenter
                                        text:"GPS"
                                        font.pixelSize: 14
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                    }
                                }
                                GridLayout{
                                    Layout.column: 1
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignLeft
                                    Layout.leftMargin: 30
                                    Rectangle{
                                        height: 40
                                        width: 40
                                        Layout.alignment: Qt.AlignHCenter
                                        border.width: 1
                                        radius: 20
                                        border.color: Universal.foreground
                                        color: "transparent"
                                        Rectangle{
                                            anchors.centerIn: parent
                                            height: 14
                                            width: 14
                                            border.width: 1
                                            radius: 7
                                            border.color: Universal.foreground
                                            color: "transparent"
                                        }
                                    }
                                    Text{
                                        Layout.row: 1
                                        Layout.alignment: Qt.AlignHCenter
                                        text:"Wi-Fi"
                                        font.pixelSize: 14
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                    }
                                }
                            }
                        }
                    }
                }

                Text{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    font.pixelSize: 14
                    wrapMode: Text.Wrap
                    color: Universal.foreground
                    text:"<p>When running a UAT Out test, usethe directional antenna with
Port A for over the air Testing.</p><br><p>Attach the GPS antenna to acquire LAT, LON an time.</p>"
                }
            }
        }

    }
}


