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

            GridLayout {
                id: gridLayout
                anchors.fill: parent

                Rectangle {
                    Layout.row: 0
                    Layout.column: 0
                    height: 30
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
                    Layout.row: 0
                    Layout.column: 1
                    height: 30
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
                    Layout.row: 0
                    Layout.column: 2
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height/6
                    color: "transparent"
                }
                Rectangle {
                    Layout.row: 0
                    Layout.column: 3
                    height: 30
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
                    Layout.row: 0
                    Layout.column: 4
                    height: 30
                    width: 45
                    color: "transparent"

                    GridLayout {
                        id: gridLayout1
                        anchors.fill: parent
                        Image {
                            id: countImage
                            Layout.row: 0
                            Layout.column: 0
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/img/img/cout.png"
                        }
                        Text {
                            anchors.centerIn: parent
                            Layout.row: 0
                            Layout.column: 1
                            text: "7"
                            font.pointSize: 11
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

                Text {
                    anchors.centerIn: parent
                    text: name
                    font.pointSize: 14
                    Layout.row: 1
                    Layout.columnSpan: 5
                    Layout.bottomMargin: 60
                }

                Text {
                    text: "RECENT TEST RESULTS"
                    font.pointSize: 8
                    Layout.row: 2
                    Layout.columnSpan: 5
                    Layout.bottomMargin: 40
                    Layout.leftMargin: 5
                }
            }

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 1.1
                verticalOffset: 1.1
                radius: 4.0
                color: "Lightgray"
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
