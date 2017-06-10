import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

 Item{
    Layout.row: 1
    Layout.fillWidth: true
    Layout.fillHeight: true
    property int selectedIndex: 0
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 50
        color: "#ededed"
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
        RowLayout{
            anchors.fill: parent
             Item{
                 anchors.top:parent.top
                 anchors.bottom:parent.bottom
                Layout.fillWidth: true
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 10
                    elide: Text.ElideRight
                    font.pointSize: 11
                    color: "#333333"
                    text: "MARKER"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(selectedIndex == 0){
                            selectedIndex = 1
                        }
                        else if(selectedIndex == 1){
                            selectedIndex = 2
                        }
                        else if(selectedIndex == 2){
                            selectedIndex = 0
                        }
                    }
                }
            }
            Row{
                visible: selectedIndex == 0
                anchors.top:parent.top
                anchors.bottom:parent.bottom
                anchors.right: parent.right
                Rectangle{
                    anchors.top:parent.top
                    anchors.bottom:parent.bottom
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
                    anchors.top:parent.top
                    anchors.bottom:parent.bottom
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
                visible: selectedIndex == 1
                anchors.top:parent.top
                anchors.bottom:parent.bottom
                anchors.right: parent.right
                Rectangle{
                    anchors.top:parent.top
                    anchors.bottom:parent.bottom
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
                    anchors.top:parent.top
                    anchors.bottom:parent.bottom
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
                visible: selectedIndex == 2
                anchors.top:parent.top
                anchors.bottom:parent.bottom
                anchors.right: parent.right
                Rectangle{
                    anchors.top:parent.top
                    anchors.bottom:parent.bottom
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
                    anchors.top:parent.top
                    anchors.bottom:parent.bottom
                    implicitWidth: 50
                    color: remMArea.pressed ? "#D0D0D0" : "transparent"
                    opacity: enabled ? 1.0 : 0.4
                    enabled: markersModel.count > 1
                    Image{
                        anchors.centerIn: parent
                        height: 22
                        width: 22
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
}
