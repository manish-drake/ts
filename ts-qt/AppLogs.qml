import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Rectangle{
    anchors.fill: parent
    anchors.margins: 10
    color: Universal.background
    border.color: "#0d000000"
    border.width: 1
    radius: 3
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 1.1
        verticalOffset: 1.1
        radius: 4.0
        color: "#26000000"
        spread: 0
    }

    Page {
        id: item1
        anchors.fill: parent
        header: Rectangle{
            height: 40
            anchors.left:parent.left
            anchors.right:parent.right
            color: Universal.background
            Text {
                id: testTitle
                anchors.centerIn: parent
                text: qsTr("App Logs")
                font.pointSize: 12
                font.weight: Font.DemiBold
                color: Universal.foreground
            }

            Item{
                width: 40
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Image {
                    id: closeImage
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Delete-25.png"
                }
                ColorOverlay{
                    anchors.fill: closeImage
                    source: closeImage
                    color: Universal.foreground
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                }
            }
        }

        contentItem: Rectangle {
            color: Universal.background
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true

            }
        }
    }
}
