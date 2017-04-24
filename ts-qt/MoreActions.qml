import QtQuick 2.0
import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1


Rectangle{
    width: parent.width
    implicitHeight: columnLayout.implicitHeight
    color: Universal.background
    border.color: "white"
    border.width: 1
    Column{
        id: columnLayout
        width: parent.width
        CustomSwitchDelegate{
            text: "SETUP TEST"
            source: "qrc:/img/img/Settings-25.png"
            MouseArea{
                anchors.fill: parent
                onClicked: { moreActionsPopover.close(); testSetupPopup.open()}
            }
        }
        CustomSwitchDelegate{
            text: "HELP"
            source: "qrc:/img/img/Help Filled-25.png"
            MouseArea{
                anchors.fill: parent
                onClicked: { moreActionsPopover.close(); helpPopup.open() }
            }
        }
        CustomSwitchDelegate{
            text: "CLEAR"
            source: "qrc:/img/img/Minus-30.png"
        }
        CustomSwitchDelegate{
            text: "DUAL PANEL"
            source: "qrc:/img/img/dualpanel.png"
        }
        CustomSwitchDelegate{
            text: "FILTER"
            source: "qrc:/img/img/filter-results-button.png"
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
        }
        CustomSwitchDelegate{
            text: "START"
            source: "qrc:/img/img/Star Filled-20.png"
        }
        CustomSwitchDelegate{
            text: "GUIDE"
            source: "qrc:/img/img/Info-24.png"
        }
        Text{
            text: "Version 0.0.01"
            anchors.right: parent.right
            bottomPadding: 10
            leftPadding: 10
            rightPadding: 10
        }
    }
}

