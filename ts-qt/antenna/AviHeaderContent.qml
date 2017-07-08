import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Rectangle{
    id:testHeaderRect
    property string detailTitle: "VSWR"
    height: 40
    anchors.left:parent.left
    anchors.right:parent.right
    color: Universal.background

    RowLayout{
        visible: graphCtrl.areControlsAvailble
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 5
        Item{
            height:25
            width: 35
            Layout.alignment: Qt.AlignVCenter
            Image {
                id: image1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/Download-22.png"                
            }
            ColorOverlay{
                anchors.fill: image1
                source: image1
                color: Universal.foreground
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var datetime = new Date();
                    var user = configPanel.currentOperator;
                    var markerPosition = markersModel.get(0)._val;
                    var markerName = "M" + markersModel.get(0).num;
                    var range = graphCtrl.isScaleChecked ? "-6,-18" : "0,-30";
                    var bandRange = graphCtrl.freqStartVal+","+graphCtrl.freqEndVal;
                    var data = "";
                    for (var i = 0; i < dummy.points.length; i++){
                        if(i == 0){
                            data = dummy.points[i]
                        }
                        else{
                            data = data +","+dummy.points[i]
                        }
                    }
                    switch(detailTitle){
                    case "VSWR":
                        var bandName = bandCtrl.bandName
                        snapshotModel.addAviationVswr(datetime, user,data,markerPosition,markerName,range,bandRange,bandName);
                        break;
                    case "CABLE LOSS":
                        var bandName2 = bandCtrl.bandName
                        snapshotModel.addAviationCl(datetime,user,data,markerPosition,markerName,range,bandRange,bandName2);
                        break;
                    case "DISTANCE TO FAULT":
                        var velocity = coaxList.get(coaxComboBox.currentIndex).vel
                        var cableType = coaxList.get(coaxComboBox.currentIndex).text
                        snapshotModel.addAviationDtf(datetime,user,data,markerPosition,markerName,range,velocity,cableType);
                        break;
                    }
                }
            }
        }
        Item{
            height:25
            width: 35
            Layout.alignment: Qt.AlignVCenter
            Image {
                id: image2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/Past-22.png"
            }
            ColorOverlay{
                anchors.fill: image2
                source: image2
                color: Universal.foreground
            }
            MouseArea {
                anchors.fill: parent
                onClicked: savedDataPopup.open();
            }
        }
    }
    Text {
        id: testTitle
        anchors.centerIn: parent
        text: detailTitle
        font.pixelSize: 16
        font.weight: Font.DemiBold
        font.family: robotoRegular.name
        color: Universal.foreground
    }

    Item{
        id: rectangle
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 50
        Image {
            id: closeImage
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/img/Delete-25.png"
        }
        ColorOverlay{
            anchors.fill: closeImage
            source: closeImage
            color: Universal.foreground
        }
        MouseArea {
            anchors.fill: parent
            onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
        }
    }
}
