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
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    source: "qrc:/img/img/Settings-25.png"
                }
                Column{
                    topPadding: 20
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        id: title
                        text: "ADS-B Velocity Test"
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                    Text {
                        text: "SETUP"
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        anchors.topMargin: 30
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
                            onClicked: testSetupPopup.close()
                        }
                    }
                }
            }
        }
    }

