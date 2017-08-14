import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    Page {
        id: item1
        anchors.fill: parent
        header: AviHeaderContent{
            detailTitle: "VSWR"
        }
        
        contentItem: Rectangle {
            color: Universal.theme === Universal.Light ? Universal.background : "#414048"
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 15
                boundsBehavior: Flickable.StopAtBounds
                clip: true
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
                        AviModeCtrl{ mode: "VSWR" }
                        AviCommonCtrls{
                            id: commonCtrls
                            function onRun(){
                                console.log("onRun")
                            }
                            function onPause(){
                                console.log("onPause")
                            }
                            function onContinue(){
                                console.log("onContinue")
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
        contentItem: AviModeSelection{ selectedIndex: 0 }
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
}
