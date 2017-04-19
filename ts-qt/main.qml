import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import QtQuick.Controls.Universal 2.0

ApplicationWindow {
    visible: true
    width: 480
    height: 700
    title: qsTr("TS")
    Universal.theme: Universal.Dark
    Universal.accent: Universal.Red
    property string headerTitle: "Start"

    Page {
        anchors.fill: parent

        header: Header{id: header}

        contentItem: Rectangle {
            id:contentRect
            color: "#f4f4f4"

            Loader {
                id:contentLoader
                anchors.fill: parent
                source: registry.getPageFromViewId(navigationModel.currentView)
                onLoaded: console.log("loading: %1".arg(registry.getPageFromViewId(navigationModel.currentView)))
            }

            Rectangle{
                id: sideMenuDialog
                anchors.fill: parent
                color: "#0d000000"
                visible: false
                Rectangle {
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Popup {
                        id: sideMenuPopup
                        width: parent.width
                        height: parent.height
                        modal: true
                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                        padding: 0
                        onClosed: { parent.width = 0; sideMenuDialog.visible = false }
                        onOpened: { parent.width = 180; sideMenuDialog.visible = true }
                        contentItem: SideMenu{}
                    }
                }
            }

            Rectangle{
                id: configPanelDialog
                anchors.fill: parent
                color: "#0d000000"
                visible: false
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "transparent"
                    Popup {
                        id: configPanelPopup
                        padding: 0
                        topMargin: 55
                        modal: true
                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                        onClosed: { parent.width = 0; configPanelDialog.visible = false }
                        onOpened: { parent.width = 270; configPanelDialog.visible = true }
                        contentItem: ConfigPanel{}
                    }
                }
            }

            Rectangle{
                id: moreActionsDialog
                anchors.fill: parent
                color: "#0d000000"
                visible: false
                Rectangle{
                    anchors.right: parent.right
                    color: "transparent"
                    Popup {
                        id: moreActionsPopover
                        width: parent.width
                        padding: 0
                        topMargin: 55
                        rightMargin: 5
                        modal: true
                        focus: true
                        clip: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                        onClosed: {parent.width = 0; moreActionsDialog.visible = false }
                        onOpened: {parent.width = 160; moreActionsDialog.visible = true }
                        contentItem: MoreActions{}
                    }
                }
            }


        }


        footer: Footer{}
    }

    Rectangle{
        id: testSetupDialog
        anchors.fill: parent
        color: "#33000000"
        visible: false
        Item{
            anchors.fill: parent
            anchors.topMargin: 70
            anchors.bottomMargin: 70
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            Popup {
                id: testSetupPopup
                height: parent.height
                width: parent.width
                padding: 0
                modal: true
                focus: true
                clip: true
                closePolicy: Popup.CloseOnEscape
                onClosed: {testSetupDialog.visible = false }
                onOpened: {testSetupDialog.visible = true }
                contentItem: TestSetup{}
            }
        }
    }

    Rectangle{
        id: helpDialog
        anchors.fill: parent
        color: "#33000000"
        visible: false
        Item{
            anchors.fill: parent
            anchors.topMargin: 70
            anchors.bottomMargin: 70
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            Popup {
                id: helpPopup
                height: parent.height
                width: parent.width
                padding: 0
                modal: true
                focus: true
                clip: true
                closePolicy: Popup.CloseOnEscape
                onClosed: {helpDialog.visible = false }
                onOpened: {helpDialog.visible = true }
                contentItem: TestHelp{}
            }
        }
    }
}


