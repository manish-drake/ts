import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        Page{
            anchors.fill: parent
            header: Rectangle{
                id:testHeaderRect
                height: 50
                width: parent.width
                color: Universal.background
                Rectangle{
                    id: rectangle1
                    height: parent.height
                    width: children.width
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    color:"transparent"
                    Image {
                        id: viewImage
                        anchors.centerIn: parent
                        source: "qrc:/img/img/Info-24.png"
                    }
                    ColorOverlay{
                        anchors.fill: viewImage
                        source: viewImage
                        color: Universal.foreground
                    }
                }
                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        id: title
                        text: "%1 GUIDE".arg(grid.currentItem.name)
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: Universal.foreground
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
                        anchors.margins: 20
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
                                Rectangle{
                                    Layout.row: 0
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    color: "transparent"
                                    GridLayout{
                                        anchors.fill: parent
                                        GridLayout{
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            Layout.alignment: Qt.AlignHCenter
                                            Rectangle{
                                                Layout.fillHeight: true
                                                width: height
                                                Layout.alignment: Qt.AlignHCenter
                                                border.width: 1
                                                radius: height/2
                                                border.color: Universal.foreground
                                                color: "transparent"
                                                Rectangle{
                                                    anchors.centerIn: parent
                                                    height: parent.height/3
                                                    width: parent.width/3
                                                    border.width: 1
                                                    radius: height/2
                                                    border.color: Universal.foreground
                                                    color: "transparent"
                                                }
                                            }
                                            Text{
                                                Layout.row: 1
                                                Layout.alignment: Qt.AlignHCenter
                                                text:"Direct"
                                                font.pointSize: 10
                                                color: Universal.foreground
                                            }
                                        }
                                        GridLayout{
                                            Layout.column: 1
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            Layout.alignment: Qt.AlignHCenter
                                            Rectangle{
                                                Layout.fillHeight: true
                                                width: height
                                                Layout.alignment: Qt.AlignHCenter
                                                border.width: 1
                                                radius: height/2
                                                border.color: Universal.foreground
                                                color: "transparent"
                                                Rectangle{
                                                    anchors.centerIn: parent
                                                    height: parent.height/3
                                                    width: parent.width/3
                                                    border.width: 1
                                                    radius: height/2
                                                    border.color: Universal.foreground
                                                    color: "transparent"
                                                }
                                            }
                                            Text{
                                                Layout.row: 1
                                                Layout.alignment: Qt.AlignHCenter
                                                text:"Port A"
                                                font.pointSize: 10
                                                color: Universal.foreground
                                            }
                                        }
                                        GridLayout{
                                            Layout.column: 2
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            Layout.alignment: Qt.AlignHCenter
                                            Rectangle{
                                                Layout.fillHeight: true
                                                width: height
                                                Layout.alignment: Qt.AlignHCenter
                                                border.width: 1
                                                radius: height/2
                                                border.color: Universal.foreground
                                                color: "transparent"
                                                Rectangle{
                                                    anchors.centerIn: parent
                                                    height: parent.height/3
                                                    width: parent.width/3
                                                    border.width: 1
                                                    radius: height/2
                                                    border.color: Universal.foreground
                                                    color: "transparent"
                                                }
                                            }
                                            Text{
                                                Layout.row: 1
                                                Layout.alignment: Qt.AlignHCenter
                                                text:"Port B"
                                                font.pointSize: 10
                                                color: Universal.foreground
                                            }
                                        }
                                    }
                                }
                                Rectangle{
                                    Layout.row: 1
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    color: "transparent"
                                    GridLayout{
                                        anchors.fill: parent
                                        GridLayout{
                                            Layout.column: 0
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            Layout.alignment: Qt.AlignRight
                                            Layout.rightMargin: 30
                                            Rectangle{
                                                Layout.fillHeight: true
                                                width: height
                                                Layout.alignment: Qt.AlignHCenter
                                                border.width: 1
                                                radius: height/2
                                                border.color: Universal.foreground
                                                color: "transparent"
                                                Rectangle{
                                                    anchors.centerIn: parent
                                                    height: parent.height/3
                                                    width: parent.width/3
                                                    border.width: 1
                                                    radius: height/2
                                                    border.color: Universal.foreground
                                                    color: "transparent"
                                                }
                                            }
                                            Text{
                                                Layout.row: 1
                                                Layout.alignment: Qt.AlignHCenter
                                                text:"GPS"
                                                font.pointSize: 10
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
                                                Layout.fillHeight: true
                                                width: height
                                                Layout.alignment: Qt.AlignHCenter
                                                border.width: 1
                                                radius: height/2
                                                border.color: Universal.foreground
                                                color: "transparent"
                                                Rectangle{
                                                    anchors.centerIn: parent
                                                    height: parent.height/3
                                                    width: parent.width/3
                                                    border.width: 1
                                                    radius: height/2
                                                    border.color: Universal.foreground
                                                    color: "transparent"
                                                }
                                            }
                                            Text{
                                                Layout.row: 1
                                                Layout.alignment: Qt.AlignHCenter
                                                text:"Wi-Fi"
                                                font.pointSize: 10
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
                            font.pointSize: 10
                            wrapMode: Text.Wrap
                            color: Universal.foreground
                            text:"<p>When running a UAT Out test, usethe directional antenna with
Port A for over the air Testing.</p><br><p>Attach the GPS antenna to acquire LAT, LON an time.</p>"
                        }
                    }
                }
            }


            footer:Rectangle{
                height: 40
                width: parent.width
                color: Universal.background
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    text: "CLOSE"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    color: Universal.foreground
                    MouseArea {
                        anchors.fill: parent
                        onClicked: guidePopup.close()
                    }
                }
            }
        }
    }
}

