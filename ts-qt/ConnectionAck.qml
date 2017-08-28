import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Item{
    Rectangle {
        anchors.centerIn: parent
        height: 150
        width: 350
        radius: 4
        color: Universal.background
        Page{
            anchors.fill: parent
            anchors.margins: 5
            header: Rectangle{
                height: 60
                anchors.left: parent.left
                anchors.right: parent.right
                color: Universal.background
                Text{
                    anchors.centerIn: parent
                    text:"Device Paired"
                    font.pixelSize: 18
                    font.family: robotoRegular.name
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
                    font.family: robotoRegular.name
                    color: "gray"
                }
            }

            footer:Rectangle{
                height: 40
                anchors.left: parent.left
                anchors.right: parent.right
                color: Universal.background
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    text: "OK"
                    font.pixelSize: 14
                    font.family: robotoRegular.name
                    color: "gray"
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: connectionAckPopup.close()
                    }
                }
            }
        }
    }
}

