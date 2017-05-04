import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

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
        color: modeComboBox.pressed ? "#D0D0D0" : "#E0E0E0"

        ComboBox {
            id: modeComboBox
            implicitWidth: 70
            implicitHeight: parent.height
            currentIndex: currentModeIndex
            style: ComboBoxStyle{
                background: Rectangle{
                    height: modeComboBox.height
                    width: modeComboBox.width
                    color: "transparent"
                }
                label:Item {
                    anchors.fill: parent
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
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
            visible: modeComboBox.currentIndex == 0
            height: parent.height
            anchors.right: parent.right
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: decValMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                enabled: chartCtrl.defaultMarkerVal > chartCtrl.markerMinVal
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 10
                    text: "<<<"
                }
                MouseArea{
                    id: decValMArea
                    anchors.fill: parent
                    onClicked: chartCtrl.defaultMarkerVal = chartCtrl.defaultMarkerVal - chartCtrl.markerStepSize
                }
            }
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: incValMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                enabled: chartCtrl.defaultMarkerVal < chartCtrl.markerMaxVal
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 10
                    text: ">>>"
                }
                MouseArea{
                    id: incValMArea
                    anchors.fill: parent
                    onClicked: chartCtrl.defaultMarkerVal = chartCtrl.defaultMarkerVal + chartCtrl.markerStepSize
                }
            }
        }
        Row{
            visible: modeComboBox.currentIndex == 1
            height: parent.height
            anchors.right: parent.right
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: valleyMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 10
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
                    font.pointSize: 10
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
            visible: modeComboBox.currentIndex == 2
            height: parent.height
            anchors.right: parent.right
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: addMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                enabled: userMarkersModel.count < 3
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 12
                    text: "+"
                }
                MouseArea{
                    id: addMArea
                    anchors.fill: parent
                    onClicked: userMarkersModel.append({"num": userMarkersModel.count+2, "val": 0})
                }
            }
            Rectangle{
                height: parent.height
                implicitWidth: 50
                color: remMArea.pressed ? "#D0D0D0" : "transparent"
                opacity: enabled ? 1.0 : 0.4
                enabled: userMarkersModel.count > 0
                Text{
                    anchors.centerIn: parent
                    font.pointSize: 11
                    text: "X"
                }
                MouseArea{
                    id: remMArea
                    anchors.fill: parent
                    onClicked: userMarkersModel.remove(userMarkersModel.count-1,1)
                }
            }
        }
    }
}
