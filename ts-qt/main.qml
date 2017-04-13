import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 2.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "."

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

            Item {
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                Popup {
                    id: sideMenu
                    width: parent.width
                    height: parent.height
                    modal: true
                    focus: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                    padding: 0
                    ListView {
                        id: listViewLeftMenu
                        anchors.fill: parent
                        model: sectionModel
                        clip:true
                        focus: true
                        delegate:  Component {
                            Item{
                                height: 50
                                width: parent.width
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    padding:10
                                    text: name
                                    font.weight: Font.DemiBold
                                    font.pointSize: 12
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        navigationModel.currentView = navigationModel.getTargetView("_section", id)
                                        listViewLeftMenu.currentIndex = index
                                        sideMenu.close()
                                    }
                                }
                            }
                        }

                        highlight: Rectangle {
                            color: '#0d000000'
                        }
                    }
                    onClosed: parent.width = 0
                    onOpened: parent.width = 180
                }
            }

            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                Popup {
                    id: configPanel
                    padding: 0
                    topMargin: 55
                    modal: true
                    focus: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                    onClosed: parent.width = 0
                    onOpened: parent.width = 270;
                    contentItem: ConfigPanel{}
                }
            }

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
                    onClosed: parent.width = 0
                    onOpened: parent.width = 160;
                    contentItem: MoreOptions{}
                }
            }
        }


        footer: Footer{}
    }
}


