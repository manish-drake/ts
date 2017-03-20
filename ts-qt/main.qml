import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 800
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
            CenterMenu{
                visible: true
                anchors.horizontalCenter: parent.horizontalCenter
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
                ListView {
                    visible: !false
                    id: userSettings
                    model: sectionModel
                    spacing:0
                    width: parent.width/5
                    height: parent.height
                    anchors.right: parent.right

                    delegate: Rectangle {

                        width: parent.width
                        height: 22
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

                        MouseArea{
                            anchors.fill:parent
                            z:1
                            onClicked: {
                                //  userSettings.currentIndex = index
                            }
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
