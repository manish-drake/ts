import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Rectangle{
    id:testHeaderRect
    property string detailTitle: "VSWR"
    height: 40
    anchors.left:parent.left
    anchors.right:parent.right
    color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"

    Item{
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: 50
        Image {
            id: closeImage
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source:  "qrc:/img/img/Download-22.png"
        }
        ColorOverlay{
            anchors.fill: closeImage
            source: closeImage
            color: Universal.foreground
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var datetime = new Date();
                var user = currentUser;
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
                    notifyPopup.open(); closeTimer.running = true;
                    break;
                case "CABLE LOSS":
                    var bandName2 = bandCtrl.bandName
                    snapshotModel.addAviationCl(datetime,user,data,markerPosition,markerName,range,bandRange,bandName2);
                    notifyPopup.open(); closeTimer.running = true;
                    break;
                case "DISTANCE TO FAULT":
                    var velocity = coaxCtrl.selectedCableVelocity
                    var cableType = coaxCtrl.selectedCableType
                    snapshotModel.addAviationDtf(datetime,user,data,markerPosition,markerName,range,velocity,cableType);
                    notifyPopup.open(); closeTimer.running = true;
                    break;
                }
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
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 5
        width: 50
        Image {
            id: historyImg
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/img/Past-22.png"
        }
        ColorOverlay{
            anchors.fill: historyImg
            source: historyImg
            color: Universal.foreground
        }
        MouseArea {
            anchors.fill: parent
            onClicked: savedDataPopup.open();
        }
    }

    //    Item{
    //        id: rectangle
    //        anchors.top: parent.top
    //        anchors.bottom: parent.bottom
    //        anchors.right: parent.right
    //        anchors.rightMargin: 5
    //        width: 50
    //        Image {
    //            id: closeImage
    //            anchors.horizontalCenter: parent.horizontalCenter
    //            anchors.verticalCenter: parent.verticalCenter
    //            source: "qrc:/img/img/Delete-25.png"
    //        }
    //        ColorOverlay{
    //            anchors.fill: closeImage
    //            source: closeImage
    //            color: Universal.foreground
    //        }
    //        MouseArea {
    //            anchors.fill: parent
    //            onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
    //        }
    //    }

    Item{
        width: 160
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        Popup {
            id: notifyPopup
            width: parent.width
            height: 40
            padding: 0
            modal: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
            background: Rectangle{
                color: testHeaderRect.color
            }
            contentItem: Rectangle{
                color: Universal.foreground
                radius: 20
                Text{
                    anchors.centerIn: parent
                    text: "Data Saved"
                    font.pixelSize: 14
                    color: Universal.background
                }
            }
        }
    }

    Timer{
        id: closeTimer
        interval: 3000; running: false; onTriggered: notifyPopup.close()
    }
}
