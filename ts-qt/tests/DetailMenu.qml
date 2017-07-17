import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        Rectangle{
            Layout.fillWidth: true
            Layout.maximumWidth: 400
            Layout.alignment: Qt.AlignHCenter
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
            height: content.height
            ColumnLayout{
                id: content
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                spacing: 4
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Layout.bottomMargin: 10
                    Text {
                        anchors.centerIn: parent
                        text: "OPTIONS"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        width: 35
                        Image {
                            id: closeImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        ColorOverlay{
                            anchors.fill: closeImg
                            source: closeImg
                            color: Universal.accent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: detailMenuPopup.close()
                        }
                    }
                }
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: saveImg.height
                            width: saveImg.width
                            Layout.leftMargin: 30
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: saveImg
                                source: "qrc:/img/img/Download-22.png"
                            }
                            ColorOverlay{
                                anchors.fill: saveImg
                                source: saveImg
                                color: "white"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "SAVE TEST RESULTS"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked: {}
                    }
                }
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: exitImg.height
                            width: exitImg.width
                            Layout.leftMargin: 26
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: exitImg
                                source: "qrc:/img/img/exit.png"
                            }
                            ColorOverlay{
                                anchors.fill: exitImg
                                source: exitImg
                                color: "white"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "EXIT TO TEST LANDING PAGE"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
                    }
                }
                Rectangle{
                    Layout.margins: 5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 60
                    height: 1
                    color: Universal.foreground
                    opacity: 0.2
                }
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: starImg.height
                            width: starImg.width
                            Layout.leftMargin: 30
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: starImg
                                source: "qrc:/img/img/Star.png"
                            }
                            ColorOverlay{
                                anchors.fill: starImg
                                source: starImg
                                color: "white"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "ADD TO HOMEPAGE"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked: {}
                    }
                }
                Rectangle{
                    Layout.bottomMargin: 15
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: brighnessImg.height
                            width: brighnessImg.width
                            Layout.leftMargin: 30
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: brighnessImg
                                source: "qrc:/img/img/brightness.png"
                            }
                            ColorOverlay{
                                anchors.fill: brighnessImg
                                source: brighnessImg
                                color: "white"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "DISPLAY OPTIONS"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked: {}
                    }
                }
            }
        }
    }
}

