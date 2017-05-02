import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0



Item{
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        border.color: "#0d000000"
        border.width: 1
        radius:5
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#0d000000"
            spread: 0
        }
        Page {
            id: item1
            anchors.fill: parent
            header: AviHeaderContent{
                detailTitle: "CALIBRATION"
            }

            contentItem: Rectangle {
                color: Universal.background
                Flickable {
                    width: parent.width;
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    contentWidth: parent.width;
                    contentHeight: content.height + content.y + 60
                    clip: true
                    boundsBehavior: Flickable.StopAtBounds
                    Column{
                        id: content
                        y: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        spacing: 30

                        Rectangle{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: chartCtrl.height
                            ChartControl{
                                id: chartCtrl
                                areControlsAvailble : false
                            }
                            GridView{
                                id: grid
                                anchors.centerIn: parent
                                anchors.verticalCenterOffset: 20
                                height: parent.height * 0.65
                                width: parent.width * 0.8
                                cellWidth: grid.width/2; cellHeight: grid.height/2
                                focus: true
                                highlight:Rectangle{
                                    color: "transparent"
                                    border.color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                                    border.width: 1
                                    radius:5
                                }
                                model: ListModel{
                                    ListElement{header: "SHORT"; status: "UNCAL"; datetime:"--/--/--"}
                                    ListElement{header: "OPEN"; status: "UNCAL"; datetime:"--/--/--"}
                                    ListElement{header: "LOAD"; status: "UNCAL"; datetime:"--/--/--"}
                                    ListElement{header: "THRU"; status: "UNCAL"; datetime:"--/--/--"}
                                }
                                delegate:Component{
                                    Rectangle {
                                        id: wrapper
                                        width: grid.cellWidth - 10
                                        height: grid.cellHeight -10
                                        color: Universal.accent
                                        border.color: "#0d000000"
                                        border.width: 1
                                        radius: 5
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
                                            onDoubleClicked: navigationModel.setCurrentView(navigationModel.getTargetView("_test", id), {"title":name})
                                        }
                                        Column{
                                            anchors.centerIn: parent
                                            Text{
                                                text: header
                                                color: "white"
                                                font.pointSize: 12
                                            }
                                            Text{
                                                text: status
                                                color: "white"
                                                font.pointSize: 12
                                            }
                                            Text {
                                                text: datetime
                                                color: "white"
                                                font.pointSize: 12
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
                            Rectangle {
                                color: Universal.theme == Universal.Dark ? "#333333" : "#f5f5f5"
                                Layout.fillWidth: true
                                height: 40
                                GridLayout{
                                    anchors.fill: parent
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        leftPadding: 10
                                        font.pointSize: 10
                                        text: qsTr("TYPE:")
                                        color: Universal.foreground
                                    }
                                    Rectangle{
                                        Layout.column: 1
                                        Layout.fillWidth: true
                                    }
                                    ComboBox {
                                        id: typeComboBox
                                        Layout.column: 2
                                        implicitWidth: 120
                                        model: ListModel {
                                            id: typeList
                                            ListElement { text: "SHORT";}
                                            ListElement { text: "OPEN";}
                                            ListElement { text: "LOAD";}
                                            ListElement { text: "THRU";}
                                        }
                                        onCurrentIndexChanged:{

                                        }
                                    }
                                }
                            }

                            AviModeCtrl{
                                currentModeIndex: 3
                            }

                            Rectangle {
                                Layout.row: 1
                                Layout.fillWidth: true
                                Button{
                                    implicitWidth: parent.width
                                    text: "MEASURE"
                                }
                            }

                            Rectangle {
                                Layout.row: 1
                                Layout.column: 1
                                Layout.fillWidth: true
                                Button{
                                    implicitWidth: parent.width
                                    text: "DONE"
                                }
                            }
                        }
                    }
                }
            }

            footer: AviFooterContent{}
        }
    }
}
