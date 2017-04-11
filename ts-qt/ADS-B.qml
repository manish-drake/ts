import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Item {
    anchors.centerIn: parent
    anchors.fill: parent
    anchors.leftMargin: 10
    anchors.topMargin: 10

    Component {
        id: testCardDelegate
        Rectangle {
            id: wrapper
            border.color: "#0d000000"
            border.width: 1
            radius: 5
            width: grid.cellWidth - 10;
            height: grid.cellHeight - 10
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
                            width: 30
                            color: "transparent"
                            Layout.leftMargin: 5
                            Image {
                                id: guideImage
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/img/img/guide.png"
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
                            width: 30
                            color: "transparent"
                            Image {
                                id: saveImage
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/img/img/save.png"
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
                            height: 30
                            color: "transparent"
                        }

                        Rectangle {
                            Layout.column: 3
                            Layout.fillHeight: true
                            width: 30
                            color: "transparent"

                            Image {
                                id: favImage
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/img/img/fav.png"
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
                            Layout.column: 4
                            Layout.fillHeight: true
                            width: 45
                            color: "transparent"

                            GridLayout {
                                id: gridLayout1
                                anchors.fill: parent
                                Image {
                                    id: image1
                                    Layout.column: 0
                                    anchors.verticalCenter: parent.verticalCenter
                                    source: "qrc:/img/img/cout.png"
                                }
                                Text {
                                    anchors.left: image1.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    Layout.column: 1
                                    text: "7"
                                    font.pointSize: 10
                                }
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
                onClicked: navigationModel.currentView = navigationModel.getTargetView("_test", id)
            }
        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: grid.width/2; cellHeight: 200
        model: testModel
        delegate: testCardDelegate
        focus: true
    }
}
