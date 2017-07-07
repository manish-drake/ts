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
            color: Universal.background
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Column{
                    id: content
                    y: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    spacing: 30

                    AviChartCtrl{
                        id: chartCtrl
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
                        AviCoaxCtrl{}
                        AviModeCtrl{
                            currentModeIndex: 2
                        }
                        ListModel{
                            id: markersModel
                            ListElement{num: 1; _val: 0}

                        }
                    }
                    Column{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Repeater{
                            model: markersModel
                            Text{
                                color: Universal.foreground
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                text: chartCtrl.isDTFUnitSwitched ? "M" + num + "  " + _val.toFixed(2) +" Ft" : "M" + num + "  " + _val.toFixed(2) +" m"
                            }
                        }
                    }
                }
            }
            AviFooterContent{
                isCal: true
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
            color: "#99000000"
        }
        contentItem: DataPopupContent{}
    }
    Popup {
        id: calPopup
        width: parent.width
        height: parent.height
        leftPadding: 40
        rightPadding: 40
        topPadding: 100
        bottomPadding: 100
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: "#99000000"
        }
        contentItem: AviationCal{mode: "COAX"}
    }
}
