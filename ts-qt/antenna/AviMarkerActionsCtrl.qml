import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Rectangle {
    Layout.columnSpan: 2
    Layout.fillWidth: true
    height: 35
    color: Universal.theme === Universal.Light ? Universal.accent : "#38363C"
    radius: 3
    RowLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: prevMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            enabled: graphCtrl.selectedMarkerIndex > 0
            Image{
                anchors.centerIn: parent
                source: "qrc:/img/img/Arrow-left.png"
            }
            MouseArea{
                id: prevMArea
                anchors.fill: parent
                onClicked: graphCtrl.selectedMarkerIndex = graphCtrl.selectedMarkerIndex - 1
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 1
            color: Universal.background
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: nextMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            enabled: graphCtrl.selectedMarkerIndex < markersModel.count-1
            Image{
                anchors.centerIn: parent
                source: "qrc:/img/img/Arrow-right.png"
            }
            MouseArea{
                id: nextMArea
                anchors.fill: parent
                onClicked: graphCtrl.selectedMarkerIndex = graphCtrl.selectedMarkerIndex + 1
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 1
            color: Universal.background
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: decValMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            enabled: graphCtrl.selectedMarkerVal > graphCtrl.markerMinVal
            Text{
                anchors.centerIn: parent
                font.pixelSize: 16
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                text: "<<<"
                color: "white"
            }
            MouseArea{
                id: decValMArea
                anchors.fill: parent
                onClicked: markersModel.get(graphCtrl.selectedMarkerIndex)._val = markersModel.get(graphCtrl.selectedMarkerIndex)._val - graphCtrl.markerStepSize
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 1
            color: Universal.background
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: incValMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            enabled: graphCtrl.selectedMarkerVal < graphCtrl.markerMaxVal
            Text{
                anchors.centerIn: parent
                font.pixelSize: 16
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                text: ">>>"
                color: "white"
            }
            MouseArea{
                id: incValMArea
                anchors.fill: parent
                onClicked: markersModel.get(graphCtrl.selectedMarkerIndex)._val = markersModel.get(graphCtrl.selectedMarkerIndex)._val + graphCtrl.markerStepSize
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 1
            color: Universal.background
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: valleyMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            Text{
                anchors.centerIn: parent
                font.pixelSize: 16
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                text: "+V"
                color: "white"
            }
            MouseArea{
                id: valleyMArea
                anchors.fill: parent
                //                    onClicked:
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 1
            color: Universal.background
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: peakValMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            Text{
                anchors.centerIn: parent
                font.pixelSize: 16
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                text: "+P"
                color: "white"
            }
            MouseArea{
                id: peakValMArea
                anchors.fill: parent
                //                    onClicked:
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 1
            color: Universal.background
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: addMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            enabled: markersModel.count < 4
            Text{
                anchors.centerIn: parent
                font.pixelSize: 22
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                text: "+"
                color: "white"
            }
            MouseArea{
                id: addMArea
                anchors.fill: parent
                onClicked: {
                    markersModel.append({"num": markersModel.count+1, "_val": 0})
                    graphCtrl.selectedMarkerIndex= ++graphCtrl.selectedMarkerIndex
                }
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 1
            color: Universal.background
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: remMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.8
            enabled: markersModel.count > 1
            Image{
                id: image1
                anchors.centerIn: parent
                height: 22
                width: 22
                source: "qrc:/img/img/Delete-white.png"
            }
            MouseArea{
                id: remMArea
                anchors.fill: parent
                onClicked: {
                    markersModel.remove(markersModel.count-1,1)
                    graphCtrl.selectedMarkerIndex= --graphCtrl.selectedMarkerIndex
                }
            }
        }
    }
}
