import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    Page {
        id: item1
        anchors.fill: parent

        header: AviHeader{title: "CABLE LOSS"}

        contentItem: Rectangle {
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
            Flickable {
                anchors.fill: parent
                contentWidth: width;
                contentHeight: content.height + content.y + 15
                boundsBehavior: Flickable.StopAtBounds
                Column{
                    id: content
                    y: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    spacing: 30
                    AviGraphCtrl{
                        id: graphCtrl
                        refData: snapshotModel.refData
                    }
                    GridLayout {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        columns: 2
                        columnSpacing: 15
                        rowSpacing: 20
                        AviMarkerActionsCtrl{}
                        AviBandCtrl{}
                        AviModeCtrl{ mode: "LOSS" }
                        AviCommonCtrls{
                            id: commonCtrls
                            function onRun(){
                                console.log("onRun")
                                footer.testStatus = "in progress";
                                testRunTimer.running = true;
                            }
                            function onPause(){
                                console.log("onPause")
                                footer.testStatus = "stopped";
                                testRunTimer.stop();
                            }
                            function onContinue(){
                                console.log("onContinue")
                                footer.testStatus = "in progress";
                                testRunTimer.start();
                            }
                            Timer{
                                id: testRunTimer
                                interval: 1000
                                repeat: true
                                property int dur
                                onTriggered:{
                                    footer.testRunTime = dur.toString() + " s"
                                    dur = dur + 1
                                }
                            }
                        }
                    }
                    ColumnLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Repeater{
                            model: markersModel
                            Item{
                                anchors.left: parent.left
                                anchors.right: parent.right
                                height: 20
                                Text{
                                    anchors.verticalCenter: parent.verticalCenter
                                    color: Universal.foreground
                                    font.pixelSize: 12
                                    font.family: robotoRegular.name
                                    text: "M" + num + "  " + _val
                                    font.bold: graphCtrl.selectedMarkerIndex == index
                                    opacity: graphCtrl.selectedMarkerIndex == index ? 1 : 0.8
                                    MouseArea{
                                        anchors.fill: parent
                                        onPressed: parent.opacity = 0.5
                                        onReleased: parent.opacity = 1
                                        onClicked: graphCtrl.selectedMarkerIndex = index
                                    }
                                }
                            }
                        }
                    }
                    ListModel{
                        id: markersModel
                        ListElement{num: 1; _val: 0}
                    }
                }
            }
        }
    }

    Popup {
        id: modeSelectionPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: AviModeSelection{ selectedIndex: 1}
    }

    Popup {
        id: savedDataPopup
        width: parent.width
        height: parent.height
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 20
        background: Rectangle{
            color: "#b3000000"
        }
        contentItem: AviHistory{}
    }
    Popup {
        id: calPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: AviCalibration{ mode: "VSWR/CL" }
    }
    Popup {
        id: bandSelectionPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: AviBandSelection{id: bandSelection}
    }

    Popup {
        id: menuPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: AviMenu{detailTitle: "CABLE LOSS"}
    }

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
            background: Item{}
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
