import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item {
    anchors.fill: parent
    GridView{
        id: grid
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 10
        cellWidth: width/2; cellHeight: 200
        model: testModel
        delegate: testCardDelegate
        focus: true
        highlightMoveDuration: 0
        highlight:Rectangle{
            color: "transparent"
            border.color: Universal.theme == Universal.Dark ? "white" : Universal.accent
            border.width: 1
            radius:3
        }
        Component{
            id: testCardDelegate
            Rectangle {
                id: wrapper
                width: grid.cellWidth - 10
                height: grid.cellHeight -10
                color: Universal.background
                border.color: "#0d000000"
                border.width: 1
                radius: 3
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset: 1.1
                    verticalOffset: 1.1
                    radius: 4.0
                    color: "#26000000"
                    spread: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: grid.currentIndex = index
                    onDoubleClicked:
                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Short");
                }
                GridLayout{
                    anchors.fill: parent
                    anchors.margins: 10
                    rowSpacing: 0
                    columnSpacing: 0
                    Item{
                        Layout.row:0
                        Layout.fillWidth: true
                        height: 25
                        GridLayout{
                            anchors.fill: parent
                            rowSpacing: 0
                            columnSpacing: 0
                            Item {
                                Layout.column: 2
                                Layout.fillWidth: true
                            }
                            Item {
                                Layout.column: 3
                                Layout.fillHeight: true
                                width: 35
                                Image {
                                    id: favImage
                                    anchors.centerIn: parent
                                    source: "qrc:/img/img/Star Filled-20.png"
                                }
                                ColorOverlay {
                                    anchors.fill: favImage
                                    source: favImage
                                    color: "#666666"
                                }
                            }

                            GridLayout {
                                id: gridLayout1
                                Layout.column: 4
                                Layout.fillHeight: true
                                columnSpacing: 5
                                Image {
                                    id: album
                                    anchors.verticalCenter: parent.verticalCenter
                                    source: "qrc:/img/img/album.png"
                                }
                                ColorOverlay {
                                    anchors.fill: album
                                    source: album
                                    color: "#666666"
                                }
                                Text {
                                    Layout.column: 1
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "1"
                                    font.pointSize: 10
                                    color: "#666666"
                                    font.bold: true
                                }
                            }
                        }
                    }
                    Item{
                        Layout.row: 1
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            elide:Text.ElideRight
                            text: name
                            font.pointSize: 12
                            font.weight: Font.DemiBold
                            color: Universal.foreground
                        }
                    }
                    Item{
                        Layout.row: 2
                        height: 50
                        Layout.fillWidth: true

                        Text {
                            anchors.left:parent.left
                            anchors.right:parent.right
                            elide:Text.ElideRight
                            text: "RECENT TEST RESULTS"
                            font.pointSize: 10
                            color: Universal.foreground
                            opacity: 0.8
                        }
                    }
                }
            }
        }
    }
}

