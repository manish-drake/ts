import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.1
import QtQuick.VirtualKeyboard 2.1

ApplicationWindow {
    id: appWindow
    visible: true
    width: 480
    height: 800
    title: "Test Set"
    property string headerTitle: "Home"
    property var _theme: Universal.Light
    Universal.theme: _theme
    Universal.accent: "#34BFCE"
    property string currentUser: "Operator"
    property string currentUserEmail: "operator@mail.com"
    property string deviceName: "MD-15"
    FontLoader { id: robotoRegular; source: "qrc:/fonts/fonts/Roboto-Regular.ttf" }
    FontLoader { id: robotoCondensedRegular; source: "qrc:/fonts/fonts/RobotoCondensed-Regular.ttf" }
    Item {
        id: appContainer
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: inputPanel.top
        Page {
            anchors.fill: parent

            header: Header{
                id: mainheader
                visible: navigationModel.isHeaderAvailable
            }

            contentItem: Rectangle {
                id:contentRect
                color: Universal.theme === Universal.Light ? "#E1E2E3" : "#414048"
                Loader {
                    id:contentLoader
                    anchors.fill: parent
                    source: registry.getPageFromViewId(navigationModel.currentView)
                    onLoaded: {
                        loggingModel.log("loading: %1".arg(registry.getPageFromViewId(navigationModel.currentView)));
                        console.log("loading: %1".arg(registry.getPageFromViewId(navigationModel.currentView)))
                    }
                }

                Rectangle{
                    id: contentOpaqueBack
                    anchors.fill: parent
                    color: Universal.theme === Universal.Light ? "#66000000" : "#66ffffff"
                    visible: false
                }
                Popup {
                    id: menuPopup
                    height: parent.height
                    width: parent.width
                    modal: true
                    closePolicy: Popup.CloseOnEscape
                    padding: 30
                    background: Rectangle{
                        color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
                    }
                    contentItem: ActionsMenu{}
                }

                Popup {
                    id: displayOptionsPopup
                    height: parent.height
                    width: parent.width
                    modal: true
                    padding: 0
                    closePolicy: Popup.CloseOnEscape
                    background: Rectangle{
                        color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
                    }
                    contentItem: DisplayOptions{}
                }
            }

            footer: Footer{
                id: footer
                visible: Qt.inputMethod.visible ? false : true
            }
        }

//        Drawer {
//            id: sideMenuDrawer
//            width: parent.width * 0.66
//            height: parent.height - footer.height
//            dragMargin: 0
//            background: Rectangle {
//                color: Universal.foreground
//                opacity: 0.1
//            }
//            contentItem: SideMenu{id: sideMenu}
//        }

        Popup {
            id: sideMenuDrawer
            width: parent.width * 0.66
            height: parent.height - footer.height
            modal: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
            padding: 0
            contentItem: SideMenu{id: sideMenu}
        }

        Popup {
            id: connectionReqPopup
            height: parent.height
            width: parent.width
            modal: true
            closePolicy: Popup.CloseOnEscape
            background: Rectangle{
                color: Universal.theme === Universal.Light ? "#66000000" : "#66ffffff"
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
                color: Universal.theme === Universal.Light ? "#66000000" : "#66ffffff"
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
                color: Universal.theme === Universal.Light ? "#66000000" : "#66ffffff"
            }
            contentItem: ConnectionAck{}
        }

        Popup {
            id: connectionLostPopup
            height: parent.height
            width: parent.width
            modal: true
            closePolicy: Popup.CloseOnEscape
            background: Rectangle{
                color: Universal.theme === Universal.Light ? "#66000000" : "#66ffffff"
            }
            contentItem: ConnectionLost{}
        }
    }
    InputPanel {
        id: inputPanel
        y: Qt.inputMethod.visible ? parent.height - inputPanel.height : parent.height
        anchors.left: parent.left
        anchors.right: parent.right
    }
}

