import QtQuick 2.0
import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
//import QtGraphicalEffects 1.0

Rectangle{
    anchors.left: parent.left
    anchors.right: parent.right
    color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
    radius: 4
    Column{
        id: columnLayout
        anchors.left: parent.left
        anchors.right: parent.right
        CustomSwitchDelegate{
            text: Universal.theme == Universal.Light ? "INDOOR" : "OUTDOOR"
            source: "qrc:/img/img/Sun Filled-25.png"
            isChecked: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(Universal.theme == Universal.Light) {
                        _theme = Universal.Dark
                    }
                    else {_theme = Universal.Light}
                    moreActionsPopover.close()
                }
            }
        }
        CustomSwitchDelegate{
            text: "SETUP TEST"
            source: "qrc:/img/img/Settings-black.png"
            isChecked: true
            MouseArea{
                anchors.fill: parent
                onClicked: { moreActionsPopover.close(); testSetupPopup.open()}
            }
        }
        CustomSwitchDelegate{
            text: "HELP"
            source: "qrc:/img/img/Help Filled-25.png"
            isChecked: true
            MouseArea{
                anchors.fill: parent
                onClicked: { moreActionsPopover.close(); helpPopup.open() }
            }
        }
        CustomSwitchDelegate{
            text: "CLEAR"
            source: "qrc:/img/img/Minus-30.png"
            isChecked: true
        }
        CustomSwitchDelegate{
            text: "DUAL PANEL"
            source: "qrc:/img/img/Nintendo DS-25.png"
            isChecked: true
        }
        CustomSwitchDelegate{
            text: "FILTER"
            source: "qrc:/img/img/filter-results-button.png"
            isChecked: true
        }
        CustomSwitchDelegate{
            text: "RUN ALL"
            source: "qrc:/img/img/Running-25.png"
        }
        CustomSwitchDelegate{
            text: "REPEAT"
            source: "qrc:/img/img/Repeat-25.png"
        }
        CustomSwitchDelegate{
            text: "LOG DATA"
            source: "qrc:/img/img/Upload to the Cloud-25.png"
            isChecked: true
        }
        CustomSwitchDelegate{
            text: "HOME"
            source: "qrc:/img/img/star-filled.png"
        }
        CustomSwitchDelegate{
            text: "GUIDE"
            source: "qrc:/img/img/Info-24.png"
        }
        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10
            height: 30
            Item{
                Layout.fillWidth: true
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                Row{
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    spacing: 5
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        width: 20
                        Image{
                            id: imageAttach
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/img/img/Attach-18.png"
                        }
//                        ColorOverlay{
//                            anchors.fill: imageAttach
//                            source: imageAttach
//                            color: Universal.foreground
//                        }
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "App Logs"
                        font.pixelSize: 12
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        moreActionsPopover.close()
                        navigationModel.currentView = navigationModel.getTargetView("App-Logs")
                    }
                }
            }
            Text{
                Layout.column: 1
                text: "Version 0.0.01"
                font.pixelSize: 12
                color: Universal.foreground
                opacity: 0.7
                font.family: robotoRegular.name
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        moreActionsPopover.close();
                        connectionReqPopup.open()
                    }
                }
            }
        }
    }
}

