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
    property color opaqueBackground: Universal.theme == Universal.Light ? "#1a000000" : "#1affffff"
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
                id: contentOpaqueBack
                anchors.fill: parent
                color: opaqueBackground
                visible: false
            }

            Popup {
                id: sideMenuPopup
                width: 200
                implicitWidth: 200
                height: parent.height
                modal: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
                padding: 0
                onClosed: contentOpaqueBack.visible = false
                onOpened: contentOpaqueBack.visible = true
                contentItem: SideMenu{}
            }

            Item{
                width: 270
                anchors.horizontalCenter: parent.horizontalCenter
                Popup {
                    id: configPanelPopup
                    padding: 0
                    topMargin: 55
                    width: 270
                    modal: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
                    onClosed: contentOpaqueBack.visible = false
                    onOpened: contentOpaqueBack.visible = true
                    contentItem: ConfigPanel{
                        id: configPanel
                    }
                }
            }
            Item{
                anchors.right: parent.right
                Popup {
                    id: moreActionsPopover
                    width: 160
                    padding: 0
                    topMargin: 55
                    rightMargin: 5
                    modal: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                    onClosed: contentOpaqueBack.visible = false
                    onOpened: contentOpaqueBack.visible = true
                    contentItem: MoreActions{}
                }
            }
        }

        footer: Footer{
            currentOperator: configPanel.currentOperator
        }
    }

    Popup {
        id: testSetupPopup
        height: parent.height
        width: parent.width
        topPadding: 60
        bottomPadding: 60
        leftPadding: 30
        rightPadding: 30
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: opaqueBackground
        }
        contentItem: TestSetup{}
    }

    Popup {
        id: helpPopup
        height: parent.height
        width: parent.width
        topPadding: 60
        bottomPadding: 60
        leftPadding: 30
        rightPadding: 30
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: opaqueBackground
        }
        contentItem: TestHelp{}
    }

    Popup {
        id: connectionReqPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: opaqueBackground
        }
        contentItem: ConnectionReqest{}
    }

    Popup {
        id: pinConfirmPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: opaqueBackground
        }
        contentItem: PINConfirmation{}
    }

    Timer{
        id:  pinaccepttimer
        interval: 3000
        onTriggered:{
            pinConfirmPopup.close()
            connectionAckPopup.open()
        }
    }

    Popup {
        id: connectionAckPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: opaqueBackground
        }
        contentItem: ConnectionAck{}
    }

}


