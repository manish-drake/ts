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
                detailTitle: "CABLE LOSS"
            }

            contentItem: Rectangle {
                color: Universal.background
                Flickable {
                    anchors.left:parent.left
                    anchors.right:parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    contentWidth: parent.width;
                    contentHeight: content.height + content.y + 10
                    clip: true
                    boundsBehavior: Flickable.StopAtBounds
                    Column{
                        id: content
                        y: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        spacing: 30

                        AviChartCtrl{
                            id: chartCtrl
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
                                currentModeIndex: 2
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
                                    font.pointSize: 10
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

    Rectangle{
        id: savedDataDialog
        anchors.fill: parent
        color: Universal.theme == Universal.Light ? "#80000000" : "#80ffffff"
        visible: false
        Item{
            anchors.fill: parent
            anchors.margins: 20
            Popup {
                id: savedDataPopup
                width: parent.width
                height: parent.height
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape
                padding: 0
                onClosed: {savedDataDialog.visible = false }
                onOpened: {savedDataDialog.visible = true }
                contentItem: DataPopupContent{}
            }
        }
    }
}
