import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 480
    height: 800
    title: qsTr("TS")

    Page {
        anchors.fill: parent
        header: Rectangle{
            width: parent.width
            height: parent.height/10
            border.color: "#f1400a"
            color: "#86f50e"
            anchors.top: parent.top
            Text {
                id: txtHeader
                text: qsTr("Header")
            }

            Rectangle{
                height: 30
                width: 30
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                color:"red"
            }


            Rectangle{
                height: 30
                width: 30
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color:"red"
            }
        }
        contentItem: Rectangle{
            id:contentRect
            color: "#136be6"
            ListView {
                visible: !false
                id: hbMenu
                model: sectionModel
                spacing:0
                width: parent.width/5
                height: parent.height
                anchors.left: parent.left

                delegate: Rectangle {
                    border.color: "lightgray"
                    border.width: 1
                    width:  contentRect.width/4
                    height: contentRect.height/10
                    color: "#e5e5f7"

                    Rectangle{
                        id:imageRect
                        height:15
                        width:15
                        color:"blue"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left:parent.left
                        anchors.leftMargin: 3
                    }

                    Text {
                        anchors.leftMargin: 20
                        text: name
                        font.pointSize: 10
                        color:"gray"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left:parent.left
                    }
                    Text {
                        id: tvid
                        text: targetViewId
                    }
                    MouseArea{
                        anchors.fill:parent
                        z:1
                        onClicked: {
                            navigationModel.currentView = navigationModel.getViewName(targetViewId)
                        }
                    }
                }
            }
            Loader {
                id: content
                anchors.fill: parent
                source: "%1.qml".arg(navigationModel.currentView)
            }
        }
        footer: Rectangle{
            width: parent.width
            height: parent.height/10
            color: "#86f50e"
            anchors.bottom: parent.bottom
            Rectangle{
                height: 30
                width: 30
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                color:"red"
            }

            Rectangle{
                height: 30
                width: 30
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color:"red"
            }
            Text {
                id: txtFooter
                text: qsTr("Footer")
            }
            ButtonSamples{
                visible: !true
            }
            NetworkInfo{
 visible: !true
            }
        }
    }
}
