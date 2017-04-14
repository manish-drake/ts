import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Item {
    anchors.centerIn: parent
    anchors.fill: parent
    anchors.leftMargin: 10
    anchors.topMargin: 10

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: grid.width/2; cellHeight: 200
        model: testModel
        delegate: testCardDelegate
        focus: true

        Component {
            id: testCardDelegate
            Rectangle {
                id: wrapper
                border.color: "#0d000000"
                border.width: 1
                radius: 5
                width: grid.cellWidth - 10;
                height: grid.cellHeight - 10
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset: 1.1
                    verticalOffset: 1.1
                    radius: 4.0
                    color: "#0d000000"
                    spread: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: grid.currentIndex = index
                    onDoubleClicked: navigationModel.currentView = navigationModel.getTargetView("_test", id)
                }

                GridLayout{
                    anchors.fill: parent
                    anchors.margins: 10
                    rowSpacing: 0
                    columnSpacing: 0
                    clip: true
                    Rectangle{
                        Layout.row:0
                        Layout.fillWidth: true
                        height: 25
                        color: "transparent"

                        GridLayout{
                            anchors.fill: parent
                            rowSpacing: 0
                            columnSpacing: 0
                            Rectangle {
                                Layout.column: 0
                                Layout.fillHeight: true
                                width: 35
                                color: "transparent"
                                Image {
                                    id: guideImage
                                    anchors.centerIn: parent
                                    source: "qrc:/img/img/Info-24.png"
                                }
                                ColorOverlay {
                                    anchors.fill: guideImage
                                    source: guideImage
                                    color: "#377DF3"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        //  popupCenter.open()
                                    }
                                    onPressed: parent.opacity = 0.5
                                    onReleased: parent.opacity = 1
                                }
                            }

                            Rectangle {
                                Layout.column: 1
                                Layout.fillHeight: true
                                width: 35
                                color: "transparent"
                                Image {
                                    id: saveImage
                                    anchors.centerIn: parent
                                    source: "qrc:/img/img/Download-22.png"
                                }
                                ColorOverlay {
                                    anchors.fill: saveImage
                                    source: saveImage
                                    color: "#377DF3"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        //  popupCenter.open()
                                    }
                                    onPressed: parent.opacity = 0.5
                                    onReleased: parent.opacity = 1
                                }
                            }

                            Rectangle {
                                Layout.column: 2
                                Layout.fillWidth: true
                                color: "transparent"
                            }

                            Rectangle {
                                Layout.column: 3
                                Layout.fillHeight: true
                                width: 35
                                color: "transparent"
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
                                    text: "7"
                                    font.pointSize: 10
                                }
                            }
                        }
                    }
                    Rectangle{
                        Layout.row: 1
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color:"transparent"
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            elide:Text.ElideRight
                            text: name
                            font.pointSize: 12
                            font.weight: Font.DemiBold
                            clip:true
                        }
                    }
                    Rectangle{
                        Layout.row: 2
                        height: 50
                        Layout.fillWidth: true
                        color:"transparent"

                        Text {
                            anchors.left:parent.left
                            anchors.right:parent.right
                            elide:Text.ElideRight
                            text: "RECENT TEST RESULTS"
                            font.pointSize: 10
                            color: "Gray"
                        }
                    }
                }
            }
        }
        highlight:Rectangle{
            color: "transparent"
            border.color: "#377DF3"
            border.width: 1
            radius:5
        }
    }
}
