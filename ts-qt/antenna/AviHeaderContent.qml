import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Rectangle{
    id:testHeaderRect
    property string detailTitle: "VSWR"
    height: 40
    width: parent.width
    color: Universal.background

    RowLayout{
        visible: chartCtrl.areControlsAvailble
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 5
        Rectangle{
            height:25
            width: 35
            Layout.alignment: Qt.AlignVCenter
            color:"transparent"
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/Download-22.png"
                ColorOverlay{
                    anchors.fill: parent
                    source: parent
                    color: Universal.foreground
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    aviationVswrModel.addSnapshot()
                }
            }
        }
        Rectangle{
            height:25
            width: 35
            Layout.alignment: Qt.AlignVCenter
            color:"transparent"
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/Past-22.png"
                ColorOverlay{
                    anchors.fill: parent
                    source: parent
                    color: Universal.foreground
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: savedDataPopup.open();
            }
        }
    }

    Column{
        topPadding: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: testTitle
            text: detailTitle
            font.pointSize: 12
            font.weight: Font.DemiBold
            anchors.horizontalCenter: parent.horizontalCenter
            color: Universal.foreground
        }
    }

    Rectangle{
        id: rectangle
        height:25
        width: 25
        Layout.fillHeight: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 10
        anchors.right: parent.right
        color:"transparent"
        Image {
            id: closeImage
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
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
