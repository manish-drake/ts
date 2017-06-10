import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import QtQuick.Controls.Universal 2.1

ApplicationWindow {
    id: appWindow
    visible: true
    width: 480
    height: 800
    title: qsTr("TS")
    property string headerTitle: "Start"
    property var _theme: Universal.Light
    Universal.theme: _theme
    Page {
        anchors.fill: parent

        header: Header{id: header}

        contentItem: Rectangle {
            id:contentRect
            color: Universal.theme == Universal.Dark ? "#444444" : "#f4f4f4"
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
                 Item{
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
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
                 Item{
                    anchors.horizontalCenter: parent.horizontalCenter
                    Popup {
                        id: configPanelPopup
                        padding: 0
                        topMargin: 55
                        modal: true
                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                        onClosed: { parent.width = 0; configPanelDialog.visible = false }
                        onOpened: { parent.width = 270; configPanelDialog.visible = true }
                        contentItem: ConfigPanel{
                            id: configPanel
                        }
                    }
                }
            }

            Rectangle{
                id: moreActionsDialog
                anchors.fill: parent
                color: "#0d000000"
                visible: false
                 Item{
                    anchors.right: parent.right
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

        footer: Footer{
            currentOperator: configPanel.currentOperator
        }
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

    Rectangle{
        id: connectionReqDialog
        anchors.fill: parent
        color: "#33000000"
        visible: false
        Item{
            anchors.centerIn: parent
            height: 150
            width: 350
            Popup {
                id: connectionReqPopup
                height: parent.height
                width: parent.width
                padding: 0
                modal: true
                focus: true
                clip: true
                closePolicy: Popup.CloseOnEscape
                onClosed: {connectionReqDialog.visible = false }
                onOpened: {connectionReqDialog.visible = true }
                contentItem: ConnectionReqest{}
            }
        }
    }

    Rectangle{
        id: pinConfirmDialog
        anchors.fill: parent
        color: "#33000000"
        visible: false
        Item{
            anchors.centerIn: parent
            height: 150
            width: 250
            Popup {
                id: pinConfirmPopup
                height: parent.height
                width: parent.width
                padding: 0
                modal: true
                focus: true
                clip: true
                closePolicy: Popup.CloseOnEscape
                onClosed: {pinConfirmDialog.visible = false }
                onOpened: {pinConfirmDialog.visible = true }
                contentItem: PINConfirmation{}
            }
        }
    }

    Timer{
        id:  pinaccepttimer
        interval: 3000
        onTriggered:{
            pinConfirmPopup.close()
            connectionAckPopup.open()
        }
    }

    Rectangle{
        id: connectionAckDialog
        anchors.fill: parent
        color: "#33000000"
        visible: false
        Item{
            anchors.centerIn: parent
            height: 150
            width: 320
            Popup {
                id: connectionAckPopup
                height: parent.height
                width: parent.width
                padding: 0
                modal: true
                focus: true
                clip: true
                closePolicy: Popup.CloseOnEscape
                onClosed: {connectionAckDialog.visible = false }
                onOpened: {connectionAckDialog.visible = true }
                contentItem: ConnectionAck{}
            }
        }
    }

}


