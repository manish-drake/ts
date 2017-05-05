import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Rectangle{
    Layout.row: 1
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 50
        color: markerComboBox.pressed ? "#D0D0D0" : "#E0E0E0"
        ComboBox {
            id: markerComboBox
            implicitWidth: 70
            implicitHeight: parent.height
            style: ComboBoxStyle{
                background: Rectangle{
                    height: markerComboBox.height
                    width: markerComboBox.width
                    color: "transparent"
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
                        font.pointSize: 11
                        color: "#333333"
                        text: "MARKER"
                    }
                }
            }
            model: ListModel {
                ListElement { text: "Change Position"; }
                ListElement { text: "Peak or valley"; }
                ListElement { text: "Add/Delete"; }
            }
        }
        Row{
            visible: markerComboBox.currentIndex == 0
            height: parent.height
            anchors.right: parent.right
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: decValMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
//                enabled: markersModel.get(chartCtrl.selectedMarkerIndex)._val > chartCtrl.markerMinVal
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 12
                    text: "<<<"
                }
                MouseArea{
                    id: decValMArea
                    anchors.fill: parent
                    onClicked: {
                            markersModel.get(chartCtrl.selectedMarkerIndex)._val = markersModel.get(chartCtrl.selectedMarkerIndex)._val - chartCtrl.markerStepSize

                    }
                }
            }
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: incValMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
//                enabled: markersModel.get(chartCtrl.selectedMarkerIndex)._val < chartCtrl.markerMaxVal
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 12
                    text: ">>>"
                }
                MouseArea{
                    id: incValMArea
                    anchors.fill: parent
                    onClicked: {
                            markersModel.get(chartCtrl.selectedMarkerIndex)._val = markersModel.get(chartCtrl.selectedMarkerIndex)._val + chartCtrl.markerStepSize
                    }
                }
            }
        }
        Row{
            visible: markerComboBox.currentIndex == 1
            height: parent.height
            anchors.right: parent.right
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: valleyMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 12
                    text: "+V"
                }
                MouseArea{
                    id: valleyMArea
                    anchors.fill: parent
                    //                    onClicked:
                }
            }
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: peakValMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 12
                    text: "+P"
                }
                MouseArea{
                    id: peakValMArea
                    anchors.fill: parent
                    //                    onClicked:
                }
            }
        }
        Row{
            visible: markerComboBox.currentIndex == 2
            height: parent.height
            anchors.right: parent.right
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: addMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                enabled: markersModel.count < 4
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 18
                    text: "+"
                }
                MouseArea{
                    id: addMArea
                    anchors.fill: parent
                    onClicked: {
                        markersModel.append({"num": markersModel.count+1, "_val": 0})
                        chartCtrl.selectedMarkerIndex= ++chartCtrl.selectedMarkerIndex
                    }
                }
            }
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: remMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                enabled: markersModel.count > 1
                Image{
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Delete-25.png"
                    ColorOverlay{
                        anchors.fill: parent
                        source: parent
                        color: "black"
                    }
                }
                MouseArea{
                    id: remMArea
                    anchors.fill: parent
                    onClicked: {
                        markersModel.remove(markersModel.count-1,1)
                        chartCtrl.selectedMarkerIndex= --chartCtrl.selectedMarkerIndex
                    }
                }
            }
        }
    }
}
