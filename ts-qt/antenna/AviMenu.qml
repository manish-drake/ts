import QtQuick 2.5
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
                spacing: 0
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Layout.bottomMargin: 12
                    Text {
                        anchors.centerIn: parent
                        text: "OPTIONS"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Rectangle{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: 55
                        color: closeMouseArea.pressed ? "#80aaaaaa" : "transparent"
                        Image{
                            id: closeImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                            asynchronous: true
                        }
                        MouseArea {
                            id: closeMouseArea
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked: menuPopup.close()
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Image{
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                source: "qrc:/img/img/Past-white.png"
                                asynchronous: true
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
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
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
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Image{
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                source: "qrc:/img/img/Download-white.png"
                                asynchronous: true
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
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
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
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Image{
                                Layout.leftMargin: 26
                                Layout.alignment: Qt.AlignVCenter
                                source: "qrc:/img/img/exit.png"
                                asynchronous: true
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
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            navigationModel.currentView = navigationModel.getTargetView(
                                        "back",
                                        {
                                            "title": navigationModel.navigationParameter.title,
                                            "isHome": navigationModel.navigationParameter.isHome
                                        })
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
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Image{
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                source: testModel.isFavourite(navigationModel.navigationParameter.id) ? "qrc:/img/img/Star Filled.png" : "qrc:/img/img/star-white.png"
                                asynchronous: true
                            }
                            Text{
                                Layout.leftMargin: 10
                                Layout.alignment: Qt.AlignVCenter
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                text: testModel.isFavourite(navigationModel.navigationParameter.id) ?
                                          "REMOVE FROM HOMEPAGE" : "ADD TO HOMEPAGE"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: "white"
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            testModel.setFavourite(
                                        navigationModel.navigationParameter.id,
                                        !testModel.isFavourite(navigationModel.navigationParameter.id));
                            menuPopup.close()
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Layout.bottomMargin: 15
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Image{
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                source: "qrc:/img/img/brightness.png"
                                asynchronous: true
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
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
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

