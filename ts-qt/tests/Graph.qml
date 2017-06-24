import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Page {
    id: item1
    anchors.fill: parent
    header: Rectangle{
        id:testHeaderRect
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        color: Universal.background
        Item{
            id: rectangle1
            height:25
            width: 25
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/View Details-25.png"
                ColorOverlay{
                    anchors.fill: parent
                    source: parent
                    color: Universal.foreground
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Scan")
            }
        }

        Column{
            topPadding: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: title
                text: navigationModel.navigationParameter.title
                font.pixelSize: 16
                font.weight: Font.DemiBold
                anchors.horizontalCenter: parent.horizontalCenter
                color: Universal.foreground
            }
            PageIndicator {
                id: pageIndicator
                anchors.horizontalCenter: parent.horizontalCenter
                count: 7
                currentIndex: summaryModel.currentPage
                ColorOverlay{
                    anchors.fill: parent
                    source: parent
                    color: Universal.foreground
                    visible: Universal.theme == Universal.Dark
                }
            }
        }



        Item{
            id: rectangle
            height:25
            width: 25
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            anchors.right: parent.right
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
                onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
            }
        }
    }

    contentItem: Rectangle{
        color: Universal.background
        Flickable {
            anchors.fill: parent
            contentWidth: parent.width;
            contentHeight: content.height + content.y + 10
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            Column{
                id: content
                y: 20
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/img/waveform.png"
                }
            }
        }
    }

    footer: Rectangle{
        id:testFooterRect
        height: 80
        anchors.left: parent.left
        anchors.right: parent.right
        color: Universal.background
        Text{
            text:"< PREVIOUS"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: Universal.foreground
            font.pixelSize: 14
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous")
            }

        }
        Rectangle{
            id: toggleButton
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            height: 60
            width: 60
            radius: 30
            color: Universal.accent
            property alias imageSource: buttonImage.source
            state: "play"
            Image {
                id: buttonImage
                anchors.centerIn: parent
                smooth: true
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onPressed: {
                    if (parent.state == "play") {
                        parent.state = "pause"
                    }
                    else if(parent.state == "pause"){
                        parent.state = "stop"
                    }
                    else{
                        parent.state = "play"
                    }
                }
            }
            states: [
                State {
                    name: "play"
                    PropertyChanges {
                        target: toggleButton
                        imageSource: "qrc:/img/img/play-button.png"
                    }
                },
                State {
                    name: "stop"
                    PropertyChanges {
                        target: toggleButton
                        imageSource: "qrc:/img/img/stop-button.png"
                    }
                },
                State {
                    name: "pause"
                    PropertyChanges {
                        target: toggleButton
                        imageSource: "qrc:/img/img/pause-button.png"
                    }
                }
            ]
        }
        Text {
            text: qsTr("NEXT >")
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            color: Universal.foreground
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    navigationModel.currentView = navigationModel.getTargetView("Next")
                }
            }
        }
    }
}
