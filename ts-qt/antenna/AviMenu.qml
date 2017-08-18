import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property string detailTitle: "VSWR"
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        Rectangle{
            Layout.fillWidth: true
            Layout.maximumWidth: 500
            Layout.alignment: Qt.AlignHCenter
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
            height: content.height
            ColumnLayout{
                id: content
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                spacing: 4
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Layout.bottomMargin: 10
                    Text {
                        anchors.centerIn: parent
                        text: "OPTIONS"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        width: 35
                        Image {
                            id: closeImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: menuPopup.close()
                        }
                    }
                }
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: pastImg.height
                            width: pastImg.width
                            Layout.leftMargin: 30
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: pastImg
                                source: "qrc:/img/img/Past-white.png"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "SAVED TEST RESULTS"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked:{
                            menuPopup.close()
                            savedDataPopup.open();
                        }
                    }
                }
                Rectangle{
                    Layout.margins: 5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 60
                    height: 1
                    color: Universal.foreground
                    opacity: 0.2
                }
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: saveImg.height
                            width: saveImg.width
                            Layout.leftMargin: 30
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: saveImg
                                source: "qrc:/img/img/Download-white.png"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "SAVE TEST RESULTS"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
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
                                var bandName = bandSelection.bandName
                                snapshotModel.addAviationVswr(datetime, user,data,markerPosition,markerName,range,bandRange,bandName);
                                notifyPopup.open(); closeTimer.running = true;
                                break;
                            case "CABLE LOSS":
                                var bandName2 = bandSelection.bandName
                                snapshotModel.addAviationCl(datetime,user,data,markerPosition,markerName,range,bandRange,bandName2);
                                notifyPopup.open(); closeTimer.running = true;
                                break;
                            case "DISTANCE TO FAULT":
                                var velocity = coaxSelection.selectedCableVelocity
                                var cableType = coaxSelection.selectedCableType
                                snapshotModel.addAviationDtf(datetime,user,data,markerPosition,markerName,range,velocity,cableType);
                                notifyPopup.open(); closeTimer.running = true;
                                break;
                            }
                            menuPopup.close()
                        }
                    }
                }
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: exitImg.height
                            width: exitImg.width
                            Layout.leftMargin: 26
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: exitImg
                                source: "qrc:/img/img/exit.png"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "EXIT TO TEST LANDING PAGE"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked: {
                            navigationModel.currentView = navigationModel.getTargetView(
                                        "back",
                                        {"isHome": navigationModel.navigationParameter.isHome}
                                        )
                        }
                    }
                }
                Rectangle{
                    Layout.margins: 5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 60
                    height: 1
                    color: Universal.foreground
                    opacity: 0.2
                }
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: starImg.height
                            width: starImg.width
                            Layout.leftMargin: 30
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: starImg
                                source: "qrc:/img/img/star-white.png"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "ADD TO HOMEPAGE"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked: {
                            testModel.addToHome(navigationModel.navigationParameter.id);
                            menuPopup.close()
                        }
                    }
                }
                Rectangle{
                    Layout.bottomMargin: 15
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: brighnessImg.height
                            width: brighnessImg.width
                            Layout.leftMargin: 30
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: brighnessImg
                                source: "qrc:/img/img/brightness.png"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "DISPLAY OPTIONS"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked: {
                            menuPopup.close()
                            displayOptionsPopup.open()
                        }
                    }
                }
            }
        }
    }
}

