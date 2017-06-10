import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
        Page{
            anchors.fill: parent
            header: Rectangle{
                id:testHeaderRect
                height: 60
                anchors.left: parent.left
                anchors.right: parent.right
                color: Universal.background
                Image {
                    id: viewImage
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 20
                    source: "qrc:/img/img/Help Filled-25.png"
                }
                ColorOverlay{
                    anchors.fill: viewImage
                    source: viewImage
                    color: Universal.foreground
                }

                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        id: title
                        text: "ADS-B Velocity Test"
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: Universal.foreground
                    }
                    Text {
                        text: "HELP"
                        font.pointSize: 12
                        anchors.topMargin: 40
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: Universal.foreground
                    }
                }
                 Item{
                    id: rectangle
                    height:25
                    width: 25
                    Layout.fillHeight: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 10
                    anchors.right: parent.right
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
                        onClicked: helpPopup.close()
                    }
                }
            }

            contentItem: Rectangle {
                color: Universal.background
                Flickable {
                    anchors.left: parent.left
                    anchors.right: parent.right
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
                        Image {
                            id: planeImage
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "qrc:/img/img/aeroplane.png"
                            ColorOverlay{
                                anchors.fill: planeImage
                                source: planeImage
                                color: Universal.foreground
                            }
                        }
                        Text{
                            font.pixelSize: 14
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.wordSpacing: 5
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


