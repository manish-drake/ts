import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0
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
                        refData: snapshotModel.refData
                    }
                    GridLayout {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        columns: 2
                        columnSpacing: 15
                        rowSpacing: 20
                        AviMarkerActionsCtrl{}
                        AviBandCtrl{
                            id: bandCtrl
                        }
                        AviModeCtrl{
                            currentModeIndex: 0
                        }
                        ColumnLayout{
                            Layout.row: 2
                            Layout.fillWidth: true
                            spacing: 2
                            Repeater{
                                model: markersModel
                                Rectangle{
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    height: 20
                                    color: "#0d000000"
                                    Text{
                                        anchors.left: parent.left
                                        anchors.leftMargin: 10
                                        anchors.verticalCenter: parent.verticalCenter
                                        color: Universal.foreground
                                        font.pixelSize: 12
                                        font.family: robotoRegular.name
                                        text: "M" + num + "  " + _val
                                        font.bold: chartCtrl.selectedMarkerIndex == index
                                        opacity: chartCtrl.selectedMarkerIndex == index ? 1 : 0.8
                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: chartCtrl.selectedMarkerIndex = index
                                        }
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
        topPadding: 60
        bottomPadding: 60
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: "#99000000"
        }
        contentItem: AviationCal{ mode: "VSWR/CL" }
    }

}
