import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 480
    height: 700
    title: qsTr("TS")

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
                id: sideMenu
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
                        onClosed: { parent.width = 0; sideMenu.visible = false }
                        onOpened: { parent.width = 180; sideMenu.visible = true }
                        contentItem: SideMenu{}
                    }
                }
            }

            Rectangle{
                id: configPanel
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
                        onClosed: { parent.width = 0; configPanel.visible = false }
                        onOpened: { parent.width = 270; configPanel.visible = true }
                        contentItem: ConfigPanel{}
                    }
                }

            }

            Rectangle{
                id: moreActions
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
                        onClosed: {parent.width = 0; moreActions.visible = false }
                        onOpened: {parent.width = 160; moreActions.visible = true }
                        contentItem: MoreActions{}
                    }
                }
            }
        }


        footer: Footer{}
    }
}


