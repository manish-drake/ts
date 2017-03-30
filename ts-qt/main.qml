import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 480
    height: 800
    title: qsTr("TS")

    Page {
        anchors.fill: parent
        header: Header{}

        contentItem: Rectangle {
            id:contentRect
            color: "#55FFFF00"
            Rectangle {
                id: popupContainer
                width: 0
                height: 10 * 50
                Popup {
                    id: popup
                    width: parent.width

                    height: 10 * 50
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
                                    padding:5
                                    text: name
                                    font.bold: true
                                    font.pointSize: 12
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        navigationModel.currentView = navigationModel.getTargetView("_section", id)
                                        listViewLeftMenu.currentIndex = index
                                        popup.close()
                                    }
                                }
                            }
                        }

                        highlight: Rectangle {
                            color: '#e6e6e6'
                        }
                    }
                    onClosed: parent.width = 0
                    onOpened: parent.width = 180
                }
            }

            Loader {
                anchors.fill: parent
                source: registry.getPageFromViewId(navigationModel.currentView)
            }

            Rectangle {
                anchors.horizontalCenter:parent.horizontalCenter
                id: popupContainerCenter
                width: 0
                height: 424
                Popup {
                    id: popupCenter
                    width: parent.width
                    height: 424
                    modal: true
                    focus: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                    padding: 0

                    CenterMenu{}

                    onClosed: parent.width = 0
                    onOpened: parent.width = 270;
                }
            }
            TestDetail{
                anchors.fill:parent
            }
        }

        footer: Footer{}
    }
}
