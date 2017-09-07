import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls.Universal 2.1

Item {
    ColumnLayout{
        anchors.fill: parent
        Item {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 65
            Item{
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                width: 65
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 11
                    radius: 4
                    color: Universal.theme == Universal.Light ? "#66ffffff" : "#33000000"
                    Image {
                        id:toggleMenuImg
                        anchors.centerIn: parent
                        source: "qrc:/img/img/Menu-25.png"
                    }
                }
                MouseArea {
                    id: toggleMenuMouseArea
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                    onClicked: sideMenuDrawer.open()
                }
            }
            Item{
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: 65
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 11
                    radius: 4
                    color: menuMouseArea.pressed ? "#80aaaaaa" : "transparent"
                    Column{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter:  parent.verticalCenter
                        spacing: 3
                        Rectangle{
                            color: Universal.accent
                            height: 5
                            width: 5
                            radius: 2
                        }
                        Rectangle{
                            color: Universal.accent
                            height: 5
                            width: 5
                            radius: 2
                        }
                        Rectangle{
                            color: Universal.accent
                            height: 5
                            width: 5
                            radius: 2
                        }
                    }
                }
                MouseArea {
                    id: menuMouseArea
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.4
                    onReleased: parent.opacity = 1
                    onClicked: {
                        menuPopup.open()
                        console.log("TODO: add code for right menu");
                    }
                }
            }
        }
        Image {
            Layout.alignment: Qt.AlignHCenter
            source: "qrc:/img/img/profile-circle.png"
        }
        Text{
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 5
            text: currentUser
            font.pixelSize: 16
            font.weight: Font.Thin
            opacity: 0.5
            color: Universal.foreground
        }
        Rectangle{
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 25
            Layout.bottomMargin: 15
            width: 40
            height: 1
            color: Universal.foreground
            opacity: 0.2
        }
        TestGroup{isHome: true}
    }
}
