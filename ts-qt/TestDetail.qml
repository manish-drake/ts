import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Page {
    id: item1


    header: Rectangle{
        id:testHeaderRect
        height: 25
        width: parent.width
        Rectangle{
            id: rectangle1
            anchors.margins: 10
            height: 20
            anchors.topMargin: 3
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            width: 21
            Image {
                anchors.margins: 10
                id: pointerImage
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/pointer.png"
            }


        }

        PageIndicator {
            id: pageIndicator
            anchors.verticalCenterOffset: 7
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            count: 7
            currentIndex: summaryModel.currentPage
        }

        Rectangle{
            id: rectangle
            width: 20
            height: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            anchors.right: parent.right
            Image {
                anchors.margins: 10
                id: closeImage
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/close.png"
            }
        }


    }

    contentItem: Rectangle {
        //        color: "green"
        GridLayout{
            anchors.topMargin: 5
            anchors.bottomMargin: 20
            anchors.fill: parent
            columnSpacing: 5
            Repeater{
                model: summaryModel
                delegate: ColumnLayout {
                    Layout.row: order
                    Layout.minimumHeight: 100
                    Layout.topMargin: 20
                    Text {
                        Layout.fillHeight: true
                        text: name
                        font.bold: true
                        font.pointSize: 12
                    }
                    GridLayout {
                        Repeater {
                            model: summaryModel.getTestParamsForsummary(id)
                            delegate: Rectangle{
                                //                                color: "yellow"
                                Layout.row: model.modelData.row
                                Layout.column: model.modelData.col
                                Layout.fillWidth: true
                                Layout.preferredWidth : 170
                                Layout.columnSpan: model.modelData.colSpan
                                Layout.rowSpan: model.modelData.rowSpan
                                height: 15
                                Text {
                                    text: model.modelData.data
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    footer: Rectangle{
        id:testFooterRect
        height: 38
        anchors.bottomMargin: 0
        width: parent.width

        Text{
            text:"<PREVIOUS"
            anchors.verticalCenter: parent.verticalCenter
            font.bold:true
            color: "#387EF5"
            font.pointSize: 10
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous")
            }

        }

        Rectangle{
            color: "blue"
            height:38
            width: 38
            anchors.verticalCenter: parent.verticalCenter
            radius:12.5
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: playImage
                source: "qrc:/img/img/play.png"
            }
        }

        Text {
            id: name
            text: qsTr("NEXT>")
            font.bold:true
            font.pointSize: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            color: "#387EF5"
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    navigationModel.currentView = navigationModel.getTargetView("Next")
                }
            }
        }
    }

}
