import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
//import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        anchors.fill: parent
        header:Rectangle {
            id: content
            height: 48
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Rectangle{
                id: toggleMenu
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                width: 50
                color: toggleMenuMouseArea.pressed ? "#80aaaaaa" : "transparent"
                Image {
                    id:toggleMenuImg
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Menu-25.png"
                }
        //        ColorOverlay{
        //            anchors.fill: toggleMenuImg
        //            source: toggleMenuImg
        //            color: Universal.accent
        //        }
                MouseArea {
                    id: toggleMenuMouseArea
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                    onClicked: sideMenuDrawer.open()
                }
            }
            Text {
                id: headerTitleText
                text: "App Logs"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                anchors.rightMargin: 40
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
                width: 50
                color: deleteMouseArea.pressed ? "#80aaaaaa" : "transparent"
                enabled: false
                opacity: enabled ? 1 : 0.4
                Image {
                    id: image1
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Upload to the Cloud-25.png"
                }
//                ColorOverlay{
//                    anchors.fill: image1
//                    source: image1
//                    color: Universal.foreground
//                }
                MouseArea {
                    id: deleteMouseArea
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.5
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
                contentWidth: parent.width;
                contentHeight: grid.height + grid.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Column {
                    id: grid
                    y: 15
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 12
                    spacing: 10
                    RowLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        visible: repeater1.count != 0
                        Text {
                            Layout.fillWidth: true
                            text: qsTr("MESSAGE")
                            font.pixelSize: 12
                            font.bold: Font.Medium
                            color: Universal.foreground
                            font.family: robotoRegular.name
                        }
                        Text {
                            Layout.column: 1
                            text: qsTr("TYPE")
                            font.pixelSize: 12
                            font.bold: Font.Medium
                            color: Universal.foreground
                            font.family: robotoRegular.name
                        }
                    }
                    ListView{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 200
                        id: repeater1
                        model: loggingModel.logs()
                        delegate: Rectangle {
                            height: 15
                                Text {
                                    Layout.fillWidth: true
                                    text: modelData
                                    font.pixelSize: 12
                                    color: Universal.foreground
                                    wrapMode: Text.Wrap
                                    font.family: robotoRegular.name
                                }
                            }
//                        RowLayout{
//                            anchors.left: parent.left
//                            anchors.right: parent.right
//                            spacing: 10
//                            Text {
//                                Layout.fillWidth: true
//                                text: data1
//                                font.pixelSize: 12
//                                color: Universal.foreground
//                                wrapMode: Text.Wrap
//                                clip: true
//                                font.family: robotoRegular.name
//                            }
//                            Text {
//                                Layout.column: 1
//                                Layout.alignment: Qt.AlignTop
//                                text: msgType
//                                font.pixelSize: 12
//                                color: Universal.foreground
//                                font.family: robotoRegular.name
//                            }
//                        }
                    }
                }
            }
        }
    }
}

