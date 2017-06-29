import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    anchors.fill: parent
    property string guideTestName

    ListView{
        id: grid
        anchors.fill: parent
        anchors.margins: 8
        model: testModel
        delegate: testCardDelegate
        focus: true
        highlightMoveDuration: 0
        highlight:Item{
            Rectangle{
                anchors.fill: parent
                anchors.margins: 2
                color: "transparent"
                border.color: Universal.accent
                border.width: 1
                radius:4
            }
        }

        Component{
            id: testCardDelegate
            Item{
                anchors.left:parent.left
                anchors.right: parent.right
                height:100
                Rectangle {
                    id: wrapper
                    anchors.fill: parent
                    anchors.margins: 3
                    color: Universal.background
                    radius: 4
                    MouseArea {
                        anchors.fill: parent
                        onClicked: grid.currentIndex = index
                        onDoubleClicked: navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Short");
                    }
                    ColumnLayout{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 5
                        anchors.bottomMargin: 5
                        clip: true
                        spacing: 10
                        RowLayout{
                            Text {
                                Layout.fillWidth: true
                                elide:Text.ElideRight
                                text: name
                                font.pixelSize: 16
                                font.weight: Font.ExtraBold
                                color: Universal.accent
                            }
//                            Item{
//                                Layout.column: 1
//                                width: 35
//                                height: 35
//                                Image {
//                                    id: favImage
//                                    anchors.centerIn: parent
//                                    source: "qrc:/img/img/Star Filled-20.png"
//                                }
//                                ColorOverlay {
//                                    anchors.fill: favImage
//                                    source: favImage
//                                    color: "#666666"
//                                }
//                            }
                        }
                        Item{
                            Layout.row: 1
                            Layout.fillHeight: true
                            Text {
                                elide:Text.ElideRight
                                text: "RECENT TEST RESULTS"
                                font.pixelSize: 12
                                font.weight: Font.Bold
                                color: Universal.foreground
                                opacity: 0.4
                            }
                        }
                    }
                }
            }
        }
    }
}
