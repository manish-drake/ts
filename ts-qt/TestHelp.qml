import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {
    Rectangle{
        anchors.fill: parent
        Page{
            anchors.fill: parent
            header: Rectangle{
                id:testHeaderRect
                height: 40
                width: parent.width
                color:"transparent"
                Image {
                    id: viewImage
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Help Filled-25.png"
                }
                Column{
                    topPadding: 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        id: title
                        text: "{{Test Title}}"
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                    Text {
                        text: "HELP"
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                }
            }

            contentItem: {

            }

            footer:Rectangle{
                height: 40
                width: parent.width
                color:"transparent"
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        text: "CLOSE"
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        MouseArea {
                            anchors.fill: parent
                            onClicked: helpPopup.close()
                        }
                    }
                }
            }
        }
    }

