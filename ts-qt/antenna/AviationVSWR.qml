import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        border.color: "#0d000000"
        border.width: 1
        radius:5
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#26000000"
            spread: 0
        }
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
                        anchors.margins: 10
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
                            height: 140
                            AviBandCtrl{
                                id: bandCtrl
                            }
                            AviModeCtrl{
                                currentModeIndex: 1
                            }
                            AviMarkerActionsCtrl{}
                            ListModel{
                                id: markersModel
                                ListElement{num: 1; _val: 0}

                            }
                        }
                        Column{
                            Repeater{
                                model: markersModel
                                Text{
                                    color: Universal.foreground
                                    font.pixelSize: 14
                                    text: "M" + num + "  " + _val
                                }
                            }
                        }
                    }
                }
                AviFooterContent{}
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

}
