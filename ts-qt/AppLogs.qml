import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
//import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        anchors.fill: parent
        header: Rectangle{
            height: 40
            anchors.left:parent.left
            anchors.right:parent.right
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Text {
                id: testTitle
                anchors.centerIn: parent
                text: qsTr("App Logs")
                font.pixelSize: 16
                font.weight: Font.DemiBold
                color: Universal.foreground
                font.family: robotoRegular.name
            }
            Item{
                width: 50
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.rightMargin: 10
                visible: repeater1.count != 0
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
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                    onClicked:{}
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
                    Repeater{
                        id: repeater1
//                        model: loggingModel
                        RowLayout{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            spacing: 10
                            Text {
                                Layout.fillWidth: true
                                text: data1
                                font.pixelSize: 12
                                color: Universal.foreground
                                wrapMode: Text.Wrap
                                clip: true
                                font.family: robotoRegular.name
                            }
                            Text {
                                Layout.column: 1
                                Layout.alignment: Qt.AlignTop
                                text: msgType
                                font.pixelSize: 12
                                color: Universal.foreground
                                font.family: robotoRegular.name
                            }
                        }
                    }                    
                }
            }
        }
    }
}

