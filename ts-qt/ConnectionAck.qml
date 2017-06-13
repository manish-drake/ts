import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    Page{
        anchors.centerIn: parent
        height: 150
        width: 320
        header: Rectangle{
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.background
            Text{
                anchors.centerIn: parent
                text:"Device Paired"
                font.pixelSize: 18
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
            anchors.left: parent.left
            anchors.right: parent.right
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

