import QtQuick 2.5
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
                    text:"Connection Request"
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
                    text:"A remote device requested to connect"
                    font.pixelSize: 14
                    font.family: robotoRegular.name
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
                            font.family: robotoRegular.name
                            color: "gray"
                            MouseArea{
                                anchors.fill: parent
                                onPressed: parent.opacity = 0.5
                                onReleased: parent.opacity = 1
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
                            font.family: robotoRegular.name
                            color: Universal.accent
                            MouseArea{
                                anchors.fill: parent
                                onPressed: parent.opacity = 0.5
                                onReleased: parent.opacity = 1
                                onClicked: {
                                    connectionReqPopup.close();
                                    controlNavigationModel.generatePIN(0);
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
}

