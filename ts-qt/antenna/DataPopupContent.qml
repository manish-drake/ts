import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Item {
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        Page{
            anchors.fill: parent
            header: Rectangle{
                id:testHeaderRect
                height: 50
                width: parent.width
                color: Universal.background
                Image {
                    id: viewImage
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 20
                    source: "qrc:/img/img/View Details-25.png"
                    ColorOverlay{
                        anchors.fill: parent
                        source: parent
                        color: Universal.foreground
                    }
                }
                Text {
                    id: title
                    text: "Saved Data"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
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
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/img/img/Delete-25.png"
                        ColorOverlay{
                            anchors.fill: parent
                            source: parent
                            color: Universal.foreground
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: savedDataPopup.close()
                    }
                }
            }

            contentItem:Rectangle{
                color: Universal.background
                Flickable {
                    width: parent.width;
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    contentWidth: parent.width;
                    contentHeight: content.height + content.y + 10
                    clip: true
                    boundsBehavior: Flickable.StopAtBounds
                    Column{
                        id: content
                        y: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 20
                        spacing: 20

                    }
                }
            }

            footer:Rectangle{
                height: 40
                width: parent.width
                color: Universal.background
                Text{
                    enabled: false
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    text: "Show Data"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    color: Universal.foreground
                    opacity: enabled ? 1.0 : 0.4
                    MouseArea {
                        anchors.fill: parent

                    }
                }
            }
        }
    }
}
