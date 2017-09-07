import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        anchors.fill: parent
        header:Rectangle {
            id: content
            height: 55
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Rectangle{
                id: toggleMenu
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                width: 70
                color: toggleMenuMouseArea.pressed ? "#80aaaaaa" : "transparent"
                Image {
                    id:toggleMenuImg
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Menu-25.png"
                }
                MouseArea {
                    id: toggleMenuMouseArea
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.4
                    onReleased: parent.opacity = 1
                    onClicked: sideMenuDrawer.open()
                }
            }
            Text {
                id: headerTitleText
                text: "App Logs"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 70
                anchors.right: parent.right
                anchors.rightMargin: 70
                font.bold: Font.DemiBold
                color: Universal.accent
                font.pixelSize: 18
                font.family: robotoRegular.name
                elide: Text.ElideRight
            }
            Rectangle{
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 70
                color: deleteMouseArea.pressed ? "#80aaaaaa" : "transparent"
                enabled: false
                opacity: enabled ? 1 : 0.4
                Image {
                    id: image1
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Upload to the Cloud-25.png"
                }
                MouseArea {
                    id: deleteMouseArea
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.4
                    onReleased: parent.opacity = 1
                    onClicked: {}
                }
            }
        }

        contentItem: Rectangle {
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Text {
                anchors.centerIn: parent
                elide:Text.ElideRight
                text: "No log data"
                font.pixelSize: 12
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.3
                visible: repeater1.count == 0
            }
            Flickable {
                anchors.fill: parent
                contentWidth: width
                contentHeight: grid.height + grid.y + 10
                boundsBehavior: Flickable.StopAtBounds
                ColumnLayout {
                    id: grid
                    y: 15
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 12
                    spacing: 10
                    Repeater{
                        id: repeater1
                        model: loggingModel.logs()
                        Text {
                            Layout.fillWidth: true
                            Layout.bottomMargin: 4
                            text: modelData
                            font.pixelSize: 12
                            color: Universal.foreground
                            wrapMode: Text.Wrap
                            font.family: robotoRegular.name
                        }
                    }
                }
            }
        }
    }
}

