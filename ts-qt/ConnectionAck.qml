import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
        Page{
            anchors.fill: parent
            header: Rectangle{
                height: 60
                width: parent.width
                color: Universal.background
                Text{
                    anchors.centerIn: parent
                    text:"Device Paired"
                    font.pixelSize: 18
                    font.weight: Font.bold
                    color: Universal.foreground
                }
            }
            contentItem:
                Rectangle{
                anchors.fill: parent
                color: Universal.background
                Text{
                    anchors.centerIn: parent
                    text: "Remote device connected"
                    font.pixelSize: 16
                    color: "gray"
                }
            }

            footer:Rectangle{
                height: 40
                width: parent.width
                color: Universal.background
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    text: "OK"
                    font.pixelSize: 14
                    color: "gray"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            connectionAckPopup.close()
                        }
                    }
                }
            }
        }
    }

