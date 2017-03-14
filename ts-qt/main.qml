import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
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
        }
        contentItem: StackView{

            id: svContent
            initialItem: Rectangle{
                color: "#136be6"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("Content comes here!")
                }
                ListView {
                    id: sections
                    model: sectionModel
                    spacing: 2
                    width: parent.width/5
                    height: parent.height
                    anchors.left: parent.left

                    delegate: Rectangle {
                        width: parent.width
                        height: 15
                        color: "#e5e5f7"

                        Text {
                            text: name
                            font.pointSize: 10
                            color:"gray"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
        footer: Rectangle{
            width: parent.width
            height: parent.height/10
            color: "#86f50e"
            anchors.bottom: parent.bottom
            Text {
                id: txtFooter
                text: qsTr("Footer")
            }
        }
    }
}
