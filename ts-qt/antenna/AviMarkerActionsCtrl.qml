import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Rectangle {
    Layout.columnSpan: 2
    Layout.fillWidth: true
    height: 35
    color: Universal.theme === Universal.Light ? "#11000000" : "#1fffffff"
    radius: 4
    RowLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: prevMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.3
            enabled: graphCtrl.selectedMarkerIndex > 0
            Image{
                anchors.centerIn: parent
                source: "qrc:/img/img/Sort Left Filled-accent.png"
            }
            MouseArea{
                id: prevMArea
                anchors.fill: parent
                onClicked: graphCtrl.selectedMarkerIndex = graphCtrl.selectedMarkerIndex - 1
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 2
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: nextMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.3
            enabled: graphCtrl.selectedMarkerIndex < markersModel.count-1
            Image{
                anchors.centerIn: parent
                source: "qrc:/img/img/Sort Right Filled-accent.png"
            }
            MouseArea{
                id: nextMArea
                anchors.fill: parent
                onClicked: graphCtrl.selectedMarkerIndex = graphCtrl.selectedMarkerIndex + 1
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 2
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
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
                font.weight: Font.Black
                font.family: robotoRegular.name
                text: "<<<"
                color: Universal.accent
            }
            MouseArea{
                id: decValMArea
                anchors.fill: parent
                onClicked: markersModel.get(graphCtrl.selectedMarkerIndex)._val = markersModel.get(graphCtrl.selectedMarkerIndex)._val - graphCtrl.markerStepSize
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 2
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
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
                font.weight: Font.Black
                font.family: robotoRegular.name
                text: ">>>"
                color: Universal.accent
            }
            MouseArea{
                id: incValMArea
                anchors.fill: parent
                onClicked: markersModel.get(graphCtrl.selectedMarkerIndex)._val = markersModel.get(graphCtrl.selectedMarkerIndex)._val + graphCtrl.markerStepSize
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 2
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: valleyMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            Text{
                anchors.centerIn: parent
                font.pixelSize: 16
                font.weight: Font.Black
                font.family: robotoRegular.name
                text: "+V"
                color: Universal.accent
            }
            MouseArea{
                id: valleyMArea
                anchors.fill: parent
                //                    onClicked:
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 2
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: peakValMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.4
            Text{
                anchors.centerIn: parent
                font.pixelSize: 16
                font.weight: Font.Black
                font.family: robotoRegular.name
                text: "+P"
                color: Universal.accent
            }
            MouseArea{
                id: peakValMArea
                anchors.fill: parent
                //                    onClicked:
            }
        }
        Rectangle{
            Layout.fillHeight: true
            width: 2
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
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
                font.weight: Font.Black
                font.family: robotoRegular.name
                text: "+"
                color: Universal.accent
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
            width: 2
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: remMArea.pressed ? "#1A000000" : "transparent"
            opacity: enabled ? 1.0 : 0.3
            enabled: markersModel.count > 1
            Image{
                id: image1
                anchors.centerIn: parent
                height: 22
                width: 22
                source: "qrc:/img/img/Delete-25.png"
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
