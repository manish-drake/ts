import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
     Item{
        anchors.fill: parent
        Page{
            anchors.fill: parent
            header: Rectangle{
                height: 60
                width: parent.width
                color: Universal.background
                Text{
                    anchors.centerIn: parent
                    text:"PIN"
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
                    text: {
                        var pin = "";
                        var possible = "0123456789";
                        for( var i=0; i < 4; i++ )
                            pin += possible.charAt(Math.floor(Math.random() * possible.length));
                        return pin;
                    }
                    font.pixelSize: 28
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
                    text: "CANCEL"
                    font.pixelSize: 14
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
}
