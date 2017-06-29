import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Page {
    id: item1
    anchors.fill: parent
    header: AviHeaderContent{
        detailTitle: "CALIBRATION"
    }

    contentItem: Rectangle {
        color: Universal.background
        Flickable {
            anchors.fill: parent
            contentWidth: parent.width;
            contentHeight: content.height + content.y + 60
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            Column{
                id: content
                y: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                spacing: 30

                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 336
                    AviChartCtrl{
                        id: chartCtrl
                        areControlsAvailble : false
                    }
                    ColumnLayout{
                        anchors.fill: parent

                    GridView{
                        id: grid
                        Layout.fillWidth: true
                        Layout.maximumWidth: 380
                        Layout.alignment: Qt.AlignCenter
                        Layout.topMargin: 55
                        Layout.leftMargin: 35
                        Layout.rightMargin: 35
                        height: 240
                        cellWidth: grid.width/2; cellHeight: grid.height/2
                        focus: true
                        boundsBehavior: Flickable.StopAtBounds
                        model: ListModel{
                            ListElement{header: "SHORT"; status: "UNCAL"; datetime:"--/--/--"}
                            ListElement{header: "OPEN"; status: "UNCAL"; datetime:"--/--/--"}
                            ListElement{header: "LOAD"; status: "UNCAL"; datetime:"--/--/--"}
                            ListElement{header: "THRU"; status: "UNCAL"; datetime:"--/--/--"}
                        }
                        delegate:Component{
                            Item{
                                width: grid.cellWidth
                                height: grid.cellHeight
                                Rectangle{
                                    id: wrapper
                                    anchors.fill: parent
                                    anchors.margins: 8
                                    color: index == typeComboBox.currentIndex ? Qt.darker(Universal.accent,1.1) : Universal.accent
                                    border.color: index == typeComboBox.currentIndex ? "#aaaaaa" : "#00ffffff"
                                    border.width: 1
                                    radius: 3
                                    layer.enabled: true
                                    layer.effect: DropShadow {
                                        transparentBorder: true
                                        horizontalOffset: 1.1
                                        verticalOffset: 1.1
                                        radius: 4.0
                                        color: "#0dffffff"
                                        spread: 0
                                    }
                                    Column{
                                        anchors.centerIn: parent
                                        Text{
                                            text: header
                                            color: "white"
                                            font.weight: Font.Bold
                                            font.pixelSize: 14
                                        }
                                        Text{
                                            text: status
                                            color: "white"
                                            font.pixelSize: 14
                                        }
                                        Text {
                                            text: datetime
                                            color: "white"
                                            font.pixelSize: 14
                                        }
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: typeComboBox.currentIndex = index
                                    }
                                }
                            }
                        }
                    }
                    }
                }

                GridLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    columns: 2
                    columnSpacing: 15
                    rowSpacing: 20
                    height: 140
                    Item{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Item{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            height: 50
                            ComboBox {
                                id: typeComboBox
                                implicitWidth: parent.width
                                implicitHeight: parent.height
                                style: ComboBoxStyle{
                                    background: Rectangle{
                                        height: typeComboBox.height
                                        width: typeComboBox.width
                                        color: typeComboBox.pressed ? "#e7e7e7" : "#ededed"
                                        radius: 3
                                        layer.enabled: true
                                        layer.effect: DropShadow {
                                            transparentBorder: true
                                            horizontalOffset: 1.1
                                            verticalOffset: 1.1
                                            radius: 4.0
                                            color: "#4d000000"
                                            spread: 0
                                        }
                                        Image {
                                            source: "qrc:/img/img/Expand Arrow-20.png"
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10
                                        }
                                    }
                                    label:Item {
                                        anchors.fill: parent
                                        Text {
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.right: parent.right
                                            anchors.leftMargin: 5
                                            anchors.rightMargin: 20
                                            elide: Text.ElideRight
                                            font.pixelSize: 14
                                            color: "#333333"
                                            text: "TYPE: " + control.currentText
                                        }
                                    }
                                }
                                model: ListModel {
                                    id: typeList
                                    ListElement { text: "SHORT";}
                                    ListElement { text: "OPEN";}
                                    ListElement { text: "LOAD";}
                                    ListElement { text: "THRU";}
                                }
                                onCurrentIndexChanged:{
                                    switch(currentIndex){
                                    case 0:
                                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Short")
                                        break;
                                    case 1:
                                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Open")
                                        break;
                                    case 2:
                                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Load")
                                        break;
                                    case 3:
                                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Thru")
                                        break;
                                    }
                                }
                            }
                        }
                    }

                    AviModeCtrl{
                        currentModeIndex: 0
                    }

                    Item{
                        Layout.row: 1
                        Layout.column: 0
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Rectangle{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 50
                            color: "#ededed"
                            layer.enabled: true
                            layer.effect: DropShadow {
                                transparentBorder: true
                                horizontalOffset: 1.1
                                verticalOffset: 1.1
                                radius: 4.0
                                color: "#4d000000"
                                spread: 0
                            }
                            Text{
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                text: "MEASURE"
                                color: "#333333"
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: console.log("MEASURE button tapped");
                            }
                        }
                    }

                    Item{
                        Layout.row: 1
                        Layout.column: 1
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Rectangle{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 50
                            color: "#ededed"
                            layer.enabled: true
                            layer.effect: DropShadow {
                                transparentBorder: true
                                horizontalOffset: 1.1
                                verticalOffset: 1.1
                                radius: 4.0
                                color: "#4d000000"
                                spread: 0
                            }
                            Text{
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                text: "DONE"
                                color: "#333333"
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: console.log("DONE button tapped");
                            }
                        }
                    }
                    ListModel{id: markersModel}
                }

            }
        }
        AviFooterContent{}
    }
}
