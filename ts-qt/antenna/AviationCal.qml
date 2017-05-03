import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

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
                            AviChartCtrl{
                                id: chartCtrl
                                areControlsAvailble : false
                            }
                            GridView{
                                id: grid
                                anchors.centerIn: parent
                                anchors.verticalCenterOffset: 15
                                height: parent.height * 0.8
                                width: parent.width * 0.82
                                cellWidth: grid.width/2; cellHeight: grid.height/2
                                focus: true
                                model: ListModel{
                                    ListElement{header: "SHORT"; status: "UNCAL"; datetime:"--/--/--"}
                                    ListElement{header: "OPEN"; status: "UNCAL"; datetime:"--/--/--"}
                                    ListElement{header: "LOAD"; status: "UNCAL"; datetime:"--/--/--"}
                                    ListElement{header: "THRU"; status: "UNCAL"; datetime:"--/--/--"}
                                }
                                delegate:Component{
                                    Rectangle{
                                        width: grid.cellWidth
                                        height: grid.cellHeight
                                        color: "transparent"
                                        Rectangle{
                                            id: wrapper
                                            anchors.fill: parent
                                            anchors.margins: 10
                                            color: index == typeComboBox.currentIndex ?  Universal.accent : Qt.darker(Universal.accent,1.2)
                                            border.color: "#0dffffff"
                                            border.width: 1
                                            radius: 5
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
                                                    font.pointSize: 11
                                                }
                                                Text{
                                                    text: status
                                                    color: "white"
                                                    font.pointSize: 11
                                                }
                                                Text {
                                                    text: datetime
                                                    color: "white"
                                                    font.pointSize: 11
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
                            height: 200
                            Rectangle{
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                Rectangle {
                                    color: Universal.theme == Universal.Dark ? "#333333" : "#f5f5f5"
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
                                                    color: typeComboBox.pressed ? "#D0D0D0" : "#E0E0E0"
                                                    Image {
                                                        source: "qrc:/img/img/Expand Arrow-25.png"
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
                                                        anchors.leftMargin: 5
                                                        font.pointSize: 10
                                                        color: "#333333"
                                                        text: "MODE: " + control.currentText
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
                                currentModeIndex: 3
                            }

                            Rectangle{
                                Layout.row: 1
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                Button{
                                    implicitWidth: parent.width
                                    text: "MEASURE"
                                }
                            }

                            Rectangle{
                                Layout.row: 1
                                Layout.column: 1
                                Layout.fillWidth: true
                                Layout.fillHeight: true
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
