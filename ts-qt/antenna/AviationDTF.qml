import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    Page {
        id: item1
        anchors.fill: parent
        header: AviHeaderContent{
            detailTitle: "DISTANCE TO FAULT"
        }

        contentItem: Rectangle {
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
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
                        isDTFMode: true
                        markerMinVal: 0
                        markerMaxVal: 15
                        markerStepSize: 0.01
                    }
                    GridLayout {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        columns: 2
                        columnSpacing: 15
                        rowSpacing: 20
                        AviMarkerActionsCtrl{}
                        AviCoaxCtrl{ id: coaxCtrl }
                        AviModeCtrl{
                            currentModeIndex: 2
                        }
                        AviCommonCtrls{}
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
                                    text: graphCtrl.isDTFUnitSwitched ? "M" + num + "  " + _val.toFixed(2) +" Ft" : "M" + num + "  " + _val.toFixed(2) +" m"
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
        id: savedDataPopup
        width: parent.width
        height: parent.height
        padding: 40
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: "#b3000000"
        }
        contentItem: DataPopupContent{}
    }
    Popup {
        id: calPopup
        width: parent.width
        height: parent.height
        leftPadding: 40
        rightPadding: 40
        topPadding: 60
        bottomPadding: 60
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: "#b3000000"
        }
        contentItem: AviationCal{mode: "COAX"}
    }
}
