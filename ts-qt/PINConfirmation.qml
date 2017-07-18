import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Item {
    Page{
        anchors.centerIn: parent
        height: 150
        width: 250
        header: Rectangle{
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.background
            Text{
                anchors.centerIn: parent
                text:"PIN"
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
                text: pin
                font.pixelSize: 28
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
                text: "CANCEL"
                font.pixelSize: 14
                font.family: robotoRegular.name
                color: "gray"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        pinaccepttimer.running = false
                        pinConfirmPopup.close()
                    }
                }
            }
        }
    }
}


