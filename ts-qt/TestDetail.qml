import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Item {
    id: item1


    ListModel {
        id: nestedModel
        ListElement {
            summaryName: "summary 1"
            subItems: [
                ListElement { itemName: "Label 11"; itemValue:"Test Case 11"; myColumn : 0},
                ListElement { itemName: "Label 12"; itemValue:"Test Case 12"; myColumn : 1},
                ListElement { itemName: "Label 13"; itemValue:"Test Case 13"; myColumn : 2},
                ListElement { itemName: "Label 14"; itemValue:"Test Case 14"; myColumn : 0}
            ]
        }
        ListElement {
            summaryName: "summary 2"
            subItems: [
                ListElement { itemName: "Label 21"; itemValue:"Test Case 21"; myColumn : 3 },
                ListElement { itemName: "Label 22"; itemValue:"Test Case 22"; myColumn : 3 },
                ListElement { itemName: "Label 23"; itemValue:"Test Case 23"; myColumn : 3 },
                ListElement { itemName: "Label 24"; itemValue:"Test Case 24"; myColumn : 3 }
            ]
        }
        ListElement {
            summaryName: "summary 3"
            subItems: [
                ListElement { itemName: "Label 31"; itemValue:"Test Case 31"; myColumn : 1 },
                ListElement { itemName: "Label 32"; itemValue:"Test Case 32"; myColumn : 3 },
                ListElement { itemName: "Label 33"; itemValue:"Test Case 33"; myColumn : 5 },
                ListElement { itemName: "Label 34"; itemValue:"Test Case 34"; myColumn : 7 }
            ]
        }
    }

    // property variant subItemModel : subItems

    Component {
        id: summaryDelegate
        Rectangle {
            id: categoryItem
            height: 100
            width: parent.width
            Text {
                id:summaryHeader
                anchors.top: parent.top
                text: name
            }
            ListView {
                anchors.top:summaryHeader.bottom
                anchors.topMargin: 10
                height: 100
                width: 100
                id: subItemRepeater
                model: testParamModel

                delegate: Rectangle {
                    height: 50
                    width: parent.width
                    Item {
                        x: col * 20
                        y: row * 20
                        Text {
                            text: key
                        }
                    }
                }
            }

        }
    }
    

    Rectangle{
        id:testHeaderRect
        height: 25
        width: parent.width
        Rectangle{
            id: rectangle1
            anchors.margins: 10
            height: 20
            anchors.top: parent.top
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
            count: 8
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

    GridLayout{
        anchors.top:testHeaderRect.bottom
        anchors.bottom:testFooterRect.top
        anchors.topMargin: 25
        anchors.fill: parent
        Repeater{
            model: summaryModel
            delegate: Rectangle {
                color: "lightgray"
                Layout.row: order
                height: 100
                ColumnLayout {
                    Text {
                        text: name
                        font.bold: true
                        font.pointSize: 12
                    }
                    GridLayout {
                        Repeater {
                            model: testParamModel
                            delegate: Rectangle{
                                color: "yellow"
                                Layout.row: row
                                Layout.fillWidth: true
                                Layout.preferredWidth : 170
                                Layout.column: col
                                Layout.columnSpan: 1
                                Layout.rowSpan: 1
                                height: 20
                                Text {
                                    text: "%1: %2 %3".arg(key).arg(val).arg(unit)
                                }
                            }
                        }
                    }
                }
            }

        }
    }
    Rectangle{
        id:testFooterRect
        height: 38
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        width: parent.width

        Text{
            text:"<PREVIOUS"
            anchors.verticalCenter: parent.verticalCenter
            font.bold:true
            color: "#387EF5"
            font.pointSize: 10

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
        }
    }

}
