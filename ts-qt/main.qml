import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1
import QtQuick.VirtualKeyboard 2.1

ApplicationWindow {
    id: appWindow
    visible: true
    width: 480
    height: 800
    title: qsTr("TS")
    property string headerTitle: "Test Set"
    property var _theme: Universal.Light
    Universal.theme: _theme
    Universal.accent: "#00AEEF"
    property color opaqueBackground: Universal.theme == Universal.Light ? "#66000000" : "#66ffffff"
    property string pin;
    property string currentUser: "Operator"
    property string currentUserEmail: "operator@mail.com"
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

            header: Header{id: _header}

            contentItem: Rectangle {
                id:contentRect
                color: Universal.theme == Universal.Light ? "#E7E8E8" : "#414048"
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

//                Item{
//                    width: 320
//                    anchors.top: parent.top
//                    anchors.topMargin: 5
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    Popup {
//                        id: configPanelPopup
//                        width: parent.width
//                        padding: 0
//                        modal: true
//                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
//                        onClosed: contentOpaqueBack.visible = false
//                        onOpened: contentOpaqueBack.visible = true
//                        contentItem: ConfigPanel{
//                            id: configPanel
//                        }
//                    }
//                }
                Item{
                    anchors.right: parent.right
                    Layout.maximumHeight: parent.height
                    Popup {
                        id: moreActionsPopover
                        width: 220
                        Layout.maximumHeight: contentRect.height - 50
                        padding: 0
                        topMargin: 55
                        rightMargin: 5
                        modal: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                        onClosed: contentOpaqueBack.visible = false
                        onOpened: contentOpaqueBack.visible = true
                        background: Item{}
                        contentItem: MoreActions{}
                    }
                }
            }

            footer: Footer{
                id: footer
                visible: Qt.inputMethod.visible ? false : true
            }
        }

        Drawer {
            id: sideMenuDrawer
            width: 270
            height: parent.height - footer.height
            contentItem: SideMenu{}
        }

//        Popup {
//            id: testSetupPopup
//            height: parent.height
//            width: parent.width
//            topPadding: 60
//            bottomPadding: 60
//            leftPadding: 30
//            rightPadding: 30
//            modal: true
//            closePolicy: Popup.CloseOnEscape
//            background: Rectangle{
//                color: opaqueBackground
//            }
//            contentItem: TestSetup{}
//        }

//        Popup {
//            id: helpPopup
//            height: parent.height
//            width: parent.width
//            topPadding: 60
//            bottomPadding: 60
//            leftPadding: 30
//            rightPadding: 30
//            modal: true
//            closePolicy: Popup.CloseOnEscape
//            background: Rectangle{
//                color: opaqueBackground
//            }
//            contentItem: TestHelp{}
//        }

//        Popup {
//            id: connectionReqPopup
//            height: parent.height
//            width: parent.width
//            modal: true
//            closePolicy: Popup.CloseOnEscape
//            background: Rectangle{
//                color: opaqueBackground
//            }
//            contentItem: ConnectionReqest{}
//        }

//        Popup {
//            id: pinConfirmPopup
//            height: parent.height
//            width: parent.width
//            modal: true
//            closePolicy: Popup.CloseOnEscape
//            background: Rectangle{
//                color: opaqueBackground
//            }
//            contentItem: PINConfirmation{}
//        }

//        Timer{
//            id:  pinaccepttimer
//            interval: 3000
//            onTriggered:{
//                pinConfirmPopup.close()
//                connectionAckPopup.open()
//            }
//        }

//        Popup {
//            id: connectionAckPopup
//            height: parent.height
//            width: parent.width
//            modal: true
//            closePolicy: Popup.CloseOnEscape
//            background: Rectangle{
//                color: opaqueBackground
//            }
//            contentItem: ConnectionAck{}
//        }

//        Popup {
//            id: connectionLostPopup
//            height: parent.height
//            width: parent.width
//            modal: true
//            closePolicy: Popup.CloseOnEscape
//            background: Rectangle{
//                color: opaqueBackground
//            }
//            contentItem: ConnectionLost{}
//        }
    }
    InputPanel {
        id: inputPanel
        y: Qt.inputMethod.visible ? parent.height - inputPanel.height : parent.height
        anchors.left: parent.left
        anchors.right: parent.right
    }
}


