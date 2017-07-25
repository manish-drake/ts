import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
//import QtGraphicalEffects 1.0

Item {
    Page{
        anchors.fill: parent
        header: Rectangle{
            id:testHeaderRect
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Item{
                id: rectangle1
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 25
                opacity: 0.4
                Image {
                    id: viewImage
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Help Filled-25.png"
                }
//                ColorOverlay{
//                    anchors.fill: viewImage
//                    source: viewImage
//                    color: Universal.foreground
//                }
            }

            Column{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: title
                    text: "ADS-B Velocity Test"
                    font.pixelSize: 16
                    font.weight: Font.DemiBold
                    font.family: robotoRegular.name
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
                }
                Text {
                    text: "HELP"
                    font.pixelSize: 16
                    anchors.topMargin: 40
                    font.weight: Font.DemiBold
                    font.family: robotoRegular.name
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
                }
            }
            Item{
                id: rectangle
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: 50
                Image {
                    id: closeImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Delete-25.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: helpPopup.close()
                }
            }
        }

        contentItem: Rectangle {
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                clip: true
                boundsBehavior: Flickable.StopAtBounds
                GridLayout{
                    id: grid
                    y: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    rowSpacing: 20
                    Image {
                        id: planeImage
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "qrc:/img/img/aeroplane.png"
                    }
//                    ColorOverlay{
//                        anchors.fill: planeImage
//                        source: planeImage
//                        color: Universal.foreground
//                    }
                    Text{
                        Layout.row: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 14
                        font.wordSpacing: 5
                        font.family: robotoRegular.name
                        horizontalAlignment: Text.AlignHCenter
                        color: Universal.foreground
                        text:"<p> Lorem ipsum dolor sit amet, consectetur<br>
                              adipiscing elit. Fusce vel felis justo. Nam<br>
                              consectetur auctor lorem non<br>
                              condimentum. Fusce sodales metus et<br>
                              consequat fermentum. Curabitur luctus<br>
                              sit amet turpis eget condimentum. Cras<br>
                              aliquet sapien ante, in volutpat orci<br>
                              gravida non.<p/>"
                    }
                }
            }
        }
    }
}


