import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    Page{
        anchors.centerIn: parent
        height: 150
        width: 350
        header: Rectangle{
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.background
            Text{
                anchors.centerIn: parent
                text:"Connection Request"
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
                text:"A remote device requested to connect"
                font.pixelSize: 14
                color: "gray"
            }
        }

        footer:Rectangle{
            height: 40
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.background
            GridLayout{
                anchors.fill: parent
                Item{
                    Layout.column: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Text{
                        anchors.centerIn: parent
                        text: "REJECT"
                        font.pixelSize: 14
                        color: "gray"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: connectionReqPopup.close()
                        }
                    }
                }
                 Item{
                    Layout.column: 1
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Text{
                        anchors.centerIn: parent
                        text: "ACCEPT"
                        font.pixelSize: 14
                        color: Universal.accent
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                connectionReqPopup.close();
                                pinConfirmPopup.open();
                                pinaccepttimer.running = true
                            }
                        }
                    }
                }
            }
        }
    }
}

