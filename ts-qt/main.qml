import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width:480
    height: 800
    title: qsTr("TS")

    Page {
        anchors.fill: parent
        header: Header{}

        contentItem: Rectangle {
            color: "yellow"
            Rectangle {
                id: popupContainer
                width: 0
                height: parent.height
                Popup {
                    id: popup
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    modal: true
                    focus: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                    ListView {
                        anchors.fill: parent
                        model: sectionModel
                        delegate:  Rectangle {
                            height: 60
                            width: parent.width
                            color: "red"
                            Text {
                                anchors.fill: parent
                                text: name
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    popup.close()
                                    navigationModel.currentView = navigationModel.getTargetView("_section", id)
                                }
                            }
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
        }

        footer: Footer{}
    }
}
