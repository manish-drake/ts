import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1


Item{
    anchors.fill: parent
    GridView{
        id: grid
        anchors.fill: parent
        anchors.margins: 5
        cellHeight: 200
        cellWidth: width/2;
        model: testModel
        delegate: testCardDelegate
        focus: true
        highlightMoveDuration: 0
        highlight:Item{
            Rectangle{
                anchors.fill: parent
                anchors.margins: 5
                color: "transparent"
                border.color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                border.width: 1
                radius:3
            }
        }
        Component{
            id: testCardDelegate
            Item{
                height: grid.cellHeight
                width: grid.cellWidth
                Rectangle {
                    id: wrapper
                    anchors.fill: parent
                    anchors.margins: 5
                    color: Universal.background
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 3
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4
                        color: "#26000000"
                        spread: 0
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: grid.currentIndex = index
                        onDoubleClicked:navigationModel.setCurrentView(navigationModel.getTargetView("_test", id), {"title":name});
                    }
                    GridLayout{
                        anchors.fill: parent
                        anchors.margins: 10
                        rowSpacing: 0
                        columnSpacing: 0
                        clip: true
                        Item{
                            Layout.row:0
                            Layout.fillWidth: true
                            height: 25
                            GridLayout{
                                anchors.fill: parent
                                rowSpacing: 0
                                columnSpacing: 0
                                Item{
                                    Layout.column: 0
                                    Layout.fillHeight: true
                                    width: 35
                                    Image {
                                        id: guideImage
                                        anchors.centerIn: parent
                                        source: "qrc:/img/img/Info-24.png"
                                    }
                                    ColorOverlay {
                                        anchors.fill: guideImage
                                        source: guideImage
                                        color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: guidePopup.open()
                                        onPressed: parent.opacity = 0.5
                                        onReleased: parent.opacity = 1
                                    }
                                }

                                Item{
                                    Layout.column: 1
                                    Layout.fillHeight: true
                                    width: 35
                                    Image {
                                        id: saveImage
                                        anchors.centerIn: parent
                                        source: "qrc:/img/img/Download-22.png"
                                    }
                                    ColorOverlay {
                                        anchors.fill: saveImage
                                        source: saveImage
                                        color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            //  popupCenter.open()
                                        }
                                        onPressed: parent.opacity = 0.5
                                        onReleased: parent.opacity = 1
                                    }
                                }

                                Item{
                                    Layout.column: 2
                                    Layout.fillWidth: true
                                }

                                Item{
                                    Layout.column: 3
                                    Layout.fillHeight: true
                                    width: 35
                                    Image {
                                        id: favImage
                                        anchors.centerIn: parent
                                        source: "qrc:/img/img/Star Filled-20.png"
                                    }
                                    ColorOverlay {
                                        anchors.fill: favImage
                                        source: favImage
                                        color: "#666666"
                                    }
                                }

                                GridLayout {
                                    id: gridLayout1
                                    Layout.column: 4
                                    Layout.fillHeight: true
                                    columnSpacing: 5
                                    Image {
                                        id: album
                                        anchors.verticalCenter: parent.verticalCenter
                                        source: "qrc:/img/img/album.png"
                                    }
                                    ColorOverlay {
                                        anchors.fill: album
                                        source: album
                                        color: "#666666"
                                    }
                                    Text {
                                        Layout.column: 1
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: "7"
                                        font.pointSize: 10
                                        color: "#666666"
                                        font.bold: true
                                    }
                                }
                            }
                        }
                        Item{
                            Layout.row: 1
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                elide:Text.ElideRight
                                text: name
                                font.pointSize: 12
                                font.weight: Font.DemiBold
                                clip:true
                                color: Universal.foreground
                            }
                        }
                        Item{
                            Layout.row: 2
                            height: 50
                            Layout.fillWidth: true

                            Text {
                                anchors.left:parent.left
                                anchors.right:parent.right
                                elide:Text.ElideRight
                                text: "RECENT TEST RESULTS"
                                font.pointSize: 10
                                color: Universal.foreground
                                opacity: 0.8
                            }
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id: guideDialog
        anchors.fill: parent
        color: "#33000000"
        visible: false
        Item{
            anchors.fill: parent
            anchors.topMargin: 70
            anchors.bottomMargin: 70
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            Popup {
                id: guidePopup
                height: parent.height
                width: parent.width
                padding: 0
                modal: true
                focus: true
                clip: true
                closePolicy: Popup.CloseOnEscape
                onClosed: { guideDialog.visible = false }
                onOpened: { guideDialog.visible = true }
                contentItem: TestGuide{}
            }
        }
    }
}
