import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {
    Rectangle{
        anchors.fill: parent
        Page{
            anchors.fill: parent
            header: Rectangle{
                id:testHeaderRect
                height: 60
                width: parent.width
                color:"transparent"
                Image {
                    id: viewImage
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 20
                    source: "qrc:/img/img/Help Filled-25.png"
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
                    }
                    Text {
                        text: "HELP"
                        font.pointSize: 12
                        anchors.topMargin: 40
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                }
            }


            contentItem:
                    Column{
                        spacing: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        Image {
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "qrc:/img/img/aeroplane.png"
                        }

                        Text{
                            font.pixelSize: 14
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.wordSpacing: 5
                            horizontalAlignment: Text.AlignHCenter
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

            footer:Rectangle{
                height: 40
                width: parent.width
                color:"transparent"
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    text: "CLOSE"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    MouseArea {
                        anchors.fill: parent
                        onClicked: helpPopup.close()
                    }
                }
            }
        }
    }
}

